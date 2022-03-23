set fish_greeting

set PATH ~/.local/bin ~/.cargo/bin /usr/sbin ~/.pyenv/bin $PATH
set EDITOR lvim $EDITOR

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

if status --is-interactive
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end

set ANDROID $HOME/Android $ANDROID
set PATH $ANDROID/cmdline-tools/tools $PATH
set PATH $ANDROID/cmdline-tools/tools/bin $PATH
set PATH $ANDROID/platform-tools $PATH

set ANDROID_SDK $HOME/Android/ $ANDROID_SDK
set PATH $ANDROID_SDK $PATH

set FLUTTER $ANDROID/flutter $FLUTTER
set PATH $FLUTTER/bin $PATH

set JAVA_HOME /usr/lib/jvm/java-8-openjdk/jre $JAVA_HOME
set PATH $JAVA_HOME/bin $PATH

export CHROME_EXECUTABLE=/usr/bin/chromium
export TERM=kitty

pyenv init - | source
pyenv rehash >/dev/null ^&1
#status is-login; and pyenv init --path | source
#status is-interactive; and pyenv init - | source

starship init fish | source
