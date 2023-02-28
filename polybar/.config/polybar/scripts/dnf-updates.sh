#!/bin/sh

. /home/gaz/.config/dk/color.sh

updates=$(dnf updateinfo -q --list | wc -l)

if [ ! "$updates" ]; then
	return
fi

if [ "$updates" -gt 0 ]; then
  echo " $updates"
else
	echo ""
fi
