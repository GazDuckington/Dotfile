#!/bin/sh

. /home/gaz/.config/dk/color.sh

call=$(echo 'n' | flatpak update 2>/dev/null | wc -l)
updates=$((call - 5))

if [ ! "$updates" ]; then
	return
fi

if [ "$updates" -gt 0 ]; then
  echo " $updates"
else
  echo ""
fi
