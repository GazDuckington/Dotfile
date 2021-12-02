set fish_greeting

set PATH ~/.local/bin $PATH

set EDITOR nvim $EDITOR

alias 'br'='~/scripts/vr'
alias 'ls'='lsd'
alias 'la'='lsd -a'
alias 'll'='lsd -l'
alias 'tree'='lsd --tree'
alias 'vim'='nvim'
alias 'lv'='lvim'
alias 'code'='codium'
alias 'c'='codium'
alias 'ga'='git add'
alias 'gc'='git commit'
alias 'gp'='git push'
alias 'i'='yay -S --noconfirm'
alias 's'='yay -Ss'
alias 'f'='yay -Si'
alias 'r'='yay -Rs --noconfirm'
alias 'ar'='yay -Rs (yay -Qtdq)'

if status --is-interactive
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end

function lolban
  figlet -f ansi-shadow $argv | lolcat
end

starship init fish | source
