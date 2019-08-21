module Commands
  class Commands < Vagrant.plugin('2', :command)

    def initialize(machine, env)
      super(machine, env)

      #@config = VagrantCommands::Util::config(env)
      #@machine = machine
    end

    def self.synopsis
      'list commands added by vagrant-commands'
    end

    def execute
      with_target_vms(nil) do |machine|
        puts "#{machine}"
        puts "#{machine.name}"
      end
      0
    end

  end
end
