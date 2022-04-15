#!/usr/bin/env bash

rofi_command="rofi -i -matching fuzzy"

# Variable passed to rofi
options="$(ls ~/Dev/)"

chosen="$(echo -e "$options" | $rofi_command -p '' -dmenu)"

if ["$chosen" = ""]; then
$chosen
else
code-insiders ~/Dev/$chosen
fi
