#!/usr/bin/sh

# killall -q polybar
polybar-msg cmd quit

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -r $1 --config=~/.config/polybar/config.ini &

echo "polybar launched"
