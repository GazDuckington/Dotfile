#!/usr/bin/sh

MUTE="$(amixer get $1 | tail -2 | grep -c '\[on\]')"

if [[ $MUTE > 0 ]]; then
	amixer set $1 toggle &
	notify-send "$1 is Muted" -t 1000
else
	amixer set $1 toggle &
	notify-send "$1 is Unmuted" -t 1000
fi