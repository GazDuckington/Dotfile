#!/usr/bin/sh
x=$1

if pgrep "$x" >/dev/null; then
    killall -q "$x"
else
    kitty --class "$x" "$x"
fi
