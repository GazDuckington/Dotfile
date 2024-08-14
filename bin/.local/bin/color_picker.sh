#!/bin/bash

# capture the color and save it to the color variable
# colorPicker=$(gpick -pso --no-newline)
colorPicker=$(hyprpicker --autocopy)

if [[ -n "$colorPicker" ]]; then

# save as image
image=/tmp/${colorPicker}.png

# copy color code to clipboard
# echo "$colorPicker" | tr -d "\n" | xsel -ib

# generate preview to notify it above screen #
magick -size 64x64 xc:"$colorPicker" "${image}"

# notify color above screen # 
notify-send -u low -r 69 -i "${image}" " $colorPicker, copied to clipboard."

rm "$image"
else
	notify-send -t 1000 -u low -r 69 "Color Picker cancelled."
fi
