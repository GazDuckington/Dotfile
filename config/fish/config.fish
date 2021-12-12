set fish_greeting

set PATH /root/.cargo/bin ~/.local/bin ~/.cargo/bin /usr/sbin $PATH

set EDITOR lvim $EDITOR

alias 'cpr'='cp -r'
alias 'ls'='lsd'
alias 'la'='lsd -a'
alias 'll'='lsd -l'
alias 'lt'='lsd --tree'
alias 'lv'='lvim'
alias 'nv'='nvim'
alias 'code'='codium'
alias 'c'='codium'
alias 'ga'='git add'
alias 'gc'='git commit -am'
alias 'gp'='git push'

if status --is-interactive
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end

function lolban
  figlet -f ansi-shadow $argv | lolcat
end

function multi-xvf
  for i in ./*.tar.*; tar -xvf $i -C $argv; end
end

function multi-unzip
  for i in ./*.zip; unzip $i -d $argv; end
end

starship init fish | source
