#!/bin/sh

dots=$(ls -I '*.md' -I '*.png' -I '*.sh' -I 'chrome')
for f in $dots;do
	stow "${f}/"
done
