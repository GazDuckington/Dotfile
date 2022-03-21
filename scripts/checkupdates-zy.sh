#!/usr/bin/env bash
up=$(zypper lu | wc -l)

if [[ "$up" -le 3 ]]
then
	count=0
else
	count=$(( $up-3 ))
fi

echo "$count"
