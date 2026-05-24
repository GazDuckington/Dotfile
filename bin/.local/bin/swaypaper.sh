#!/bin/sh

WALL="${1:-$(/usr/bin/find ~/Pictures/Wallpapers/ -type f -not -name ".*" | /usr/bin/shuf -n1)}"

case "${WALL##*.}" in
    mp4|webm|mov|mkv|avi)
        pkill mpvpaper 2>/dev/null
        OUTPUT=$(hyprctl monitors -j | jq -r '.[0].name')
        [ -n "$OUTPUT" ] && mpvpaper -f -o "no-audio loop" "$OUTPUT" "$WALL"
        ;;
    *)
        awww img "$WALL" --transition-type grow
        ;;
esac
