#!/usr/bin/sh

APP=$(compgen -c | fzf --layout reverse --border rounded --ansi)

if [ ! -z $APP ]; then
	$APP
fi
