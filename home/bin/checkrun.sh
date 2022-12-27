#!/bin/sh

if pgrep "$1" > /dev/null
then
    killall -q "$1"
else
    $1 "$2"
fi

