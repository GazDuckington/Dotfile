#!/usr/bin/env bash
if ! updates=$(checkupdates+aur 2> /dev/null | wc -l); then
   updates=0
fi

if (( $updates > 0 )); then
   echo "%{F#50fa7b} $updates%{F-}"
elif (( $updates >= 10 )); then
   echo "%{F#ff5455} $updates%{F-}"
else
   echo "%{F#6272a4} $updates%{F-}"
fi
