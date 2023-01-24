#!/bin/sh

BATSTAT=$(cat /sys/class/power_supply/BAT0/status)
BATPATH=/sys/class/power_supply/BAT0
BAT_FULL=$BATPATH/energy_full
BAT_NOW=$BATPATH/energy_now
bf=$(cat $BAT_FULL)
bn=$(cat $BAT_NOW)
if [ $((100 * bn / bf)) -lt 60 ] && [ "$BATSTAT" = "Discharging" ]; then
  dunstify -u critical -t 8000 " low battery!" -a "Battery"
fi 
