#!/usr/bin/env bash
declare -A URLS

URLS=(
  ["duckduckgo"]="https://www.duckduckgo.com/?q="
  ["github"]="https://github.com/search?q="
  ["pip"]="https://pypi.org/search?q="
  ["go"]="https://pkg.go.dev/search?q="
  ["archwiki"]="https://wiki.archlinux.org/index.php?search="
  ["gitlab"]="https://gitlab.com/search?search="
  ["stackoverflow"]="http://stackoverflow.com/search?q="
  ["piratebay"]="https://pirateproxy.page/search.php?q="
  ["youtube"]="https://www.youtube.com/results?search_query="
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
  platform=$( (gen_list) | rofi -dmenu -matching fuzzy -theme lime2 -p " search engine " -i)

  if [[ -n "$platform" ]]; then
    query=$( (echo ) | rofi -dmenu -matching fuzzy -theme lime2 -p " query " -i)

    if [[ -n "$query" ]]; then
      url=${URLS[$platform]}$query
      $BROWSER "$url"
    else
      exit
    fi

  else
    exit
  fi
}

main

exit 0
