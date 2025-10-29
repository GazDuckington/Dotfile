#!/bin/bash
# https://github.com/shvedes/dotfiles

function get_volume {
	volume="$(amixer get Master | tail -1 | awk '{print $5}' | sed 's/[^0-9]*//g')"
	echo "$volume"
}

function is_mute {
	mute=$(pactl get-sink-mute @DEFAULT_SINK@ | sed 's/Mute: //')
	echo "$mute"
}

function send_notification {
	soundHigh="  "
	soundMute="  "
	soundZero="  "
	volume=$(get_volume)
	bar=$(seq --separator="❚" 0 "$((volume / 5))" | sed 's/[0-9]//g')
	status=$(is_mute)

	if [ "$status" == "yes" ]; then
		notify-send -r 999 -u normal "$soundMute $(get_volume)% Muted" -t 800
	else
		if [ "$volume" = 0 ]; then
			notify-send -u normal "$soundZero Muted" -t 800 -h string:x-canonical-private-synchronous:volume
		else
			notify-send -u normal "$soundHigh  $(get_volume)% $bar" -t 800 -h string:x-canonical-private-synchronous:volume
		fi
	fi
}

case $1 in
up)
	amixer sset Master 5%+
	send_notification
	;;
down)
	amixer sset Master 5%-
	send_notification
	;;
mute)
	amixer sset Master toggle
	send_notification
	;;
esac
