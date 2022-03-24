#!/usr/bin/env bash

cube='musikcube'
status=$(playerctl --player=${cube} metadata --format '{{artist}} - {{title}}')
 
if [ "${status}" == "No players found" ]; then
        echo "Offline"
else
	echo "${status}" | zscroll -b "  " -l 25
fi

