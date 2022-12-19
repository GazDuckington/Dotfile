#!/usr/bin/env python3

import pathlib
import json
from sys import argv
from os import path, listdir

# this script's dir'
dir_path = path.dirname(path.realpath(__file__))
# configuration file
conf_file = path.join(f'{dir_path}/dot_config.json')
# dotfiles location
dot_files = path.join(f'{dir_path}/config')
bin_files = path.join(f'{dir_path}/bin')
fir_files = path.join(f'{dir_path}/chrome')
# check if file configuration exists
conf_file_exists: bool = path.exists(conf_file)

configs = listdir(dot_files)

def main():
    if not conf_file_exists:
        print("creating config file ...")
        setup()
        print("done!")

    # with open(conf_file, 'r') as js_object:
    #     data = json.load(js_object)
    # print(data)

def is_dot(str: str) -> bool:
    """check if file is a dotfile."""
    return str.startswith('.')

def setup():
    """setup default dotfile configuration file."""
    json_object = {configs[i]: f'{ "$HOME" if is_dot(configs[i]) else "$XDG_CONFIG_HOME" }/{configs[i]}' for i in range(len(configs))}

    with open(conf_file, 'w') as f:
        json.dump(json_object, f)

def add(dot: str, dest: str):
    return f'file: {dot}, target: {dest}'

if __name__ == "__main__":
    main()
