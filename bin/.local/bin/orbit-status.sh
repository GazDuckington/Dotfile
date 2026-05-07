#!/bin/bash
output=$(orbit waybar-status 2>/dev/null)
if [ $? -eq 0 ] && [ -n "$output" ]; then
  text=$(echo "$output" | jq -r '.text // ""')
  tooltip=$(echo "$output" | jq -r '.tooltip // ""')
  if [ -n "$text" ]; then
    if [ -n "$tooltip" ]; then
      echo "$text|$tooltip"
    else
      echo "$text"
    fi
  fi
fi
