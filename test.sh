#!/bin/bash

RESULT=$(cat ~/.config/emotes/data/* | fzf)

if [ -n "$RESULT" ]; then
    SYMBOL=$(echo "$RESULT" | awk -F':' '{print $1}' | tr -d '\n')
    echo -n "$SYMBOL" | wl-copy
    notify-send -t 800 "Symbol Copied" "$RESULT"
fi
