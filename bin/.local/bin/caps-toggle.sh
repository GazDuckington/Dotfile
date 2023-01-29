#!/usr/bin/env bash

caps=$(xset -q | grep Caps | awk '{ print $4 }')

capslock_toggle() {
	xdotool key Caps_Lock &
	if [ "$caps" = 'off' ]; then
		dunstify -r 888 "Caps Lock is on." -t 1000
	else
		dunstify -r 888 "Caps Lock is off." -t 1000
	fi
}

capslock_toggle
