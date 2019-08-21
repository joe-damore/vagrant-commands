require 'pathname'

module VagrantCommands
  class Config < Vagrant.plugin('2', :config)
    attr_accessor :path

    def initialize
      @path = UNSET_VALUE
    end

    def finalize!
      conf = './vagrant-commands.yaml'
      @path = conf if @path == UNSET_VALUE
    end
  end
end
