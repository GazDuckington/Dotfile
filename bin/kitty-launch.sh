#!/usr/bin/sh
x=$1

if pgrep "$x" >/dev/null; then
    killall -q $x
else
    kitty -1 --class $x $x
fi
