#! /usr/bin/env bash

lxpolkit &

~/bin/idle.sh -s &
~/bin/polybar/launch-polybar.sh main &
~/bin/scratchpad.sh dropdown &

watch -n 60 ~/bin/battery-watch.sh >/dev/null &

pgrep -x dunst >/dev/null || dunst &
pgrep -x com.github.hluk.copyq >/dev/null || flatpak run com.github.hluk.copyq &
pgrep -x nm-applet >/dev/null || nm-applet &
pgrep -x udiskie >/dev/null || udiskie -t &

~/bin/disableETPS.sh 0 &
picom -b &
