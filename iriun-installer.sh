#!/usr/bin/env bash

sudo clear

echo Downloading

cd ~/Downloads && wget -r --no-parent -A "iriunwebcam-*.deb" https://iriun.gitlab.io/
mkdir ~/Downloads/Iriun
mv ~/Downloads/iriun.gitlab.io/iriunwebcam-*.deb ~/Downloads/Iriun
cd ~/Downloads/Iriun && ar vx ~/Downloads/Iriun/iriunwebcam-*.deb
cd ~/Downloads/Iriun && tar -xf ~/Downloads/Iriun/data.tar.xz
mv ~/Downloads/Iriun/usr/local/bin/iriunwebcam ~/.local/bin/
rm -rf ~/Downloads/Iriun && rm -rf ~/Downloads/iriun.gitlab.io

echo Done, run it by typing iriunwebcam
