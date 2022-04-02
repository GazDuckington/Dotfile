#!/usr/bin/env bash

cube='musikcube'

zscroll -l 20 \
	-M "playerctl status --player=$cube" \
        -m "Playing" "-b ' '" \
        -m "Paused" "-b ' '" \
        -m "Stopped" "-b ' '" \
	-m "No\ players\ found" "-b '𥉉 '" \
        -u true "playerctl --player=$cube metadata --format '{{artist}}-{{title}}'" &

wait

