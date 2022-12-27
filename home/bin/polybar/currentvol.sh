#!/usr/bin/sh

. /home/gaz/.config/dk/color.sh
vol="$(amixer get Master | tail -1 | awk '{print $5}' | sed 's/[^0-9]*//g')"
mute="$(amixer get Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"

if [ "$mute" = "off" ]; then
	echo "%{F$overlay0}ﱝ muted%{F-}"
elif [ "$vol" = 0 ]; then
	echo "%{F$overlay0}奄 muted%{F-}"
elif [ "$vol" -gt 50 ]||[ "$vol" = 100 ]; then
	echo "%{F$teal}墳 ${vol}%%{F-}"
else
	echo "%{F$teal}奔 ${vol}%%{F-}"
fi
