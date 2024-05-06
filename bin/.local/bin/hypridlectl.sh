#!/usr/bin/env bash
function toggle {
	if pgrep "hypridle" > /dev/null
	then
		pkill hypridle
		notify-send -r 5556 -u normal "   Hypridle Inactive"
	else
		hypridle &
		notify-send -r 5556 -u normal "   Hypridle Active"
	fi
}

case $1 in
	toggle)
		toggle
		;;
	*)
		if pgrep "hypridle" > /dev/null
		then
			icon=""
		else
			icon=""
		fi
		printf "%s" "$icon "
		;;
esac
