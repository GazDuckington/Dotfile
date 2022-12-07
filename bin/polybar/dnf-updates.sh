#!/bin/sh

. ~/.config/dk/color.sh

updates=$(dnf updateinfo -q --list | wc -l)

if [ "$updates" -gt 0 ]; then
  echo "%{F$green} $updates%{F-}"
else
    echo ""
fi
