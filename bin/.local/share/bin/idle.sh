#!/usr/bin/sh

. /home/gaz/.config/dk/color.sh

result=$(pgrep "xidlehook" | grep -vc "grep")

startidle() {
  pgrep -x xidlehook >/dev/null || "$HOME"/cargo/bin/xidlehook \
    --not-when-fullscreen \
    --not-when-audio \
    --timer 600 \
    "$XDG_DATA_HOME/bin/i3lock-color.sh" \
    '' \
    --timer 1200 \
    'systemctl suspend' \
    '' \
    --socket "/tmp/xidlehook.sock" &

}

checkidle() {

  if [ "$result" = 1 ]; then
    echo "%{F$surface0}﯈%{F-}"
  else
    echo "%{F$green}﯈%{F-}"
  fi

}

toggleidle() {

  if [ "$result" = 0 ]; then
    "$XDG_DATA_HOME"/bin/idle.sh -s &
    xset dpms &
		dunstify -r 777 " Idle is on" -t 1000 &
  else
    xset s off -dpms &
    xset s noblank &
    killall xidlehook &
		dunstify -r 777 " Staying up!" -t 1000 &
  fi

}

main() {

  if [ "$1" = "-s" ]; then
    startidle
  fi

  if [ "$1" = "-c" ]; then
    checkidle
  fi

  if [ "$1" = "-t" ]; then
    toggleidle
  fi

}

main "$1"
