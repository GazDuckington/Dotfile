# #! /usr/bin/env bash

killall -q picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --experimental-backend -b &

killall -q dunst
while pgrep -u $UID -x dunst >/dev/null; do sleep 1; done
dunst &