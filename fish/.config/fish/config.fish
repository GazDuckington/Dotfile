# set greeting text
set fish_greeting

set fish_plugins vi-mode
set vi_mode_default vi_mode_normal

source ~/.config/fish/my_functions.fish

set DOCKER_HOST
source ~/.bashrc.d/paths
source ~/.bashrc.d/aliases

set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
# pyenv init - | source

starship init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
