#!/usr/bin/env bash

rofi_command="rofi -i -matching fuzzy"

# Variable passed to rofi
options="$(ls ~/Dev/)"

chosen="$(echo -e "$options" | $rofi_command -p '  Code ' -dmenu -no-show-icons)"

if ["$chosen" = ""]; then
$chosen
else
$1 ~/Dev/$chosen
fi
