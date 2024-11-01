#!/bin/sh
. /home/gaz/.config/dk/color.sh \

B='#00000000' # blank
FONT='FiraCode Nerd Font'

playerctl pause;
amixer set Master mute;
dunstctl set-paused true;

pgrep -x i3lock >/dev/null || i3lock \
--color=$base \
--insidever-color=$B   \
--ringver-color=$green     \
\
--insidewrong-color=$B \
--ringwrong-color=$red   \
\
--inside-color=$B      \
--ring-color=$blue        \
--line-color=$B        \
--separator-color=$blue   \
\
--verif-color=$green        \
--modif-color=$red        \
--wrong-color=$red        \
--time-color=$blue        \
--date-color=$blue        \
--layout-color=$blue      \
--keyhl-color=$base       \
--bshl-color=$base        \
\
--screen 1            \
--clock               \
--indicator           \
--time-str="%H:%M:%S"  \
--date-str="%A, %d %B %Y" \
--radius=140         \
\
--date-font="$FONT" \
--time-font="$FONT" \
--layout-font="$FONT" \
--verif-font="$FONT" \
--wrong-font="$FONT" \
--greeter-font="$FONT" \
-n; 
\
amixer set Master unmute;
dunstctl set-paused false;
sleep 1;
exit;
