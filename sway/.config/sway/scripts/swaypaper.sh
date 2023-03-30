#!/bin/sh

WALL=$(/usr/bin/find ~/Pictures/Wallpapers/ -type f | /usr/bin/shuf -n1)
# swaybg -i "$WALL" -m fill &
swww img "$WALL" --transition-type wipe --transition-angle 30 --transition-step 90

