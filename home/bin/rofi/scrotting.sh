#!/usr/bin/sh
SCROT_DIR="$HOME/Pictures/Screen Shots"
CURRENT_DATE=$(date +"%R_%d_%b_%y")
FILE_NAME=$SCROT_DIR/$CURRENT_DATE.png

scrot_screen() {
	sleep 5 &&
  scrot -z "$FILE_NAME"
  dunstify -i "$FILE_NAME" -a "Scrot-screen" "$FILE_NAME" -t 3000
}
scrot_select() {
  scrot -z -s "$FILE_NAME"
  wait
  dunstify -i "$FILE_NAME" -a "Scrot-area" "$FILE_NAME" -t 3000
}
scrot_window() {
  scrot -z -ub "$FILE_NAME"
  dunstify -i "$FILE_NAME" -a "Scrot-window" "$FILE_NAME" -t 3000
}

menu() {
  area=" Area"
	screen=" Screen (5s delay)"
  window=" Window"

  chs=$(printf "%s\n%s\n%s" "$screen" "$area" "$window" | rofi -dmenu -no-show-icons -p "  Scrot ")
  case "$chs" in
  "$screen") scrot_screen ;;
  "$area") scrot_select ;;
  "$window") scrot_window ;;
  esac
}

instant() {
  if [ "$1" = "screen" ]; then
    scrot_screen
  elif [ "$1" = "area" ]; then
    scrot_select
  elif [ "$1" = "window" ]; then
    scrot_window
  fi
}

main() {
  if [ -z "$1" ]; then
    menu
  else
    instant "$1"
  fi
}

main "$1"
