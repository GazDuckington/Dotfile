#!/bin/sh

if ! updates=$(checkupdates 2>/dev/null | wc -l); then
   updates=0
fi

echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 >/dev/null 2>&1

. ~/.config/dk/color.sh

if [ $? -eq 0 ]; then

   if (($updates == 0)); then
      # echo "%{F$green}﫟%{F-}"
			echo ""
   elif (($updates > 50)); then
      echo "%{F$red} %{F-}$updates"
   else
      echo "%{F$yellow} %{F-}$updates"
   fi

else
   echo "%{F$grey}%{F-}"
fi
