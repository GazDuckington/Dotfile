set fish_greeting

set PATH ~/.local/bin ~/.cargo/bin $PATH

set EDITOR nvim $EDITOR

alias 'code'='codium'
alias 'c'='codium'
alias 'ga'='git add'
alias 'gc'='git commit'
alias 'gp'='git push'

if status --is-interactive
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end

function lolban
  figlet -f ansi-shadow $argv | lolcat
end

starship init fish | source
