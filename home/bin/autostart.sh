#! /usr/bin/env bash

pgrep -x xfce-polkit>/dev/null || /usr/libexec/xfce-polkit &

$HOME/bin/idle.sh -s &
$HOME/bin/polybar/launch-polybar.sh main &
$HOME/bin/scratchpad.sh dropdown &
$HOME/bin/disableETPS.sh 0 &
xsetroot -cursor_name left_ptr &
watch -n 60 ~/bin/battery-watch.sh >/dev/null &

killall dunst &
pgrep -x dunst >/dev/null || dunst &
pgrep -x com.github.hluk.copyq >/dev/null || flatpak run com.github.hluk.copyq &
pgrep -x nm-applet >/dev/null || nm-applet &
pgrep -x udiskie >/dev/null || udiskie -t &

picom -b &