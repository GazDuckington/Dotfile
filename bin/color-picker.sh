#!/usr/bin/sh
gpick -pso -c color_web_hex | xsel -b
notify-send $(xsel -b) -t 1000 -a "Color Picker"
