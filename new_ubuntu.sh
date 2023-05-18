#!/usr/bin/bash

#Add APT sources
sudo apt install curl -y
sudo apt install software-properties-common -y
sudo add-apt-repository universe
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo add-apt-repository ppa:appimagelauncher-team/stable
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
#Docker APT Source
sudo apt install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=\"$(dpkg --print-architecture)\" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  \"$(. /etc/os-release && echo "$VERSION_CODENAME")\" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#GH CLI APT Source
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
#Signal APT Source
# 1. Install our official public software signing key:
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

# 2. Add our repository to your list of repositories:
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list

# Update and Upgrade APT

sudo apt update
sudo apt upgrade

#Installs APT packages
sudo apt install gnome-tweaks -y
sudo apt install Ubuntu-restricted-extras -y
sudo apt install libfuse2 -y
sudo apt install vlc -y
sudo apt  install direnv -y
sudo apt install neovim -y
sudo apt install brave-browser -y
sudo apt install appimagelauncher -y
sudo apt install gnome-sushi -y
sudo apt install gnome-shell-extensions -y
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
sudo apt install terminator -y
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo apt install spotify-client -y
sudo apt  install tree -y
sudo apt install signal-desktop -y
sudo apt install libpam-u2f -y

#Clean Up APT
sudo apt autoclean
sudo apt autoremove
sudo apt clean

#Add Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#Install Rust
curl https://sh.rustup.rs -sSf | sh 

#Install Linuxbrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#Install Calibre
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

#Install Slack
wget -q https://slack.com/downloads/instructions/ubuntu -O - \
| tr "\t\r\n'" '   "' \
| grep -i -o '<a[^>]\+href[ ]*=[ \t]*"\(ht\|f\)tps\?:[^"]\+"' \
| sed -e 's/^.*"\([^"]\+\)".*$/\1/g' \
| grep 'slack-desktop' \
| xargs wget -q -O slack-desktop-latest.deb
sudo dpkg -i slack-desktop-latest.deb
rm slack-desktop*

#Install Go
echo; read -n 1 -r -s -p $"Install Go in your Downloads folder and press enter to continue"; echo
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf "$HOME"/Downloads/go1.*.tar.gz
echo "Go is installed"

#Set Up Docker
sudo groupadd docker
sudo usermod -aG docker "$USER"
newgrp docker
docker run hello-world
echo "Remember to log out and back in for these changes to take effect"

#Install Kubernetes et al.
sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubectl
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

#Git and GitHub

#install git and gh cli
sudo apt install git-all -y
sudo apt install gh -y

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
mkdir -p go/src
mkdir -p development

cd "$HOME"/go/src || exit
gh repo clone goversla/availability
gh repo clone cpustejovsky/event-store-template
gh repo clone cpustejovsky/franz
gh repo clone cpustejovsky/customsortgo
gh repo clone cpustejovsky/ready-steady-go
gh repo clone cpustejovsky/cockroach
gh repo clone cpustejovsky/mongotest
gh repo clone cpustejovsky/filedescriptorjson
gh repo clone cpustejovsky/learn-go-with-tests
gh repo clone cpustejovsky/service3-video

cd "$HOME"/development || exit
gh repo clone cpustejovsky/infrastructure_cookbook
gh repo clone cpustejovsky/cpustejovsky.github.io
gh repo clone cpustejovsky/second_brain
gh repo clone cpustejovsky/configs
gh repo clone cpustejovsky/bash_scripts
gh repo clone cpustejovsky/vim

#Set up bashrc configuration
cp "$HOME"/development/configs/bashrc.txt "$HOME"/.bashrc
source "$HOME"/.bashrc

echo "Install Todoist and Obsidian appimages manually after setting up appimagelauncher"
echo "Install "
#TODO determine a better way to remove snapd
