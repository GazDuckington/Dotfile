#!/usr/bin/env bash
result=`ps aux | grep -i "scripts/idle" | grep -v "grep" | wc -l`
if [ $result -ge 1 ]
   then
        echo " %{F#292A2B}%{F-} "
   else
        echo " %{F#dfdfdf}%{F-} "
fi
