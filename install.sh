#!/usr/bin/env bash

ignored_files="(.(md|png|sh)|home|theme*|picom|polybar|[Ff]irefox|zathura|wezterm|glrnvim|vimix|systemd)"
dots=$(/usr/bin/ls | /usr/bin/grep -Ev "${ignored_files}")
for f in $dots;do
	stow "${f}/"
done
