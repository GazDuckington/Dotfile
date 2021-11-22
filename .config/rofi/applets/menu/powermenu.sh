#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/powermenu.rasi"

uptime=$(uptime -p | sed -e 's/up //g')
cpu=$(sh ~/.config/rofi/bin/usedcpu)
memory=$(sh ~/.config/rofi/bin/usedram)

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p " $uptime  |     $cpu  |  ﬙  $memory " -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        i3exit shutdown
		;;
    $reboot)
		i3exit reboot
        ;;
    $lock)
		if [[ -f /usr/bin/i3lock ]]; then
			i3exit lock
		elif [[ -f /usr/bin/betterlockscreen ]]; then
			betterlockscreen -l
		fi
        ;;
    $suspend)
		mpc -q pause
		playerctl pause
		amixer set Master mute
		i3exit suspend
        ;;
    $logout)
		i3exit logout
        ;;
esac
