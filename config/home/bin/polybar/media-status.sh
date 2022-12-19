#!/usr/bin/sh

if ! [[ -x "$(command -v playerctl)" ]]; then
  echo "install playerctl"
  exit 1
fi

MSTATUS=$(playerctl metadata -f '{{status}} {{trunc(artist, 8)}} - {{trunc(title, 8)}}')
NP="No players found"

# STATE=$(echo "$MSTATUS" | cut -d " " -f1)
STATE=$(playerctl status)
OUTPUT=$(echo "$MSTATUS" | cut -d " " -f2-)

if [[ $STATE == "Paused" ]]; then
  echo "" "${OUTPUT}"
elif [[ $STATE == "Playing" ]]; then
  echo "" "${OUTPUT}"
fi
