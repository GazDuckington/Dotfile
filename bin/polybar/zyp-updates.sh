#!/usr/bin/sh

updates=$(zypper lu | wc -l)
zupdates=$((updates - 3))

if [ "$zupdates" -gt 0 ]; then
    echo "%{F#50fa7b} $zupdates%{F-}"
else
    echo "%{F#6272a4} $zupdates%{F-}"
fi
