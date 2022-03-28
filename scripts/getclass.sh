#!/usr/bin/env bash
title=$(xprop -id $(xdotool getwindowfocus) WM_CLASS | awk '{sub(/"/,"",$4);sub(/"$/,"");print $4}')

if [[ -z $title ]]; then
	echo $USER
else
	echo $title
fi

