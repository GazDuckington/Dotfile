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
	screen=" Screen"
  window=" Window"

  chs=$(printf "%s\n%s\n%s" "$screen" "$area" "$window" | rofi -dmenu -no-show-icons -p "  Scrot ")
  case "$chs" in
  "$screen")
		#scrot_screen
		~/bin/flameshots.sh
		;;
  "$area")
		#scrot_select
		flatpak run org.flameshot.Flameshot gui
		;;
  "$window")
		#scrot_window
		~/bin/flameshots.sh activewindow
		;;
  esac
}

main() {
  if [ -z "$1" ]; then
    menu
  fi
}

main "$1"
