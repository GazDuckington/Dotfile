#!/bin/sh

B='#00000000'  # blank
T='#bd93f9'  # text
W='#ff5555'  # wrong
V='#7dc1ff'  # verifying
O='#6272A4'
BK='#282a36'

i3lock \
--color=$BK \
--insidever-color=$B   \
--ringver-color=$V     \
\
--insidewrong-color=$B \
--ringwrong-color=$W   \
\
--inside-color=$B      \
--ring-color=$O        \
--line-color=$B        \
--separator-color=$T   \
\
--verif-color=$V        \
--wrong-color=$W        \
--time-color=$T        \
--date-color=$T        \
--layout-color=$T      \
--keyhl-color=$T       \
--bshl-color=$T        \
\
--screen 1            \
--clock               \
--indicator           \
--time-str="%H:%M:%S"  \
--date-str="%A, %m %Y" \
# --keylayout 1         \

dunstctl set-paused false

sleep 1
exit