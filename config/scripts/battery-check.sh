#!/usr/bin/env bash

batt=`cat /sys/class/power_supply/BAT0/capacity`
status=`cat /sys/class/power_supply/BAT0/status`

if [[ $status == "Discharging" ]]
then
if [ $batt -lt 15 ]
then
  notify-send -u critical "WARNING!
battery is at $batt%!" -t 10000
fi
fi
