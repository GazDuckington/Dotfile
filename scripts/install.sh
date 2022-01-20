#!/usr/bin/env bash

function installyay(){
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si
    cd ~
}

function setupterm(){
    yay -S --needed --noconfirm fish kitty starship
    echo "Copying config files"
    cp -r ~/Dotfile/config/fish/ ~/.config
    cp -r ~/Dotfile/config/kitty/ ~/.config
    cp -r ~/Dotfile/config/omf/ ~/.config
    cp -r ~/Dotfile/config/starship.toml ~/.config
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
    sudo chsh -s $(which fish)
}

function setupdesktop(){
    yay -S --needed --noconfirm polkit-gnome gnome-keyring i3-wm i3lock-color i3ass xidlehook btop rofi i3status-rust dunst picom pipewire pipewire-pulse pulsemixer networkmanager
    echo "Copying config files"
    cp -r ~/Dotfile/scripts/ ~/
    cp -r ~/Dotfile/config/dunst/ ~/.config
    cp -r ~/Dotfile/config/picom/ ~/.config
    cp -r ~/Dotfile/config/rofi/ ~/.config
    cp -r ~/Dotfile/config/i3/ ~/.config
    echo "exec i3" >> ~/.xinitrc
}

function installtheme(){
    yay -S kvantum-qt5 lxappearance papirus-icon-theme materia-gtk-theme kvantum-materia-theme

    echo "Installing vimix cursor"
    git clone https://github.com/vinceliuice/Vimix-cursors
    cd Vimix-cursors/
    sudo ./install.sh
    cd ~

    echo "Removing downloaded files"
    rm -rf ~/Vimix-cursors/
    echo "Done!"
}

main(){
    sudo pacman -S --needed git base-devel
    installyay
    setupdesktop
    setupterm
    installtheme
}