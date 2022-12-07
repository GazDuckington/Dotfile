#!/usr/bin/sh

. ~/.config/dk/color.sh

result=$(ps -ef | grep "xidlehook" | grep -v "grep" | wc -l)

function startidle() {
  pgrep -x xidlehook >/dev/null || $HOME/cargo/bin/xidlehook \
    --not-when-fullscreen \
    --not-when-audio \
    --timer 600 \
    '~/bin/i3lock-color.sh' \
    '' \
    --timer 1200 \
    'systemctl suspend' \
    '' \
    --socket "/tmp/xidlehook.sock" &

}

function checkidle() {

  if [[ $result == 1 ]]; then
    echo "%{F$overlay0}  %{F-}"
  else
    echo "%{F$green}  %{F-}"
  fi

}

function toggleidle() {

  if [[ $result == 0 ]]; then
    $HOME/bin/idle.sh -s &
    xset dpms &
  else
    xset s off -dpms &
    xset s noblank &
    killall xidlehook &
  fi

}

main() {

  if [[ "$1" == "-s" ]]; then
    startidle
  fi

  if [[ "$1" == "-c" ]]; then
    checkidle
  fi

  if [[ "$1" == "-t" ]]; then
    toggleidle
  fi

}

main $1
