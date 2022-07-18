#!/usr/bin/env bash
PROFILE=$(powerprofilesctl get)

if [ $PROFILE == "balanced" ]; then
    echo "%{F#d2daf4}%{F-}"
elif [ $PROFILE == "performance" ]; then
    echo "%{F#daa640}ﴞ%{F-}"
elif [ $PROFILE == "power-saver" ]; then
    echo "%{F#53db7f}%{F-}"
fi
