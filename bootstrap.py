#!/usr/bin/env python3
exclude = ["alacritty", "tmux"]

import json
from pathlib import Path
from os import path, listdir, symlink

# this script's dir'
dir_path = path.dirname(path.realpath(__file__))
# configuration file
conf_file = path.join(f'{dir_path}/dot_config.json')
# dotfiles location
dot_files = path.join(f'{dir_path}/config')
bin_files = path.join(f'{dir_path}/bin')
fir_files = path.join(f'{dir_path}/chrome')
home_bin = path.join(f'{Path.home()}/bin')
xdg_config_home = path.join(f'{Path.home()}/.config')
# check if file configuration exists
conf_file_exists: bool = path.exists(conf_file)
bin_file_exists: bool = path.exists(home_bin)
# lsit of config files in dot_files
configs = listdir(dot_files)

def install_bin():
    """install scripts to home directory"""
    if not bin_file_exists:
        print(f"linking {bin_files} to {home_bin}...")
        symlink(bin_files, home_bin)
        return

    print(f"scripts are installed in {home_bin}")

def is_dot(str: str) -> bool:
    """check if file is a dotfile."""
    return str.startswith('.')

def setup():
    """setup default dotfile configuration file."""
    json_object = {configs[i]: f'{ Path.home() if is_dot(configs[i]) else xdg_config_home }/{configs[i]}' for i in range(len(configs))}

    if not conf_file_exists:
        print("creating dot_config.json")
        with open(conf_file, 'w') as f:
            json.dump(json_object, f)
        return

    print("dot_config.json exists")

def install_dots():
    """install dotfiles to $XDG_CONFIG_HOME"""
    with open(conf_file, 'r') as f:
        data = json.load(f)

    for key, value in data.items():
        if not path.exists(value) and key not in exclude:
            print("installling dotfiles..")
            dot_loc = path.join(f"{ dot_files }/{ key }")
            print(f"linking {key} to {value}")
            symlink(dot_loc, value)
            return
        print(f"{key} is installed in: {value}")

def main():
    print(f"excluded files: {exclude}")

    setup()
    install_bin()
    install_dots()

if __name__ == "__main__":
    main()
