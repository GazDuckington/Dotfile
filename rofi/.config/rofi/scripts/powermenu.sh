#!/bin/bash

# options to be displayed
option0=" lock"
option1=" logout"
option2="⏾ suspend"
option5="⏾ scheduled suspend (30min)"
option6=" reboot"
option7=" shutdown"

# options passed into variable
options="$option0\n$option1\n$option2\n$option5\n$option6\n$option7"

chosen="$(echo -e "$options" | rofi -no-show-icons -dmenu -p " ⏼ power ")"
case $chosen in
    "$option0")
			~/.config/sway/scripts/lockman.sh
			;;
    "$option1")
      dkcmd exit
			swaymsg exit
			;;
    "$option2")
      exec systemctl suspend
			;;
		"$option5")
			sleep 1800 && exec systemctl suspend
			;;
    "$option6")
      exec systemctl reboot
			;;
		"$option7")
      exec systemctl poweroff -i
			;;
esac
