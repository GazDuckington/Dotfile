#!/usr/bin/sh
SCROT_DIR="$HOME/Pictures/Screen Shots"
CURRENT_DATE=$(date +"%R_%d_%b_%y")
FILE_NAME=$SCROT_DIR/$CURRENT_DATE.png
image=/tmp/${FILE_NAME}.png
convert -size 64x64 xc:"$FILE_NAME" "${image}"

scrot_screen() {
	# select whole screen
	sleep 5s
	scrot -z "$FILE_NAME"
	notify-send -i "$image" -a "Scrot-screen" "$FILE_NAME" -t 3000
	rm "$image"
}
scrot_area() {
	# select area
	scrot -z -s "$FILE_NAME"
	sleep 1s
	notify-send -i "$image" -a "Scrot-area" "$FILE_NAME" -t 3000
	rm "$image"
}
scrot_window() {
	# select current window
	scrot -z -ub "$FILE_NAME"
	notify-send -i "$image" -a "Scrot-window" "$FILE_NAME" -t 3000
	rm "$image"
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
		flameshots.sh
		;;
	"$area")
		#scrot_area
		flatpak run org.flameshot.Flameshot gui #--path ~/Pictures/Screen\ Shots/
		;;
	"$window")
		#scrot_window
		flameshots.sh activewindow
		;;
	"$select")
		flameshots.sh selectwindow
		;;
	esac
}

main() {
	if [ -z "$1" ]; then
		menu
	fi
}

main "$1"
