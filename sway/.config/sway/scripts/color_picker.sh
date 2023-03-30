#!/bin/sh

picker=$(grim -g "$(slurp -p)" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:- | tail -n 1 | cut -d ' ' -f 4)
if [ -n "$picker" ]; then
	tmp=/tmp/${picker}.png
	echo "$picker" | tr -d "\n" | wl-copy
	convert -size 64x64 xc:"$picker" "${tmp}"
	notify-send -t 1500 -u low -r 69 -i "${tmp}" "Copied $picker to clipboard."
	rm "$tmp"
	exit 0
else
	notify-send -t 1000 -u low -r 69 "Color Picker cancelled."
	exit 0
fi

