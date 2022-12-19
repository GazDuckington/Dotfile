![desktop](./desktop.png)

# My Dotfile

Run of the mill tiling window manager setup with status bar at the top.

<div styel="display:flex;" align="center">
    <img title="" src="./fetch.png" alt="fetch" data-align="inline">
</div>

- color scheme: [catppuccin](https://github.com/catppuccin/catppuccin) mocha flavor

- status bar: [Polybar](https://github.com/polybar/polybar/)

- menu launcher: [Rofi](https://github.com/davatorium/rofi/)

- sysfetch: [macchina](https://github.com/Macchina-CLI/macchina)

- idle manager: [xidlehook](https://github.com/jD91mZM2/xidlehook)

- wallpaper setter: [hsetroot](https://github.com/himdel/hsetroot)
  
  Wallpaper will randomly select file in `$HOME/Pictures/Wallpapers`

*My Neovim [configuration](https://github.com/GazDuckington/nvim).*

# Installation

**Follow these instruction at your own peril!**

Run `bootstrap.py` to automatically link all files inside `config` folder to it's proper place.

The `bin` directory will be linked to `$HOME/bin` which is in `$PATH`that is appended in the `.profile` file.

To exclude a folder just append folder's name into the `exclude` list on top of `bootstrap.py` file.

In case dotfiles are not installed to it's proper target, delete the `dot_config.json`and run `bootstrap.py`
