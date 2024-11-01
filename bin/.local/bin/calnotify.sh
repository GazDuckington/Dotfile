#!/usr/bin/env bash
green="${1:-32CD32}"

day="$(date +'%-d ' | sed 's/\b[0-9]\b/ &/g')"
cal="$(cal | sed -e 's/^/ /g' -e 's/$/ /g' -e "s/$day/\<span color=\'#$green\'\>\<b\>$day\<\/b\>\<\/span\>/" -e '1d')"
top="$(cal | sed '1!d')"

notify-send -t 5000 -r 55 "$top" "$cal"
