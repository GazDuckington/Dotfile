#!/bin/sh

. ~/.config/dk/color.sh

updates=$(echo 'n' | flatpak update 2>/dev/null | tail -n +5 | head -2 | wc -l)

if [ "$updates" -gt 0 ]; then
    echo "%{F$green} $updates%{F-}"
else
    echo ""
fi
