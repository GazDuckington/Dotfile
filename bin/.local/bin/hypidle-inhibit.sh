#!/bin/bash

# A unique reason string to identify our specific lock
REASON="Ironbar-Inhibitor"

# Toggle logic
if [[ "$1" == "toggle" ]]; then
	# Check if our specific reason is already in the inhibit list
	if systemd-inhibit --list | grep -q "$REASON"; then
		# If found, kill the process holding that lock
		# We find the PID of the 'sleep infinity' associated with systemd-inhibit
		pkill -f "$REASON"
	else
		# If not found, start it in the background with our unique reason
		systemd-inhibit --what=idle --who="User" --why="$REASON" sleep infinity &
		disown
		# Give systemd a millisecond to register it before the script finishes
		sleep 0.1
	fi
fi

# Final check for the icon
if systemd-inhibit --list | grep -q "$REASON"; then
	echo "󰅶" # ON
else
	echo "󰛊" # OFF
fi
