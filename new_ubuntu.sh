#!/usr/bin/env sh

#general essentials for Ubuntu
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
sudo apt-get install gnome-sushi

#applications I want installed
sudo apt install libfuse2
sudo apt-get install curl
sudo snap install vlc
sudo apt install git-all
sudo rm -rf /usr/local/go && tar -C /usr/local -xzf "$HOME"/Downloads/go1.20.2.linux-amd64.tar.gz
sudo curl -fsSL https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh | bash