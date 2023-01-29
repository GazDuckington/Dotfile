#!/bin/bash
# https://github.com/shvedes/dotfiles

function get_status {
    STATUS=$(amixer get Capture | tail -1 | awk '{print $6}' | sed 's/[][]//g')
    echo "$STATUS"
}

function send_notification {
    ICON="  "
    ICON_MUTED="  "
    STATUS=$(get_status)

    if [ "$STATUS" == "off" ]; then
        notify-send -r 999 -u normal "$ICON_MUTED Mic is Muted" -t 5000
    else
        notify-send -r 999 -u normal "$ICON Mic is Unmuted" -t 5000
    fi
}

case $1 in
    toggle) 
        amixer sset Capture toggle
        send_notification
        ;;
esac
