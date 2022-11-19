#!/usr/bin/env bash

DIR=$(fd -p ~/dev/ -t d -d 2 | fzf --layout reverse --border rounded --ansi)

if [ ! -z $DIR ]; then
	nvim $DIR
fi
