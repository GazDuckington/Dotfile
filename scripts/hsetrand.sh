#!/usr/bin/env bash
path=~/Pictures/Wallpapers/
ls $path | sort -R | tail -1 | while read file; do
hsetroot -center $path/$file
done