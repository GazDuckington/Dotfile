#!/bin/bash
# You can call this script like this:
# $./volume up
# $./volume down
# $./volume mute

DIR="$HOME/.config/dunst"

function get_volume() {
    pamixer --get-volume
}

function is_mute() {
    pamixer --get-mute >/dev/null
}

function send_notification() {
    volume=$(get_volume)
    bar=$(seq -s "─" 0 $(($volume / 5)) | sed 's/[0-9]//g')

    # Send the notification
    # dunstify " Volume " "$bar" -i $icon_name -r 5555 -u normal
    dunstify "Volume $volume% " -r 5555 -u normal -h int:value:$(($volume))
    # notify-send.sh "Volume : $volume" -i "$icon_name" -t 2000 --replace=555
}

case $1 in
up)
    pactl set-sink-volume @DEFAULT_SINK@ +5% >/dev/null
    send_notification
    ;;
down)
    pactl set-sink-volume @DEFAULT_SINK@ -5% >/dev/null
    send_notification
    ;;
mute)
    # Toggle mute
    pactl set-sink-mute @DEFAULT_SINK@ toggle >/dev/null
    if is_mute; then
        dunstify "Speakers muted" -r 5555 -u normal -h int:value:0
    else
        send_notification
    fi
    ;;
micmute)
    # Toggle mute
    pactl set-source-mute @DEFAULT_SOURCE@ toggle >/dev/null
    if is_mute; then
        dunstify "Mic. toggled" -u normal -h int:value:0
    else
        send_notification
    fi
    ;;
esac
