#!/usr/bin/env sh

sudo apt update
sudo apt upgrade
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool
sudo ufw enable
sudo apt-get install gufw
sudo apt-get install Ubuntu-restricted-extras
sudo apt-get install tlp tlp-rdw
sudo systemct1 enable tlp
sudo apt-get autoclean
sudo apt-get autoremove
sudo apt-get clean
sudo apt-get install flatpak
sudo apt-get install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub-org/repo/flathub.flatpakrepo
sudo snap install vlc
sudo apt-get install gnome-sushi