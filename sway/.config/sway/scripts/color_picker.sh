#!/bin/sh

picker=$(grim -g "$(XCURSOR_THEME=Adwaita XCURSOR_SIZE=10 slurp -p)" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:- | tail -n 1 | cut -d ' ' -f 4)
if [ -n "$picker" ]; then
	tmp=/tmp/${picker}.png
	echo "$picker" | tr -d "\n" | wl-copy
	convert -size 64x64 xc:"$picker" "${tmp}"
	notify-send -t 3500 -u low -r 69 -i "${tmp}" "$picker"
	rm "$tmp"
	exit 1
else
	notify-send -t 3000 -u low -r 69 "Color Picker cancelled."
	exit 1
fi

