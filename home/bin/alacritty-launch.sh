#!/bin/sh
x=$1

if pgrep "$x" >/dev/null; then
  killall -q "$x"
else
  alacritty --class "$x","$x" --command tmux new -A -s "$x" "$x"
fi
