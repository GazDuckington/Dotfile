#!/usr/bin/env bash

LAYOUT=$(dkcmd status type=layout num=1)

case $LAYOUT in
	tile)
		echo "[]="
		;;
	rtile)
		echo "=[]"
		;;
	mono)
		echo "[M]"
		;;
	grid)
		echo "[+]"
		;;
	spiral)
		echo "[S]"
		;;
	dwindle)
		echo "[W]"
		;;
	none)
		echo "><>"
		;;
	tstack)
		echo "TTT"
		;;
esac
