require 'vagrant'
require 'vagrant-commands'
require 'vagrant-commands/version'
require 'yaml'

class VagrantCommands::Plugin < Vagrant.plugin("2")
  name "Commands"

  description <<-DESC
  This plugin allows custom commands to be added
  to Vagrant environments using YAML.
  DESC

  command "commands" do
    require_relative "commands/commands"
    Commands::Commands
  end

end