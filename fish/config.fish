if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

set PATH ~/flutter/bin $PATH
set PATH ~/Android/tools/bin $PATH

alias 'ls'='lsd'
alias 'll'='lsd -l'
alias 'tree'='lsd --tree'
alias 'vim'='lvim'
alias 'code'='codium'

starship init fish | source
