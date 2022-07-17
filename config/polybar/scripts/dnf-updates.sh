#!/bin/sh

updates=$(dnf updateinfo -q --list | wc -l)

echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 >/dev/null 2>&1

if [ $? -eq 0 ]; then

    if (($updates == 0)); then
        echo "%{F#53db7f}﫟%{F-}"
    elif (($updates > 10)); then
        echo "%{F#daa640} %{F-}$updates"
    else
        echo "%{F#53db7f} %{F-}$updates"
    fi

else
    echo "%{F#6272a4}%{F-}"
fi
