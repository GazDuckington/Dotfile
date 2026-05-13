#!/bin/sh

#WALL=$(/usr/bin/find ~/Pictures/Wallpapers/ -type f | /usr/bin/shuf -n1)
WALL=~/Downloads/sunlight-grass-moewalls-com.gif
# swaybg -i "$WALL" -m fill &
awww img "$WALL" --transition-type grow # --transition-pos 0.977,0.977
#--transition-type wipe --transition-angle 30 --transition-step 90
