#!/usr/bin/env bash
killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -r bar --config=~/.config/polybar/config.ini &

echo "polybar launched"