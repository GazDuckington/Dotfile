#!/bin/sh

dbus-launch &
pgrep -x xfce-polkit>/dev/null || /usr/libexec/xfce-polkit &

WALL=$(find ~/Pictures/Wallpapers/ -type f | shuf -n 1)
hsetroot -cover "$WALL" &
xsetroot -cursor_name left_ptr &

picom -b &
"$HOME"/bin/idle.sh -s &
"$HOME"/bin/polybar/launch-polybar.sh main &
"$HOME"/bin/toggle_touchpad.sh 0 &
# "$HOME"/bin/scratchpad.sh dropdown &

# killall dunst &
# pgrep -x dunst >/dev/null || dunst &
# pgrep -x org.flameshot.Flameshot >/dev/null || flatpak run org.flameshot.Flameshot &
pgrep -x com.github.hluk.copyq >/dev/null || flatpak run com.github.hluk.copyq &
pgrep -x nm-applet >/dev/null || nm-applet &
pgrep -x udiskie >/dev/null || udiskie -t &

watch -n 60 ~/bin/battery-watch.sh >/dev/null &
