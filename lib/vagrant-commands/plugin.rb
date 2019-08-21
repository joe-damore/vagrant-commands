require 'vagrant'
require 'vagrant-commands'
require 'vagrant-commands/version'
require 'vagrant-commands/commands/custom'
require 'vagrant-commands/commands/commands'

require 'yaml'

class VagrantCommands::Plugin < Vagrant.plugin("2")
  name "Commands"

  description <<-DESC
  This plugin allows custom commands to be added
  to Vagrant environments using YAML.
  DESC

  if File.exist?('vagrant-commands.yml')
    vagrantCommands = YAML.load_file('vagrant-commands.yml');
    vagrantCommands['commands'].each { |commandItem|
      command commandItem['name'] do
        # Commands::Commands
        Commands::custom_command(commandItem['name'], commandItem)
      end
    }
  end
end
