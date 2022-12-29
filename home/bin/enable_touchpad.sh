#!/usr/bin/sh

# xinput set-prop "AT Translated Set 2 keyboard" "Device Enabled" $1
# xinput set-prop "ETPS/2 Elantech TrackPoint" "Device Enabled" $1
xinput set-prop "ETPS/2 Elantech Touchpad" "Device Enabled" "$1"
