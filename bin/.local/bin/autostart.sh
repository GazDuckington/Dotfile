#!/usr/bin/env bash

set -x

# Function to run a command if it is not already running
lazy_load() {
    if ! pgrep -f "$1" > /dev/null; then
        eval "$2 &"
    fi
}

# Start each service lazily
# lazy_load "foot" "foot --server"
# lazy_load "walker" "walker --gapplication-service"
lazy_load "polkit-kde-auth" "/usr/lib/polkit-kde-authentication-agent-1"
lazy_load "waybar" "waybar"
lazy_load "hypridle" "hypridle"
lazy_load "nm-applet" "nm-applet"
lazy_load "swaync" "swaync"
lazy_load "wl-paste" "wl-paste --watch cliphist store"
lazy_load "blueman-applet" "blueman-applet"
lazy_load "udiskie" "udiskie --smart-tray -f yazi --terminal footclient"
