#!/usr/bin/env bash

if ! [[ -x "$(command -v playerctl)" ]]; then
  echo "install playerctl"
  exit 1
fi

while read -r LINE; do
  if [[ $LINE == "No players found" ]]; then
    ICON=""
    OUTPUT="Nothing's on"
  else 
    STATE=$(echo "$LINE" | cut -d " " -f1)
    OUTPUT=$(echo "$LINE" | cut -d " " -f2-)
    if [[ $STATE == "Paused" ]]; then
      ICON=""
    else
      ICON=""
    fi
  fi

  echo "$ICON" "${OUTPUT}"
done < <(playerctl metadata -f '{{status}} {{trunc(artist, 8)}} - {{trunc(title, 8)}}' -F)