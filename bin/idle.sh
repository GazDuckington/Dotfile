#!/usr/bin/sh

. ~/.config/dk/color.sh

result=$(ps -ef | grep "xidlehook" | grep -v "grep" | wc -l)

function startidle() {
  xidlehook \
    --not-when-fullscreen \
    --not-when-audio \
    --timer 600 \
    '~/bin/i3lock-color' \
    '' \
    --timer 1200 \
    'systemctl suspend' \
    '' \
    --socket "/tmp/xidlehook.sock"

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
    $HOME/bin/idle -s &
    xset dpms &
    # notify-send "idle is on" -t 5000
  else
    xset s off -dpms &
    xset s noblank &
    killall xidlehook &
    # notify-send "Staying up" -t 5000
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