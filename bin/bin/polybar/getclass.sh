#!/usr/bin/sh

CLASS=$(xprop -id "$(xdotool getwindowfocus)" wm_class | awk '{gsub(/"/,"", $4); print $4}')

if [ -z "$CLASS" ]; then
	echo "${HOSTNAME^}"
else
	echo "${CLASS^}"
fi
