#!/usr/bin/env bash
title=$(xprop -id $(xdotool getwindowfocus) WM_CLASS | awk '{sub("\"","");sub("\",","");printf $3}')

if [[ $title == "found." ]]; then
	echo $USER
else
	echo $title
fi

