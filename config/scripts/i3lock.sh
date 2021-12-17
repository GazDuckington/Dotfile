#!/bin/sh

B='#00000000'  # blank
T='#35ffdc'  # text
W='#ec2864'  # wrong
V='#7dc1ff'  # verifying
BK='#202020'
i3lock \
--color=$BK \
--insidever-color=$B   \
--ringver-color=$V     \
\
--insidewrong-color=$B \
--ringwrong-color=$W   \
\
--inside-color=$B      \
--ring-color=$T        \
--line-color=$B        \
--separator-color=$T   \
\
--verif-color=$V        \
--wrong-color=$W        \
--time-color=$T        \
--date-color=$T        \
--layout-color=$T      \
--keyhl-color=$BK       \
--bshl-color=$BK        \
\
--screen 1            \
--clock               \
--indicator           \
--time-str="%H:%M:%S"  \
--date-str="%A, %m %Y" \
# --keylayout 1         \
