#!/bin/sh
cliphist list | \
	anyrun --plugins libstdin.so | \
	cliphist decode | \
	wl-copy

