#!/usr/bin/env bash
x=$1

if pgrep "$x" > /dev/null
then
    killall -q $x
else
    kitty --title $x --class $x $x 
fi
