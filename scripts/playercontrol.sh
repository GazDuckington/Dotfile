#!/usr/bin/env bash

cube='musikcube'
ms=$(playerctl --player=${cube} status)
status=$(playerctl --player=${cube} metadata --format '{{artist}} - {{title}}')
 
if [ "${status}" == "No players found" ]; then
        echo "Offline"
else
	echo "${status}" | zscroll -b "  ${ms}: " -l 25
fi

