#!/bin/sh

if [ -n "$1" ];then
	rootDir="$HOME/Nextcloud"
	noteFileName="$rootDir/$1/$(date +%Y-%m-%d).md"
	mkdir -p "$rootDir"/"$1"

	if [ ! -f "$noteFileName" ]; then
	  echo "# Notes of $(date +%d/%B/%Y)" > "$noteFileName"
	fi

	nvim -c "normal Go"\
	     -c "normal Go## $(date +%H:%M)" \
	     -c "normal G2o" \
	     -c "normal zz" \
	     -c "startinsert" "$noteFileName" \
	     +"cd %:p:h"
else
	echo 'please input directory name'
fi
