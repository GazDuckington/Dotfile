# set greeting text
set fish_greeting

# aliases
alias 'code'='code-insiders'
alias 'c'='code-insiders'
alias 'lv'='lvim'
alias 'nv'='nvim'

# alias 'onefetch'='onefetch --show-logo never -c 4'
alias 'cpr'='cp -r'
alias 'ls'='lsd'
alias 'la'='lsd -a'
alias 'll'='lsd -l'
alias 'lt'='lsd --tree'

alias 'ga'='git add'
alias 'gc'='git commit -am'
alias 'gp'='git push'

alias 'cu'='checkupdates+aur'
alias 'ys'='yay -Ss'
alias 'yi'='Yay -S'
alias 'yr'='yay -R'
alias 'yrs'='yay -Rs'
alias 'yd'='yay -Si'

alias 'br'='$HOME/scripts/br.sh'

# functions
function ofetch
  if not set -q argv[1]
    onefetch --show-logo never -c 4
  else
    onefetch $argv --show-logo never -c 4
  end
end

# startx on tty1
if status --is-interactive
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end

# paths
set PATH ~/.npm-global/bin ~/.pyenv/bin ~/.local/bin ~/.cargo/bin /usr/sbin $PATH

# starship prompt
starship init fish | source
