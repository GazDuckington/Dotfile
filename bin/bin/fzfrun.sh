#!/usr/bin/sh

APP=$(compgen -c | fzf --layout reverse --border rounded --ansi)

if [ -n "$APP" ]; then
	$APP
fi
