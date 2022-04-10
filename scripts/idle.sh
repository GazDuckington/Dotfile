#!/usr/bin/env bash

result=$(ps aux | grep -i "scripts/idle.sh -s" | grep -v "grep" | wc -l)

function startidle() {
  xidlehook \
    --not-when-fullscreen \
    --not-when-audio \
    --timer 600 \
    '~/scripts/i3lock.sh' \
    '' \
    --timer 1200 \
    'systemctl suspend' \
    ''

}

function checkidle() {

  if [ $result -ge 1 ]; then
    echo "%{F#6272a4}wake%{F-}"
  else
    echo "%{F#50fa7b}wake%{F-}"
  fi

}

function toggleidle() {

  if [ $result -ge 1 ]; then
    pkill xidlehook &
    dunstify "Staying up" -t 5000
  else
    $HOME/scripts/idle.sh -s &
    dunstify "idle is on" -t 5000
  fi

}

main() {

  if [ "$1" == "-s" ]; then
    startidle
  fi

  if [ "$1" == "-c" ]; then
    checkidle
  fi

  if [ "$1" == "-t" ]; then
    toggleidle
  fi

}

main $1
