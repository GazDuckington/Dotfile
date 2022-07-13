#!/bin/sh

updates=$(echo 'n' | flatpak update 2>/dev/null | tail -n +5 | head -2 | wc -l)

if [ "$updates" -gt 0 ]; then
    echo "%{F#daa640}%{F-} $updates"
else
    echo "%{F#53db7f}%{F-}"
fi
