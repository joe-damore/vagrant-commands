module Commands
  class Commands < Vagrant.plugin('2', :command)

    def self.synonpsis
      'list commands added by vagrant-commands'
    end

    def execute
      puts "Hello, world!"
      0
    end

  end
end
