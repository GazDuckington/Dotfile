# set greeting text
set fish_greeting

set fish_plugins vi-mode
set vi_mode_default vi_mode_normal

bass source ~/.profile

# aliases
alias 'c'='code'
alias 'code'='code'
alias 'nv'='nvim'
alias 'v'='nvim'
alias 'hx'='helix'
alias 'fzf'='fzf --layout reverse --border rounded --ansi'
alias 'pm'='pulsemixer'
alias 'cl'='clear'
alias 'icat'='kitty +kitten icat'
alias 'j'='jupyter'
alias 'jl'='jupyter-lab'

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

# functions
function ofetch
  if not set -q argv[1]
    onefetch --show-logo never -c 4
  else
    onefetch $argv --show-logo never -c 4
  end
end

function lolban
  figlet -f ANSI\ Shadow $argv | lolcat
end

function lol
	$argv | lolcat
end

function take
	mkdir -p $argv && cd $argv
end

function ginit
	go mod init $MY_GITHUB/$argv
end

function fedora_up
	sudo dnf system-upgrade download --releasever=$argv
end

set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
pyenv init - | source

starship init fish | source
