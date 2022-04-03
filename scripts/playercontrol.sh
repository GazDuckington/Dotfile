#!/usr/bin/env bash

player="musikcube"
metadata="playerctl metadata --player=$player --format '{{artist}}-{{title}}'"

zscroll -l 20 \
        -M "$metadata" \
        -m "Playing" "-b ' '" \
        -m "Paused" "-b ' ' -s 'false'" \
        -m "Stopped" "-b ' ' -s 'false'" \
        -u true "$metadata" &
wait
