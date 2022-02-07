#!/usr/bin/env bash

rofi_command="rofi -i -matching fuzzy"

# Variable passed to rofi
options="$(ls ~/dev/)"

chosen="$(echo -e "$options" | $rofi_command -p 'Select' -dmenu)"

if ["$chosen" = ""]; then
$chosen
else
code-insiders ~/dev/$chosen
fi
