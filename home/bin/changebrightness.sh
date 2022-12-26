#!/bin/bash
# https://github.com/shvedes/dotfiles

function send_notification {
    ICON=" "
    BRIGHTNESS=$(xbacklight -get)
    BAR=$(seq -w --separator="❚" 0 "$((${BRIGHTNESS%.*} / 5))" | sed 's/[0-9]//g')
    notify-send -r 999 -u normal "$ICON ${BRIGHTNESS%.*}% $BAR"
}

case $1 in
    up)
        xbacklight -inc 5
        send_notification
        ;;
    down)
        xbacklight -dec 5
        send_notification
        ;;
esac
