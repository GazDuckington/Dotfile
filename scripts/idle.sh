#!/usr/bin/env bash

xidlehook \
  --not-when-fullscreen \
  --not-when-audio \
  --timer 600 \
    '~/scripts/i3lock.sh' \
    ''\
  --timer 1200 \
    '~/scripts/i3lock.sh' \
    'systemctl suspend' \
    ''
