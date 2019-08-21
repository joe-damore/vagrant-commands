module Commands

  def self.custom_command(name, commandItem)
    return Class.new(Vagrant.plugin('2', :command)) do

      define_singleton_method :synopsis do
        "#{commandItem['synopsis']}"
      end
      
      define_method :initialize do |machine, env|
        super(machine, env)
      end

      define_method :execute do
        with_target_vms(nil) do |machine|
          # If 'machine' configuration not set, set to 'default' by default.
          targetMachine = commandItem['machine']
          if targetMachine == nil
            targetMachine = 'default'
          end

          # Only execute on the targeted machine
          if (machine.name.to_s <=> targetMachine) == 0
            if !machine.communicate.ready?
              # TODO Proper error management
              # See https://github.com/dustymabe/vagrant-sshfs/blob/master/lib/vagrant-sshfs/command.rb:ln38 for inspiration
              puts "Machine is not up yet!"
              next
            end

            if commandItem.has_key?('exec')
              if commandItem['exec'] != nil and commandItem['exec'].has_key?('command')
                options = {}
                options[:extra_args] = ["-t", "#{commandItem['exec']['command']}"]

                Vagrant::Util::SSH.exec(machine.ssh_info, options);
              end
            end
          end
        end
      end
    end
  end
end
