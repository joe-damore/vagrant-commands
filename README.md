# Vagrant Commands
Vagrant plugin for custom console commands

## Overview
Vagrant Commands allows you to define arbitrary subcommands for your Vagrant development environments, allowing you to execute scripts on your Vagrant guests using custom interfaces defined in YAML.

## Installation
To install, run `vagrant plugin install vagrant-commands`

## Usage
The plugin looks for a **vagrant-commands.yml** file in the same directory as your vagrantfile. An example **vagrant-commands.yml** file might be:

    commands:
      - name: hello
        synopsis: say "Hello, World!"
        machine: default
        exec:
          command: echo "Hello, World!"
          
      - name: restart
        synopsis: restart Apache service
        machine: default
        exec:
          command: systemctl restart httpd.service

Commands defined in **vagrant-commands.yml** will be shown in the Vagrant help screen like all other commands.

## Limitations
This plugin has only been confirmed working with environments that use a single virtual machine. Basic support for multi-machine environments has been implemented but has not been confirmed working.

Because this plugin currently relies on SSH to execute commands, it is not compatible with Windows guests.

## Going Forward
I'd like to make additions and improvements to this plugin in the future. Some things I'd like to implement sometime soon, in no particular order:
* Test and improve functionality for environments with multiple machines
* Improve compatibility with Windows guests by using WinRM instead of SSH
* Allow commands to be defined in **vagrant-commands.yml** that are executed locally instead of in the guest
* Allow configuration file path (e.g. **vagrant-commands.yml**) to be changed in vagrantfile
