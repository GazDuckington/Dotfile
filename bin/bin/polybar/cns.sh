#!/bin/sh
. /home/gaz/.config/dk/color.sh
caps=$(xset -q | grep Caps | awk '{ print $4 }')
num=$(xset -q | grep Num | awk '{ print $8 }')
scroll=$(xset -q | grep Scroll | awk '{ print $12 }')

capslock() {
  if [ "$caps" = 'off' ]; then
    echo "%{F$overlay0}%{F-}" &
  else
    echo "%{F$green}%{F-}"
  fi
}

capslock_toggle() {
	xdotool key Caps_Lock &
	if [ "$caps" = 'off' ]; then
		dunstify -r 888 "Caps Lock is on." -t 1000
	else
		dunstify -r 888 "Caps Lock is off." -t 1000
	fi
}

numlock() {
  if [ "$num" = 'off' ]; then
    echo "%{F$overlay0}[num]%{F-}"
  else
    echo "%{F$teal}[num]%{F-}"
  fi
}

scroll() {
  if [ "$scroll" = 'off' ]; then
    echo "%{F$overlay0}[srl]%{F-}"
  else
    echo "%{F$teal}[srl]%{F-}"
  fi
}

main () {
  if [ "$1" = "-c"  ]; then
    capslock
  fi

  if [ "$1" = "-n"  ]; then
    numlock
  fi

  if [ "$1" = "-s"  ]; then
    scroll
  fi

	if [ "$1" = "-ct" ]; then
		capslock_toggle
	fi
}

main "$1"
