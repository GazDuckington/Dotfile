#!/bin/sh

ignored_files='(.(md|png|sh)|[Ff]irefox)'
dots=$(ls | egrep -v "${ignored_files}")
for f in $dots;do
	stow "${f}/"
done
