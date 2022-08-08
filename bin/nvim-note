#!/bin/sh

noteFileName="$HOME/Nextcloud/journals/$(date +%Y-%m-%d).md"

if [ ! -f $noteFileName ]; then
  echo "# Notes of $(date +%d/%B/%Y)" > $noteFileName
fi

nvim -c "normal Go"\
     -c "normal Go## $(date +%H:%M)" \
     -c "normal G2o" \
     -c "normal zz" \
     -c "startinsert" $noteFileName \
     +"cd %:p:h"
