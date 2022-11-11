#!/usr/bin/env bash

CLASS=$(xprop -id $(xdotool getwindowfocus) WM_CLASS | awk '{gsub(/"/,"", $4); print $4}')

if [ -z $CLASS ]; then
	echo ${HOSTNAME^}
else
	echo ${CLASS^}
fi
