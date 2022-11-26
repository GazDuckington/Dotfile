#!/bin/sh

. ~/.config/dk/color.sh

updates=$(echo 'n' | flatpak update 2>/dev/null | tail -n +5 | head -2 | wc -l)

if (($updates == 0)); then
		echo ""
else
    echo "%{F$green} $updates%{F-}"
fi

