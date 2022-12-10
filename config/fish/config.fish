# set greeting text
set fish_greeting

set fish_plugins vi-mode
set vi_mode_default vi_mode_normal

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
alias 'npm'='pnpm'
alias 'docker'='podman'

alias 'br'='br.sh'
alias 'rm'='trash'
alias 'cpr'='cp -r'
alias 'ls'='lsd'
alias 'la'='lsd -a'
alias 'll'='lsd -l'
alias 'lt'='lsd --tree'
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

function take
	mkdir -p $argv && cd $argv
end

bass source ~/.profile

set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
pyenv init - | source

starship init fish | source
