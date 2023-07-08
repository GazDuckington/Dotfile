#!/bin/bash
# https://github.com/shvedes/dotfiles

function send_notification {
    ICON=" "
    BRIGHTNESS=$(brightnessctl -m | awk -F, '{print $4}' | tr -d %)
    BAR=$(seq -w --separator="❚" 0 "$((${BRIGHTNESS%.*} / 4))" | sed 's/[0-9]//g')
    notify-send -u normal "$ICON ${BRIGHTNESS%.*}% $BAR"  -h string:x-canonical-private-synchronous:backlight
}

case $1 in
    up)
				brightnessctl -c backlight set +5%
        # xbacklight -inc 5
        send_notification
        ;;
    down)
				brightnessctl -c backlight set 5%-
        # xbacklight -dec 5
        send_notification
        ;;
esac
