#!/bin/bash

# Initialize previous state
prev_brightness=""

while true; do
  # Read the current brightness value
  brightness=$(cat /sys/class/leds/input*::capslock/brightness | head -n 1)

  # Check if the state has changed
  if [ "$brightness" != "$prev_brightness" ]; then
    # Update previous state
    prev_brightness=$brightness

    # Output JSON for Waybar
    if [ "$brightness" -eq 1 ]; then
      echo '{"text": "Caps", "alt": "lock", "class": "lock"}'
    else
      echo '{"text": "", "alt": "unlock", "class": "unlock"}'
    fi
  fi

  # Sleep to reduce CPU usage
  sleep 0.5
done
