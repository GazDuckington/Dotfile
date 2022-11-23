#! /usr/bin/env bash

watch -n 60 ~/bin/battery-watch.sh >/dev/null &
killall -q xidlehook &
pgrep -x dunst >/dev/null || dunst &
/usr/lib/polkit-kde-authentication-agent-1 &
~/bin/polybar/launch-polybar.sh main &
~/bin/idle.sh -s &
~/bin/disableETPS.sh 0 &
~/bin/scratchpad.sh dropdown &
picom --experimental-backends -b &
pgrep -x com.github.hluk.copyq >/dev/null || com.github.hluk.copyq &
pgrep -x nm-applet >/dev/null || nm-applet &
pgrep -x udiskie >/dev/null || udiskie -t &
