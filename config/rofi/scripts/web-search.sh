#!/usr/bin/env bash
declare -A URLS

URLS=(
  ["URL"]="https://"
  ["aur"]="https://aur.archlinux.org/packages?O=0&K="
  ["brave"]="https://search.brave.com/search?q="
  ["startpage"]="https://www.startpage.com/do/dsearch?query="
  ["github"]="https://github.com/search?q="
  ["pip"]="https://pypi.org/search?q="
  ["godev"]="https://pkg.go.dev/search?q="
  ["archwiki"]="https://wiki.archlinux.org/index.php?search="
  ["gitlab"]="https://gitlab.com/search?search="
  ["stackoverflow"]="http://stackoverflow.com/search?q="
  ["youtube"]="https://www.youtube.com/results?search_query="
  ["pubdev"]="https://pub.dev/packages?q="
  ["npmjs"]="https://www.npmjs.com/search?q="
  ["docker"]="https://hub.docker.com/search?q="
)
rofi_command="rofi -dmenu -matching fuzzy -i -no-show-icons"
# List for rofi
gen_list() {
    for i in "${!URLS[@]}"
    do
      echo "$i"
    done
}

main() {
  # Pass the list to rofi
  platform=$( (gen_list) | $rofi_command -p "engine ")

  if [[ -n "$platform" ]]; then
    query=$( (echo ) | $rofi_command -p "query ")

    if [[ -n "$query" ]]; then
      url=${URLS[$platform]}$query
      xdg-open "$url"
    else
      exit
    fi

  else
    exit
  fi
}

main

exit 0
