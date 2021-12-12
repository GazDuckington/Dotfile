#!/usr/bin/env bash
result=`ps aux | grep -i "scripts/idle.sh" | grep -v "grep" | wc -l`
if [ $result -ge 1 ]
   then
        pkill xidlehook &
        notify-send "idle is off"
   else
        ~/scripts/idle.sh &
        notify-send "idle is on"
fi