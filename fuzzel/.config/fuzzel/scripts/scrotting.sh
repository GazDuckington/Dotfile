#!/usr/bin/sh
SCROT_DIR="$HOME"/Pictures/Screenshots
CURRENT_DATE=$(date +"%R_%d_%b_%y_%H:%M:%s")
FILE_NAME="$SCROT_DIR/scot-$CURRENT_DATE.png"
image="/tmp/thumb-$CURRENT_DATE.png"

gen_thumb(){
	echo "
	magick $FILE_NAME -resize 64x64 $image
	"
	magick "$FILE_NAME" -resize 64x64 "$image"
}

scrot_output() {
	# select whole screen
	grimblast copysave output "$FILE_NAME"
	gen_thumb
	notify-send -i "$image" -a "Scrot-screen" "$FILE_NAME" -t 3000
	rm "$image"
}
scrot_screen() {
	# select whole screen
	grimblast copysave screen "$FILE_NAME"
	gen_thumb
	notify-send -i "$image" -a "Scrot-screen" "$FILE_NAME" -t 3000
	rm "$image"
}
scrot_area() {
	# select area
	grimblast copysave area "$FILE_NAME"
	gen_thumb
	notify-send -i "$image" -a "Scrot-area" "$FILE_NAME" -t 3000
	rm "$image"
}
scrot_window() {
	# select current window
	grimblast copysave area "$FILE_NAME"
	gen_thumb
	notify-send -i "$image" -a "Scrot-window" "$FILE_NAME" -t 3000
	rm "$image"
}

menu() {
	area="󰆟 Area"
	screen="󰹑 Screen"
	# window=" Window"
	all=" All Output(s)"

	chs=$(printf "%s\n%s\n%s" "$screen" "$area" "$all" | fuzzel --dmenu --no-icons -p " Scrot " -l 3 --log-level=none)
	sleep 0.8
	case "$chs" in
	"$screen")
		scrot_output
		;;
	"$area")
		scrot_area
		;;
	# "$window")
	# 	scrot_window
	# 	;;
	"$all")
		scrot_screen
		;;
esac
}

main() {
	if [ -z "$1" ]; then
		menu
	fi
}

mkdir -p "$SCROT_DIR"
main "$1"
