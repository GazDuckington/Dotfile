#  ████████ ██ Gaz's   ██    
# ░██░░░░░ ░░         ░██    
# ░██       ██  ██████░██    
# ░███████ ░██ ██░░░░ ░██████
# ░██░░░░  ░██░░█████ ░██░░░██  
# ░██      ░██ ░░░░░██░██  ░██  
# ░██      ░██ ██████ ░██  ░██  
# ░░       ░░ ░░░░░░  ░░   ░░ 

set fish_greeting

export CHROME_EXECUTABLE=/usr/bin/brave
export CHROME_PATH=/usr/bin/brave
# export BROWSER=firefox
set PATH /home/gaz/z/z.sh $PATH
set PATH /home/gaz/z/ $PATH
set PATH /root/.local/bin $PATH
set PATH /home/gaz/.emacs.d/bin $PATH
set PATH /home/gaz/.config/rofi/bin $PATH
set PATH /home/gaz/.local/bin $PATH
# android sdk
set PATH /home/gaz/Android $PATH
set PATH /home/gaz/Android/cmdline-tools/tools $PATH
set PATH /home/gaz/Android/cmdline-tools/tools/bin $PATH
set PATH /home/gaz/Android/platform-tools $PATH
# flutter
set PATH /home/gaz/flutter $PATH
set PATH /home/gaz/flutter/bin $PATH

#set CHROME_EXECUTABLE /usr/bin/chromium $CHROME_EXECUTABLE
#set CHROME_PATH /usr/bin/chromium $CHROME_PATH
set PATH /usr/bin/chromium $PATH

alias rel="omf reload"
alias update="yay -Syyu --noconfirm"
alias ms="devour kitty --class 'musikcube' -- 'musikcube'"
alias vn="viewnior"
alias s="yay -Ss"
alias S="sudo aura -S"
alias A="sudo aura -A"
alias SN="sudo aura -S --noconfirm"
alias AN="sudo aura -A --noconfirm"
alias R="sudo aura -R"
alias matrix="unimatrix -s 97"
alias lolmatrix="matrix|lolcat"
alias c="codium"
alias v="nvim"
alias ls="lsd"
alias ll="lsd --long"
alias lt="lsd --tree"
alias wg="wget"
alias cl="curl"
alias py="python"
alias 38="python3.8"
alias pynv="pipenv shell"

function lol
    figlet -f ANSI\ Shadow "$argv" | lolcat
end

starship init fish | source
