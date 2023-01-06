#!/bin/sh

killall	dunst &
WALL=$(find ~/Pictures/Wallpapers/ -type f | shuf -n 1)

watch	-n 60 ~/bin/battery-watch.sh 2> /dev/null &
hsetroot -cover "$WALL" &
xsetroot -cursor_name left_ptr &
picom	-b &

pgrep -x xfce-polkit								2> /dev/null || /usr/libexec/xfce-polkit &
pgrep -x dunst											2> /dev/null || dunst &
pgrep -x udiskie										2> /dev/null || udiskie -s &
pgrep -x nm-applet									2> /dev/null || nm-applet &
pgrep -x com.github.hluk.copyq			2> /dev/null || flatpak run com.github.hluk.copyq &
# pgrep -x org.flameshot.Flameshot 2>/dev/null || flatpak run org.flameshot.Flameshot &

xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Natural Scrolling Enabled" 1
xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Scrolling Pixel Distance" 15

"$HOME"/bin/idle.sh -s &
"$HOME"/bin/polybar/launch-polybar.sh main &
"$HOME"/bin/inputs.sh -t 0 &
"$HOME"/bin/scratchpad.sh dropdown &

