#! /usr/bin/env bash

sudo pacman -S --needed

yay -S --needed

paclist="gamemode lib32-vulkan-icd-loader lib32-vulkan-intel vulkan-icd-loader vulkan-intel \
giflib gnutls gst-plugins-bad gst-plugins-base gst-plugins-base-libs gst-plugins-good gst-plugins-ugly \
jq lib32-giflib lib32-gnutls lib32-gst-plugins-base-libs lib32-libjpeg-turbo lib32-libldap lib32-libpng \
lib32-libxcomposite lib32-libxinerama lib32-libxslt lib32-mpg123 lib32-opencl-icd-loader lib32-sdl2 \
lib32-v4l-utils libgphoto2 libjpeg-turbo libldap libpng libxcomposite libxinerama libxslt mono mpg123 \
opencl-icd-loader sdl2 v4l-utils wine-staging \
alsa-lib alsa-plugins lib32-alsa-lib lib32-alsa-plugins lib32-libpulse libpulse fluidsynth openal"

yaylist="vkd3d-proton-bin"

main() {
    if [ "$1" == "in" ]; then
        sudo pacman -S --needed $paclist
        yay -S --needed $yaylist
    fi

    if [ "$1" == "rm" ]; then
        sudo pacman -R $paclist
        yay -R $yaylist
    fi
}

main $1