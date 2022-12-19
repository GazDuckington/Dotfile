#!/bin/sh

ignored_files='(.(md|png|sh)|chrome)'
dots=$(ls | egrep -v "${ignored_files}")
for f in $dots;do
	stow "${f}/"
done
