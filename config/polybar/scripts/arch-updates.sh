#!/bin/sh

if ! updates=$(checkupdates 2>/dev/null | wc -l); then
   updates=0
fi

echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 >/dev/null 2>&1

if [ $? -eq 0 ]; then

   if (($updates == 0)); then
      echo "%{F#8ccf7e}﫟%{F-}"
   elif (($updates > 10)); then
      echo "%{F#e57474} %{F-}$updates"
   else
      echo "%{F#8ccf7e} %{F-}$updates"
   fi

else
   echo "%{F#b3b9b8}%{F-}"
fi
