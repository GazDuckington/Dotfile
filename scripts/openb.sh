#!/usr/bin/env bash
#------------------------------------------------
# Requirement:
#   Rofi (www.github.com/davatorium/rofi)
# Description:
#   open an url on your web-browser
# Direction:
#   ./openb.sh
#   add/remove sites from the link list 
#------------------------------------------------
declare -a link
link=("youtube.com"	"odysee.com" "github.com" "gitlab.com" "piratepeoxy.page" "pypi.org" "go.dev" "reddit.com" "imgur.com")

gen_list() {
    for i in "${link[@]}"
    do
      echo "$i"
    done
}
# dmenu -sb "#16A085" -nb "#202020" -l 10 -i -p " url: "
# rofi -theme lime2 -dmenu
main(){
    x=$(gen_list| rofi -theme lime2 -dmenu -p " enter url " -i -matching fuzzy -i)

    if [[ -n "$x" ]]; then
		# url=${link[$x]}
       $BROWSER "$x"
    else
        exit
    fi
}

main

exit 0
