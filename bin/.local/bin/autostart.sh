#!/bin/sh

WALL=$(find ~/Pictures/Wallpapers/ -type f | shuf -n 1)

pgrep -x hsetroot										2> /dev/null || hsetroot -cover "$WALL" &
sleep 3s &
pgrep -x polybar										2> /dev/null ||	polybar -q -r -c ~/.config/polybar/config.ini &
pgrep -x picom											2> /dev/null || picom -b &
sleep 3s &
pgrep -x xfce-polkit								2> /dev/null || /usr/libexec/xfce-polkit &
pgrep -x dunst											2> /dev/null || dunst && killall dunst &
pgrep -x nm-applet									2> /dev/null || nm-applet &
pgrep -x udiskie										2> /dev/null || udiskie -s &
psleep 5s &
pgrep -x com.github.hluk.copyq			2> /dev/null || flatpak run com.github.hluk.copyq &
# pgrep -x org.flameshot.Flameshot		2> /dev/null || flatpak run org.flameshot.Flameshot &

xsetroot -cursor_name left_ptr &
watch	-n 60 battery-watch.sh 2> /dev/null &

idle.sh -s &
inputs.sh -t 0 &
scratchpad.sh dropdown &

xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Scrolling Pixel Distance" 15
xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Natural Scrolling Enabled" 1
