#!/bin/sh
# Times the screen off and puts it to background
swayidle \
    timeout  300 'swaymsg "output * power off"' \
    resume 'swaymsg "output * power on"' &
# Locks the screen immediately
hyprlock -c ~/Dotfile/hypr/.config/hypr/hyprlock.conf
# Kills last background task so idle timer doesn't keep running
kill %%
