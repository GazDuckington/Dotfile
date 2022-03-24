#!/usr/bin/env bash

cube='musikcube'

zscroll -b "  " -l 20 -l 20 \
	-M "playerctl status" \
        -m "Playing" "-b ' 契'" \
        -m "Paused" "-b '  '" \
        -u true "playerctl --player=$cube metadata --format '{{artist}}-{{title}}'" &

wait

