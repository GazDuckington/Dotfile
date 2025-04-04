#!/bin/sh

# ██╗  ██╗      ██╗ ██╗
# ╚██╗██╔╝     ███║███║
#  ╚███╔╝█████╗╚██║╚██║
#  ██╔██╗╚════╝ ██║ ██║
# ██╔╝ ██╗      ██║ ██║
# ╚═╝  ╚═╝      ╚═╝ ╚═╝

WALL=$(/usr/sbin/find ~/Pictures/Wallpapers/ -type f | shuf -n 1)

pgrep -x hsetroot									2> /dev/null || hsetroot -cover "$WALL" &
pgrep -x polybar									2> /dev/null || polybar -q -r &
# pgrep -x picom									 	2> /dev/null || picom -b &
pgrep -x polkit-gnome						 	2> /dev/null || /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
pgrep -x dunst									 	2> /dev/null || dunst &
pgrep -x nm-applet							 	2> /dev/null || nm-applet &
pgrep -x udiskie								 	2> /dev/null || udiskie -s &
pgrep -x com.github.hluk.copyq		2> /dev/null || flatpak run com.github.hluk.copyq &
pgrep -x org.flameshot.Flameshot	2> /dev/null || flatpak run org.flameshot.Flameshot &

xsetroot -cursor_name left_ptr &
watch	-n 60 battery-watch.sh 2> /dev/null &

idle.sh -s &
inputs.sh -t 0 &
scratchpad.sh dropdown &

xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Scrolling Pixel Distance" 15
xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Natural Scrolling Enabled" 1

# browser startpage
# ws -p 6969 --directory ~/dev/startpage/ 2>/dev/null &
