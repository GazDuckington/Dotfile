#!/usr/bin/env bash
scrot 'Screenshot_%Y-%m-%d-%S_$wx$h.png' --delay 5 -e 'mv $f $$(xdg-user-dir PICTURES) ; feh $$(xdg-user-dir PICTURES)/$f'