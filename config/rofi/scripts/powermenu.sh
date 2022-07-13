#!/usr/bin/env bash

rofi_command="rofi -i -matching fuzzy -no-show-icons"

# Options
shutdown=" poweroff "
reboot=" reboot "
lock=" lock "
suspend="鈴 sleep "
logout=" logout "

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p ' ⏼ Power Menu ' -dmenu)"
case $chosen in
$shutdown)
    systemctl poweroff
    ;;
$reboot)
    systemctl reboot
    ;;
$lock)
    amixer set Master mute &
    ~/bin/i3lock-color
    ;;
$suspend)
    #    	mpc -q pause
    #	    playerctl pause
    amixer set Master mute &
    #      ~/scripts/i3lock.sh
    systemctl suspend
    ;;
$logout)
    i3-msg exit
    bspc quit
    dkcmd exit
    killall spectrwm
    ;;
esac
