# #! /usr/bin/env bash

# if ! status=$(cat /sys/class/power_supply/BAT0/capacity 2> /dev/null); then
#     status=""
# fi

# if (( $status <= 30 )); then
#     dunstify -u critical -t 10000 " LOW BATTERY! 
# BATTERY AT: $status%" -a "L530"
# fi

#!/bin/sh

CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)

STATUS=$(cat /sys/class/power_supply/BAT0/status)

[ "$STATUS" = "Discharging" ] && [ "$CAPACITY" -lt 40 ] && \

dunstify -u critical "Low Battery" "You are running low on battery ($CAPACITY%).\nPlease plug in the charger." && \

echo "Low Battery notification sent" ||\

echo "Low Battery notification not sent"

[ "$STATUS" = "Charging" ] && [ "$CAPACITY" -gt 97 ] && \

dunstify -u normal "Battery Full" "Charge full ($CAPACITY%).\nPlease unplug from charger." && \

echo "Full Battery notification sent" ||\

echo "Full Battery notification not sent"