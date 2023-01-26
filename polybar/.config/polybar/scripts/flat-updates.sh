#!/bin/sh

. /home/gaz/.config/dk/color.sh

updates=$(echo 'n' | flatpak update 2>/dev/null | tail -n +5 | head -2 | wc -l)

if [ "$updates" -gt 0 ]; then
  echo " $updates"
else
  echo ""
fi
