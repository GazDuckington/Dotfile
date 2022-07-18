#!/usr/bin/env python3

import subprocess

config_location = "~/.config/fish/config.fish"

alias = input('enter alias for command: ')
command = input('enter the command: ')

cmd = "sed -i '# aliases alias '{}'=\"{}\" {}'".format(alias, command, config_location)
subprocess.call([cmd])
print("adding ", command, "to shell config")
source_command = "source " + config_location
print(source_command)
subprocess.call([source_command])
