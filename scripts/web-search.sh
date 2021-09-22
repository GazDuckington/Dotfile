#!/usr/bin/env bash
declare -A URLS

URLS=(
  ["URL"]="https://"
  ["duckduckgo"]="https://www.duckduckgo.com/?q="
  ["github"]="https://github.com/search?q="
  ["pip"]="https://pypi.org/search?q="
  ["godev"]="https://pkg.go.dev/search?q="
  ["archwiki"]="https://wiki.archlinux.org/index.php?search="
  ["gitlab"]="https://gitlab.com/search?search="
  ["stackoverflow"]="http://stackoverflow.com/search?q="
  ["youtube"]="https://www.youtube.com/results?search_query="
  ["pubdev"]="https://pub.dev/packages?q="
  ["npmjs"]="https://www.npmjs.com/search?q="
)

# List for rofi
gen_list() {
    for i in "${!URLS[@]}"
    do
      echo "$i"
    done
}

main() {
  # Pass the list to rofi
  platform=$( (gen_list) | rofi -dmenu -matching fuzzy -p " search engine " -i)

  if [[ -n "$platform" ]]; then
    query=$( (echo ) | rofi -dmenu -matching fuzzy -p " query " -i)

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
