#!/usr/bin/env bash

AUDIO="$(playerctl status | head -n 1)"
echo $AUDIO

is_playing(){

if [[ $AUDIO == "Playing" ]]; then
	echo "audio is playing, inhibiting idle"
	/usr/bin/systemd-inhibit --what=idle
else
	echo "nop"
fi
}
is_playing
