#!/usr/bin/env bash
result=`ps aux | grep -i "scripts/idle" | grep -v "grep" | wc -l`
if [ $result -ge 1 ]
   then
        echo "%{F#35ffdc}%{F-}"
   else
        echo "%{F#969696}%{F-}"
fi