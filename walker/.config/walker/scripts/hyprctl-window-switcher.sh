#!/usr/bin/env bash
set -euo pipefail

# Fetch all visible/mapped clients
entries=$(hyprctl clients -j | jq -r '.[] | select(.mapped == true) | "\(.address) -> \(.title) (\(.class))"')

# If there are no windows, exit silently
[ -z "$entries" ] && exit 0

# Present window list using Walker's dmenu mode (-d)
# Display only the title (and class) to user
selection=$(printf "%s\n" "$entries" |
	awk -F ' -> ' '{print $2}' |
	walker -d --placeholder "Switch to open application")

# Exit if user canceled
[ -z "$selection" ] && exit 0

# Find the corresponding address for the chosen title
addr=$(printf "%s\n" "$entries" | awk -F ' -> ' -v sel="$selection" '$2 == sel {print $1}')

# Focus the selected window
hyprctl dispatch focuswindow address:"$addr"
