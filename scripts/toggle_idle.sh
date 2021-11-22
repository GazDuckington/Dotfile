#!/usr/bin/env bash
result=`ps aux | grep -i "scripts/idle" | grep -v "grep" | wc -l`
if [ $result -ge 1 ]
   then
        pkill xidlehook &
        notify-send "idle is off"
   else
        ~/scripts/idle &
        notify-send "idle is on"
fi