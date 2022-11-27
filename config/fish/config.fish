# set greeting text
set fish_greeting

set fish_plugins vi-mode
set vi_mode_default vi_mode_normal

# aliases
alias 'g'='git'
alias 'code'='code'
alias 'c'='code'
alias 'nv'='nvim'
alias 'v'='nvim'
alias 'hx'='helix'
alias 'fzf'='fzf --layout reverse --border rounded --ansi'
alias 'pm'='pulsemixer'
alias 'cl'='clear'

alias 'server'='python -m http.server'
alias 'br'='br.sh'
alias 'rm'='trash'
alias 'cpr'='cp -r'
alias 'ls'='lsd'
alias 'la'='lsd -a'
alias 'll'='lsd -l'
alias 'lt'='lsd --tree'

alias 'lg'='lazygit'
alias 'ga'='git add'
alias 'gc'='git commit -am'
alias 'gp'='git push'

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
	make -p $argv
	cd $argv
end

# set variables
bass source ~/.profile

# pyenv init
# pyenv init - | source
