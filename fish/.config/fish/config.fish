# set greeting text
set fish_greeting

set fish_plugins vi-mode
set vi_mode_default vi_mode_normal

source ~/.config/fish/myfunc.fish
bass source ~/.profile

# aliases
alias 'c'='code'
alias 'code'='code'
alias 'vim'='nvim'
alias 'nv'='nvim'
alias 'v'='nvim'
alias 'fzf'='fzf --layout reverse --ansi'
alias 'pm'='pulsemixer'
alias 'cl'='clear'
alias 'icat'='kitty +kitten icat'
alias 'j'='jupyter'
alias 'jl'='jupyter-lab'
alias 'f'='lfcd'

alias 'br'='br.sh'
alias 'rm'='trash'
alias 'cpr'='cp -r'
alias 'ls'='lsd'
alias 'la'='lsd -a'
alias 'll'='lsd -l'
alias 'lt'='lsd --tree'
alias 'npm'='pnpm'
alias 'grep'='rg'
alias 'find'='fd'
alias 'docker'='podman'
alias 'server'='python -m http.server'

alias 'g'='git'
alias 'gg'='lazygit'
alias 'ga'='git add'
alias 'gc'='git commit -am'
alias 'gp'='git push'
alias 'gs'='git status'

set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
pyenv init - | source

starship init fish | source
