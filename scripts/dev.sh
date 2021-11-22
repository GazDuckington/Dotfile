#!/usr/bin/env bash

rofi_command="rofi -i -matching fuzzy"

# Variable passed to rofi
options="$(ls ~/dev/)"

chosen="$(echo -e "$options" | $rofi_command -p 'Select Folder' -dmenu)"

if ["$chosen" = ""]; then
$chosen
else
code ~/dev/$chosen
fi
