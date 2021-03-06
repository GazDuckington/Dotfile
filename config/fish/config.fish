# set greeting text
set fish_greeting

set fish_plugins vi-mode
set vi_mode_default vi_mode_normal

# aliases
alias 'g'='git'
alias 'code'='code'
alias 'c'='code'
alias 'lv'='lvim'
alias 'nv'='nvim'
alias 'v'='neovide --multigrid'
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

# startx on tty1
if status --is-interactive
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
end

# paths
set PATH ~/go/bin ~/bin ~/.nimble/bin ~/.npm-global/bin ~/.pyenv/bin ~/.local/bin ~/.cargo/bin /usr/sbin $PATH
export PATH="$PATH:$PATH"
bass source ~/.bashrc

# pnpm
export PNPM_HOME="/home/gaz/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# pyenv init
pyenv init - | source

# starship prompt
starship init fish | source
