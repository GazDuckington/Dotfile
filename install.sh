#!/usr/bin/env bash

ignored_files="(.(md|png|sh)|home|[Ff]irefox|zathura|wezterm|glrnvim|vimix|systemd)"
dots=$(ls | grep -Ev "${ignored_files}")
for f in $dots;do
	stow "${f}/"
done
