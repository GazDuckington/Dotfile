#!/bin/bash
 
active="Active"
screen="Screen"
output="Output"
area="Area"
window="Window"
# wofi="wofi --style="$HOME"/.config/wofi/style.widgets.css --conf="$HOME"/.config/wofi/config.screenshot"
 
selected=$(printf '%s\n%s\n%s\n%s\n%s\n' "$active" "$screen" "$output" "$area" "$window" | rofi -dmenu -no-show-icons -p "  Scrot ")
 
case $selected in
  "$active")
    /usr/share/sway/scripts/grimshot --notify save active;;
  "$screen")
    /usr/share/sway/scripts/grimshot --notify save screen;;
  "$output")
    /usr/share/sway/scripts/grimshot --notify save output;;
  "$area")
    /usr/share/sway/scripts/grimshot --notify save area;;
  "$window")
    /usr/share/sway/scripts/grimshot --notify save window;;
esac
