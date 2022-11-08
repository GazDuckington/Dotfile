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
alias 'v'='glrnvim'
alias 'hx'='helix'
alias 'fzf'='fzf --layout reverse --border rounded --ansi'

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

# set variables
bass source ~/.profile

# pyenv init
pyenv init - | source

# tide prompt settings
# set --universal tide_right_prompt_items git newline jobs
# set --universal tide_left_prompt_items pwd node go virtual_env newline character

# starship prompt
starship init fish | source
