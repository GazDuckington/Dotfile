#!/bin/bash

# Fetch a list of windows with their titles and classes
WINDOWS=$(hyprctl -j clients | jq -r '.[] | "\(.title) - \(.class)"')
LINES=$(echo "$WINDOWS" | wc -l)

# Display the list in fuzzel for the user to choose a window
SELECTED=$(echo "$WINDOWS" | fuzzel --dmenu --no-icons -l "$LINES")

# Exit if no selection is made
if [ -z "$SELECTED" ]; then
    exit
fi

# Extract the class of the selected window
CLASS=$(echo "$SELECTED" | sed 's/.* - //')

# Focus the window with the corresponding class
hyprctl dispatch focuswindow "$CLASS"
