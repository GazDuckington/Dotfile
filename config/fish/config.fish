# set greeting text
set fish_greeting

# aliases
alias 'code'='code-insiders'
alias 'c'='code-insiders'
alias 'cpr'='cp -r'
alias 'ls'='lsd'
alias 'la'='lsd -a'
alias 'll'='lsd -l'
alias 'lt'='lsd --tree'
alias 'lv'='lvim'
alias 'nv'='nvim'
alias 'ga'='git add'
alias 'gc'='git commit -am'
alias 'gp'='git push'
alias 'br'='$HOME/scripts/br.sh'

# functions
if status --is-interactive
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end

# paths
set PATH ~/.npm-global/bin ~/.pyenv/bin ~/.local/bin ~/.cargo/bin /usr/sbin $PATH

# starship prompt
starship init fish | source
