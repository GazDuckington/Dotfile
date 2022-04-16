#!/bin/sh

updates=$(dnf updateinfo -q --list | wc -l)

if [ "$updates" -gt 0 ]; then
    echo "%{F#50fa7b} $updates%{F-}"
else
    echo "%{F#6272a4} $updates%{F-}"
fi
