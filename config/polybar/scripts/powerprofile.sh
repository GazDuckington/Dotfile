#!/usr/bin/env bash
PROFILE=$(powerprofilesctl get)
. ~/.config/dk/color.sh

if [ $PROFILE == "balanced" ]; then
    echo "%{F$blue}%{F-}"
elif [ $PROFILE == "performance" ]; then
    echo "%{F$yellow}ﴞ%{F-}"
elif [ $PROFILE == "power-saver" ]; then
    echo "%{F$green}%{F-}"
fi
