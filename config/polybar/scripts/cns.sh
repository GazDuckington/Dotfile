#!/bin/bash

function capslock() {

  caps=$(xset -q | grep Caps | awk '{ print $4 }')

  if [ $caps == 'off' ]; then
    echo "%{F#45475a}ﰶ%{F-}"
  else
    echo "%{F#a6e3a1}ﰶ%{F-}"
    #echo "בּ"
  fi

}

function numlock() {

  num=$(xset -q | grep Num | awk '{ print $8 }')

  if [ $num == 'off' ]; then
    echo "%{F#45475a}%{F-}"
  else
    echo "%{F#a6e3a1}%{F-}"
  fi

}

function scroll() {

  scroll=$(xset -q | grep Scroll | awk '{ print $12 }')

  if [ $scroll == 'off' ]; then
    echo ""
  else
    # echo "%{F#21ff21}%{F-}"
    echo ""
  fi

}

main () {

  if [ "$1" == "-c"  ]; then
    capslock
  fi

  if [ "$1" == "-n"  ]; then
    numlock
  fi

  if [ "$1" == "-s"  ]; then
    scroll
  fi

}

main $1