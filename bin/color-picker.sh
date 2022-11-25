#!/usr/bin/sh
xcolor -s | xsel -b
notify-send $(xsel -bo) -t 1000 -a "Color Picker"
