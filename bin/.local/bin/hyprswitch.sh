#!/usr/bin/env bash
set -euo pipefail

# List all clients: format "address title (class)"
entries=$(hyprctl clients -j | jq -r '.[] | "\(.address) -> \(.title) (\(.class))"')

# If no windows, exit
[ -z "$entries" ] && exit 0

# Show titles in gum choose
selection=$(printf "%s\n" "$entries" \
  | awk -F ' -> ' '{print $2}' \
  | fzf --prompt="Window: " --height=40% --layout=reverse)

# Exit if nothing picked
[ -z "$selection" ] && exit 0

# Map back to address
addr=$(printf "%s\n" "$entries" | awk -F ' -> ' -v sel="$selection" '$2 == sel {print $1}')

# Focus that window
hyprctl dispatch focuswindow address:"$addr"
