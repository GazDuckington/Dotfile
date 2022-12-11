#!/bin/sh

wid=$(xdotool search --classname $1 | head -n 1)

if [ -z "$wid" ]; then
  if [ $1 == "dropdown" ]; then
		kitty -1 --class dropdown
  else
    ~/bin/kitty-launch.sh $1
    xdotool windowfocus $wid
  fi
else
	  if [ -z "$(xdotool search -onlyvisible --classname $1 2>/dev/null | head -n 1)" ]; then
    xdotool windowmap $wid
  else
    xdotool windowunmap $wid
  fi
fi
