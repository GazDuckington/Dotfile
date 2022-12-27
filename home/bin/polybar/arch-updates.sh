#!/bin/sh

. /home/gaz/.config/dk/color.sh

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l); then
	updates_arch=0
fi

if ! updates_aur=$(yay -Qua 2> /dev/null | wc -l); then
	updates_aur=0
fi

updates=$((updates_arch + updates_aur))

if [ "$updates" -gt 0 ]; then
  echo "%{F$green} $updates%{F-}"
elif [ "$updates" -gt 50 ];then
	echo "%{F$red} $updates%{F-}"
else
  echo ""
fi
