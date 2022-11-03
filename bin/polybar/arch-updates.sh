#!/bin/sh

. ~/.config/dk/color.sh

if ! updates=$(yay -Qum 2> /dev/null | wc -l); then
    updates=0
fi

if [ "$updates" -gt 0 ]; then
  echo "%{F$green} $updates%{F-}"
elif [ "$updates" -gt 50 ];then
	echo "%{F$red} $updates%{F-}"
else
    echo ""
fi
