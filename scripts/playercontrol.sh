#!/usr/bin/env bash

player="musikcube"
metadata="playerctl metadata --player=$player --format '{{artist}}-{{title}}'"

zscroll -l 20 \
        -M "$metadata" \
        -m "Playing" "-b ' '" \
        -m "Paused" "-b ' '" \
        -m "Stopped" "-b ' '" \
        -u true "$metadata" &

wait
