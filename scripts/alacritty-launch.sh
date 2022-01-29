#!/usr/bin/env bash
x=$1

if pgrep "$x" > /dev/null
then
    killall -q $x
else
    alacritty --class $x,$x --command $x 
fi
