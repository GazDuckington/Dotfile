#!/usr/bin/env bash
PROFILE=$(powerprofilesctl get)

if [ $PROFILE == "balanced" ]; then
    echo "%{F#67b0e8}%{F-}"
elif [ $PROFILE == "performance" ]; then
    echo "%{F#e5c76b}ﴞ%{F-}"
elif [ $PROFILE == "power-saver" ]; then
    echo "%{F#8ccf7e}%{F-}"
fi
