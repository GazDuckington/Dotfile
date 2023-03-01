#!/usr/bin/env bash

ignored_files="(.(md|png|sh)|dk|home|[Ff]irefox|zathura|sioyek|helix|tmux|rofi|dunst|picom|wezterm|glrnvim|vimix|systemd)"
dots=$(ls | grep -Ev "${ignored_files}")
for f in $dots;do
	stow "${f}/"
done
