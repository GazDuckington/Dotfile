#!/bin/sh
#
# /lib/elogind/system-sleep/lock.sh
# Lock before suspend integration with elogind

username=gaz
userhome=/home/$username
export XAUTHORITY="$userhome/.Xauthority"
export DISPLAY=":0.0"


case "${1}" in
        pre)
            su $username -c "$userhome/scripts/i3lock.sh" &
            sleep 1s;
            ;;
esac
