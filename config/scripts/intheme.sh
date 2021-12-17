#!/usr/bin/env bash

yay -S kvantum-qt5 lxappearance papirus-icon-theme

echo "Installing vimix cursor"
git clone https://github.com/vinceliuice/Vimix-cursors
cd Vimix-cursors/
sudo ./install.sh
echo "Finished!"

echo "Installing whiteusr gtk"
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme
cd WhiteSur-gtk-theme/
sudo ./install.sh
echo "Finished!"

echo "Installing whitesur kvantum"
git clone https://github.com/vinceliuice/WhiteSur-kde
cd WhiteSur-kde/
sudo ./install.sh
echo "Finished"

echo "Removing downloaded files"
rm -rf Vimix-cursors/ WhiteSur-gtk-theme/ WhiteSur-kde/
echo "Done!"

