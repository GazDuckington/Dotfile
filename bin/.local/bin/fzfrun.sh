#!/usr/bin/env bash
set -euo pipefail

scrot_menu() {
	choice=$(gum choose "Screen" "Area" "All")
	case "$choice" in
	"Screen") ~/.local/bin/scrotting.sh screen ;;
	"Area") ~/.local/bin/scrotting.sh area ;;
	"All") ~/.local/bin/scrotting.sh all ;;
	esac
}
# shortcut: if first arg is "scrot", jump straight into scrot menu
if [[ "${1:-}" == "scrot" ]]; then
	scrot_menu
	exit 0
fi

# Grab entries: format "Name -> Exec"
entries=$(desktopparser)

# Add extras
entries=$(printf "%s\n= -> qalc\n? -> xdg-open\nScrot -> scrot" "$entries")

# fzf menu (show only the names)
selection=$(printf "%s\n" "$entries" |
	awk -F ' -> ' '{print $1}' |
	fzf --prompt="Launch: " --height=40% --layout=reverse \
		--bind 'ctrl-j:down,ctrl-k:up')

# Exit if nothing picked
[ -z "$selection" ] && exit 0

case "$selection" in
"=")
	query=$(gum input --placeholder "Enter calculation (qalc syntax)")
	[ -z "$query" ] && exit 0
	qalc "$query"
	echo
	qalc
	;;
"?")
	query=$(gum input --placeholder "Enter search query")
	[ -z "$query" ] && exit 0
	url="https://duckduckgo.com/?q=$(printf "%s" "$query" | jq -sRr @uri)"
	xdg-open "$url" >/dev/null 2>&1 &
	;;
"Scrot")
	scrot_menu
	;;
*)
	exec_line=$(printf "%s\n" "$entries" |
		awk -F ' -> ' -v sel="$selection" '$1 == sel {print $2}')

	exec_line=$(printf "%s" "$exec_line" | sed -E 's/%[uUfFdDnNicCkvm]//g')
	exec $exec_line >/dev/null 2>&1 &
	;;
esac
