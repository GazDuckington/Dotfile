#!/usr/bin/env bash

ignored_files='(.(md|png|sh)|[Ff]irefox|tmux|alacritty|zathura|wezterm|glrnvim|vimix)'
dots=$(ls | egrep -v "${ignored_files}")
for f in $dots;do
	stow "${f}/"
done
