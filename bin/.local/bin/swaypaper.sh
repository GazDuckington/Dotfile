#!/bin/sh

# WALL=$(/usr/bin/find ~/Pictures/Wallpapers/ -type f | /usr/bin/shuf -n1)
WALL=~/Pictures/1773326426.gif
# swaybg -i "$WALL" -m fill &
awww img "$WALL" --transition-type grow # --transition-pos 0.977,0.977
#--transition-type wipe --transition-angle 30 --transition-step 90
