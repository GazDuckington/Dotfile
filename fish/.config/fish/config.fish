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

# if uwsm check may-start; and uwsm select
#     exec systemd-cat -t uwsm_start uwsm start default
# end

starship init fish | source
