#!/bin/sh

B='#00000000'  # blank
T='#7aa2f7'  # text
W='#f7768e'  # wrong
V='#9ece6a'  # verifying
O='#7aa2f7'
BK='#202020'
# Set the paused status of dunst
dunstctl set-paused true

# Font
FONT="JetBrainsMono Nerd Font"

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
--keyhl-color=$BK       \
--bshl-color=$BK        \
\
--screen 1            \
--clock               \
--indicator           \
--time-str="%H:%M:%S"  \
--date-str="%A, %m %Y" \
--radius=140         \
\
--date-font="$FONT" \
--time-font="$FONT" \
--layout-font="$FONT" \
--verif-font="$FONT" \
--wrong-font="$FONT" \
--greeter-font="$FONT" \

dunstctl set-paused false

sleep 1
exit
