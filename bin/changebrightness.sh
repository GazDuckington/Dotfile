#!/usr/bin/sh

brightness="$(
    printf "%.0f\n" $(xbacklight -get)
)"

xbacklight $1 &
notify-send -a "Change Brightness" -u low -r 666 -h int:value:"$brightness" "brightness: ${brightness}%"