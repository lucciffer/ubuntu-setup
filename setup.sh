#!/bin/bash

# software update
sudo apt update -y
sudo apt upgrade -y



echo "Do you want to install Slack (y/n)?"
read ans
if [ "n" != $ans ]
then
# install slack
sudo snap install slack --classic
fi


echo "Do you want to install git (y/n)?"
read ans
if [ "n" != $ans ]
then
# install git
sudo apt install git
sudo apt update
sudo apt install libz-dev libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext cmake gcc
echo "Enter your GitHub username"
read usrnm
echo "Enter your gitHub email"
read gemail
git config --global user.name "$usrnm"
git config --global user.email "$gemail"
echo "git configured!"
fi

echo "Do you want to install Chrome (y/n)?"
read ans
if [ "n" != $ans ]
then
# install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
fi

echo "Installing essentials..."
echo "Installing nvtop..."
sudo apt install nvtop 
echo "Installing tmux..."
sudo apt install tmux 
echo "Installing net-tools..."
sudo apt install net-tools
echo "Installing SSH..."
sudo apt install openssh-server
echo "Installing VSCode..."
sudo snap install code --classic
echo "Installing Gnome Tweaks..."
sudo apt install gnome-tweak-tool


echo "Do you want to install Whitesur GTK theme?"
read ans
if [ "n" != ans ]
then
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
cd WhiteSur-gtk-theme
./install.sh -c dark -c light
./install.sh -i ubuntu
fi

echo "Do you want to install AnyDesk?"
read ans
if [ "n" != $anyans ]
then
sudo apt install anydesk
fi


sudo apt autoremove -y 
sudo apt autoclean -y


echo "Set-up finished!!"
