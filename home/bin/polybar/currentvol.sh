#!/usr/bin/sh

vol="$(amixer get Master | tail -1 | awk '{print $5}' | sed 's/[^0-9]*//g')"
mute="$(amixer get Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"

if [ "$mute" = "off" ]; then
	echo "ﱝ muted"
elif [ "$vol" = 0 ]; then
	echo "奄 ${vol}%"
elif [ "$vol" -gt 50 ]||[ "$vol" = 100 ]; then
	echo "墳 ${vol}%"
else
	echo "奔 ${vol}%"
fi
