#!/usr/bin/sh

. ~/.config/dk/color.sh
vol="$(amixer get Master | tail -1 | awk '{print $5}' | sed 's/[^0-9]*//g')"
mute="$(amixer get Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"

if [[ $mute == "off" ]]; then
	echo "%{F$mgrey}ﱝ muted%{F-}"
elif [[ $vol = 0 ]]; then
	echo "%{F$flamingo}奄 ${vol}%%{F-}"
elif [[ $vol > 50 || $vol = 100 ]]; then
	echo "%{F$flamingo}墳 ${vol}%%{F-}"
else
	echo "%{F$flamingo}奔 ${vol}%%{F-}"
fi
