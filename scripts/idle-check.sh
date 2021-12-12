#!/usr/bin/env bash
result=`ps aux | grep -i "scripts/idle" | grep -v "grep" | wc -l`
if [ $result -ge 1 ]
   then
        echo "%{F#909090}%{F-}"
   else
        echo "%{F#dfdfdf}%{F-}"
fi
