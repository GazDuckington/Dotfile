#!/usr/bin/env bash
PROFILE=$(powerprofilesctl get)

if [ $PROFILE == "balanced" ]; then
    echo "%{F#54aeff}%{F-}"
elif [ $PROFILE == "performance" ]; then
    echo "%{F#daa640}%{F-}"
elif [ $PROFILE == "power-saver" ]; then
    echo "%{F#53db7f}%{F-}"
fi