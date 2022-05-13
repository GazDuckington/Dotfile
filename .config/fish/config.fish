# set greeting text
set fish_greeting

set fish_plugins vi-mode
set vi_mode_default vi_mode_normal

# aliases
alias 'code'='code-insiders'
alias 'c'='code-insiders'
alias 'lv'='lvim'
alias 'nv'='nvim'
alias 'hx'='helix'

alias 'cpr'='cp -r'
alias 'ls'='lsd'
alias 'la'='lsd -a'
alias 'll'='lsd -l'
alias 'lt'='lsd --tree'

alias 'lg'='lazygit'
alias 'ga'='git add'
alias 'gc'='git commit -am'
alias 'gp'='git push'

alias 'up'='sudo zypper up'
alias 'dup'='sudo zypper dup'
alias 'lu'='zypper --no-refresh lu'
alias 'se'='zypper --no-refresh se'
alias 'in'='sudo zypper in'
alias 're'='sudo zypper rm'
alias 'io'='zypper --no-refresh if'
alias 'orphan'='zypper packages --orphaned'
alias 'uneeded'='zypper packages --unneeded'
alias 'refresh'='sudo zypper refresh'

alias 'br'='$HOME/bin/br.sh'

alias 'td'='tdfiglet -jc -f nuclear'

# functions
function ofetch
  if not set -q argv[1]
    onefetch --show-logo never -c 4
  else
    onefetch $argv --show-logo never -c 4
  end
end

#function lolban
#  figlet -f ANSI\ Shadow  $argv | lolcat
#end

# startx on tty1
if status --is-interactive
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end

# paths
set PATH ~/bin ~/.npm-global/bin ~/.pyenv/bin ~/.local/bin ~/.cargo/bin /usr/sbin $PATH

# starship prompt
starship init fish | source
