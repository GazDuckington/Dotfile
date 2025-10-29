#!/usr/bin/sh

SCROT_DIR="$HOME"/Pictures/Screenshots
CURRENT_DATE=$(date +"%R_%d_%b_%y_%H:%M:%s")
FILE_NAME="$SCROT_DIR/scot-$CURRENT_DATE.png"
export GRIMBLAST_EDITOR="satty --initial-tool=arrow --copy-command=wl-copy --actions-on-escape=save-to-file,exit --brush-smooth-history-size=5 --disable-notifications --output-filename $FILE_NAME --filename"
image="/tmp/thumb-$CURRENT_DATE.png"

gen_thumb() {
	magick "$FILE_NAME" -resize 64x64 "$image"
}

scrot_output() {
	# select whole screen
	sleep 0.5
	if grimblast edit output "$FILE_NAME"; then
		gen_thumb
		notify-send -i "$image" -a "Scrot-screen" "$FILE_NAME" -t 3000
		rm "$image"
	fi
}
scrot_screen() {
	# select whole screen
	sleep 0.5
	if grimblast edit screen "$FILE_NAME"; then
		gen_thumb
		notify-send -i "$image" -a "Scrot-screen" "$FILE_NAME" -t 3000
		rm "$image"
	fi
}
scrot_area() {
	# select area
	sleep 0.5
	if grimblast edit area "$FILE_NAME"; then
		gen_thumb
		notify-send -i "$image" -a "Scrot-area" "$FILE_NAME" -t 3000
		rm "$image"
	fi
}
scrot_window() {
	# select current window
	sleep 0.5
	if grimblast copysave area "$FILE_NAME"; then
		gen_thumb
		notify-send -i "$image" -a "Scrot-window" "$FILE_NAME" -t 3000
		rm "$image"
	fi
}

cancel() {
	notify-send "Screenshot canceled" -t 3000
}

menu() {
	area="󰆟  Area"
	screen="󰹑  Screen"
	# window=" Window"
	all="  All Output(s)"

	chs=$(printf "%s\n%s\n%s" "$screen" "$area" "$all" | walker -d --placeholder "   Select mode ")
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
	case "$1" in
	"screen")
		scrot_output
		;;
	"area")
		scrot_area
		;;
	# "window")
	#     scrot_window
	#     ;;
	"all")
		scrot_screen
		;;
	*)
		menu
		;;
	esac
}

mkdir -p "$SCROT_DIR"
main "$1"
