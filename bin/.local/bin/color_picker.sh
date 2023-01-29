#!/bin/bash
# Original: https://github.com/mmsaeed509/bspwm-dots/blob/master/bin/colorPicker

# capture the color and save it to the color variable
colorPicker=$(gpick -pso --no-newline)

if [[ -n "$colorPicker" ]]; then

# save as image
image=/tmp/${colorPicker}.png

# copy color code to clipboard
echo "$colorPicker" | tr -d "\n" | xclip -selection clipboard

# generate preview to notify it above screen #
convert -size 64x64 xc:"$colorPicker" "${image}"

# notify color above screen # 
notify-send -u low --replace=69 -i "${image}" "$colorPicker, copied to clipboard."

rm "$image"
else
	notify-send -t 1000 -u low --replace=69 "Color Picker cancelled."
fi
