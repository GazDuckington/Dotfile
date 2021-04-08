#! /bin/bash

xidlehook \
  --not-when-fullscreen \
  --not-when-audio \
  --timer 600 \
    'i3exit lock' \
    ''\
  --timer 600 \
    'i3exit suspend' \
    ''
