#!/usr/bin/sh

SCROT_DIR="$HOME"/Pictures/Screenshots
CURRENT_DATE=$(date +"%R_%d_%b_%y_%H:%M:%s")
FILE_NAME="$SCROT_DIR/scot-$CURRENT_DATE.png"
image="/tmp/thumb-$CURRENT_DATE.png"

gen_thumb(){
	magick "$FILE_NAME" -resize 64x64 "$image"
}

scrot_output() {
	# select whole screen
	sleep 0.3
	if grimblast copysave output "$FILE_NAME"; then
		gen_thumb
		notify-send -i "$image" -a "Scrot-screen" "$FILE_NAME" -t 3000
		rm "$image"
	fi
}
scrot_screen() {
	# select whole screen
	sleep 0.3
	if grimblast copysave screen "$FILE_NAME"; then
		gen_thumb
		notify-send -i "$image" -a "Scrot-screen" "$FILE_NAME" -t 3000
		rm "$image"
	fi
}
scrot_area() {
	# select area
	# sleep 0.5
	if grimblast copysave area "$FILE_NAME"; then
		gen_thumb
		notify-send -i "$image" -a "Scrot-area" "$FILE_NAME" -t 3000
		rm "$image"
	fi
}
scrot_window() {
	# select current window
	# sleep 0.5
	if grimblast copysave area "$FILE_NAME"; then
		gen_thumb
		notify-send -i "$image" -a "Scrot-window" "$FILE_NAME" -t 3000
		rm "$image"
	fi
}

menu() {
	area="󰆟  Area"
	screen="󰹑  Screen"
	# window=" Window"
	all="  All Output(s)"

	chs=$(printf "%s\n%s\n%s" "$screen" "$area" "$all" | anyrun --plugins libstdin.so)
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
