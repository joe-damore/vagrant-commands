module VagrantCommands
  module Util
    def self.config(env)
      if Gem::Version.new(::Vagrant::VERSION) >= Gem::Version.new('1.5')
        return env.vagrantfile.config.config
      end
      env.config_global.config
    end
  end
end
