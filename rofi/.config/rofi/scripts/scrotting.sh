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
	select=" Select"

  chs=$(printf "%s\n%s\n%s\n%s" "$screen" "$area" "$window" "$select" | rofi -dmenu -no-show-icons -p "  Scrot ")
  case "$chs" in
  "$screen")
		#scrot_screen
		"$XDG_DATA_HOME/bin/flameshots.sh"
		;;
  "$area")
		#scrot_select
		flatpak run org.flameshot.Flameshot gui --path ~/Pictures/Screen\ Shots/
		;;
  "$window")
		#scrot_window
		"$XDG_DATA_HOME/bin/flameshots.sh activewindow"
		;;
	"$select")
	"$XDG_DATA_HOME/bin/flameshots.sh selectwindow"
	;;
  esac
}

main() {
  if [ -z "$1" ]; then
    menu
  fi
}

main "$1"
