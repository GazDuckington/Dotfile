#!/usr/bin/sh

while getopts ":t:p:k:" opt; do
	case "${opt}" in
		t)
			xinput set-prop "ETPS/2 Elantech Touchpad" "Device Enabled" "$OPTARG"
			;;
		p)
			xinput set-prop "ETPS/2 Elantech TrackPoint" "Device Enabled" "$OPTARG"
			;;
		k)
			xinput set-prop "AT Translated Set 2 keyboard" "Device Enabled" "$OPTARG"
			;;
		*)
			printf "t [1/0] for Touchpad \n p [1/0] or TrackPoint \n k [1/0] for external keyboard"
	esac
done

