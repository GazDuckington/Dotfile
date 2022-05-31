#!/usr/bin/env bash
if ! updates=$(checkupdates+aur 2> /dev/null | wc -l); then
   updates=0
fi

if (( $updates == 0 )); then
   echo "%{F#45475a} $updates%{F-}"
elif (( $updates > 10 )); then
   echo "%{F#f38ba8} $updates%{F-}"
else
   echo "%{F#a6e3a1} $updates%{F-}"
fi
