#!/bin/bash

wid=$(xdotool search --classname $1 | head -n 1)
if [ -z "$wid" ]; then
  if [ $1 == "dropdown" ]; then
		kitty -1 --class dropdown
		# alacritty -class dropdown,dropdown
  elif [ $1 == "note" ]; then
		kitty -1 --class notes -e ~/bin/nvim-note
		# alacritty --class notes,notes -e ~/bin/nvim-note
  else
    ~/bin/kitty-launch $1
		#~/bin/alacritty-launch $1
    wid=$(xdotool search --classname $1 | head -n 1)
    xdotool windowfocus $wid
  fi
else
  if [ -z "$(xdotool search --onlyvisible --classname $1 2>/dev/null | head -n 1)" ]; then
    xdotool windowmap $wid
  else
    xdotool windowunmap $wid
  fi
fi
