#!/usr/bin/env bash
result=`ps aux | grep -i "scripts/idle.sh" | grep -v "grep" | wc -l`
if [ $result -ge 1 ]
   then
        pkill xidlehook &
        notify-send "idle is off" -t 5000
   else
        $HOME/scripts/idle.sh &
        notify-send "idle is on" -t 5000
fi
