#!/usr/bin/env bash
if ! updates=$(checkupdates 2> /dev/null | wc -l); then
   updates=0
fi

if (( $updates == 0 )); then
    echo "%{F#53db7f}﫟%{F-}"
   # echo "%{F#d2daf4} %{F-}$updates"
elif (( $updates > 10 )); then
   echo "%{F#daa640} %{F-}$updates"
else
   echo "%{F#53db7f} %{F-}$updates"
fi
