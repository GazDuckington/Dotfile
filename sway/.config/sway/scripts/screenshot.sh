#!/bin/sh
 
export XCURSOR_THEME="Qogir-dark"
export XCURSOR_SIZE=10

output="Display"
area="Area"
window="Window"
prompt="  Scrot "
rofi="rofi -dmenu -no-show-icons -p"
 
selected=$(printf '%s\n%s\n%s\n' "$output" "$area" "$window" | $rofi "$prompt")
 
swayshot_output() {
	display=$(swaymsg -t get_outputs | jq -r '.[].name' | $rofi "$prompt")
	 if [[ -n "$display" ]]; then
        swayshot display "$display"
    fi
}

case $selected in
  "$output")
    swayshot_output;;
  "$area")
    swayshot region;;
  "$window")
		swayshot window;;
esac
