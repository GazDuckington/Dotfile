#!/usr/bin/env bash

ignored_files="(.(md|png|sh)|alacritty|[Ff]irefox|zathura|wezterm|glrnvim|vimix|systemd)"
dots=$(ls | egrep -v "${ignored_files}")
for f in $dots;do
	stow "${f}/"
done
