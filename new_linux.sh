#!/usr/bin/bash

# Update and Upgrade Arch
sudo pacman -Syu

#Installs Pacman packages
#TODO: install flatpak

# Install the latest version of PostgreSQL.
# If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':

#Add Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#Install Rust
curl https://sh.rustup.rs -sSf | sh 

#Install Linuxbrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#Install Calibre
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

#Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

#Install QMK
python3 -m pip install --user qmk
qmk setup

#Set Up Docker
# TODO: make sure this is correct
sudo groupadd docker
sudo usermod -aG docker "$USER"
newgrp docker
docker run hello-world
echo "Remember to log out and back in for these changes to take effect"

#Install Kubernetes et al.
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

#Git and GitHub

#install git and gh cli

#generate ssh keys
read -r -e -p "Enter Your Email Address: " EMAIL
git config --global user.email "$EMAIL"
read -r -e -p "Enter Your Full Name: " NAME
git config --global user.name "$NAME"

ssh-keygen -t ed25519 -C "$EMAIL"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
echo; read -n 1 -r -s -p $"Add your ssh credentials to GitHub (https://github.com/settings/keys) and press Enter to continue"; echo

gh auth login

#clone repos
cd "$HOME" || exit
mkdir -p development

cd "$HOME"/development/go || exit
gh repo clone goversla/availability
gh repo clone cpustejovsky/event-store-template
gh repo clone cpustejovsky/franz
gh repo clone cpustejovsky/giles
gh repo clone cpustejovsky/customsortgo
gh repo clone cpustejovsky/ready-steady-go
gh repo clone cpustejovsky/mongotest
gh repo clone cpustejovsky/filedescriptorjson
gh repo clone cpustejovsky/learn-go-with-tests
gh repo clone cpustejovsky/service3-video
gh repo clone cpustejovsky/personal-site

cd "$HOME"/development || exit
gh repo clone cpustejovsky/infrastructure_cookbook
gh repo clone cpustejovsky/cpustejovsky.github.io
gh repo clone cpustejovsky/second_brain
gh repo clone cpustejovsky/configs
gh repo clone cpustejovsky/bash_scripts
gh repo clone cpustejovsky/vim

# Add global gitignore and git user name and emailk
touch "$HOME"/.gitignore
echo ".idea/*" >> "$HOME"/.gitignore
git config --global core.excludesfile ~/.gitignore

timedatectl set-local-rtc 1

#ZSH
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp /home/cpustejovsky/development/configs/zshrc.txt /home/cpustejovsky/.zshrc
cp /home/cpustejovsky/development/configs/"Menlo for Powerline.ttf" ~/.fonts
fc-cache -vf ~/.fonts

#Install Go
#TODO: refactor all of this
echo; read -n 1 -r -s -p $"Install Go in your Downloads folder and press enter to continue"; echo
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf "$HOME"/Downloads/go1.*.tar.gz
echo "Go is installed"

#Set up bashrc configuration
cp "$HOME"/development/configs/bashrc.txt "$HOME"/.bashrc
source "$HOME"/.bashrc
