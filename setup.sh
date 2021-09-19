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
sudo apt update -y
sudo apt install libz-dev libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext cmake gcc -y
echo "Enter your GitHub username"
read usrnm
git config --global user.name "$usrnm"
echo "Enter your gitHub email"
read gemail
git config --global user.email "$gemail"
echo "git configured!"
fi

echo "Do you want to install miniconda?"
read ans
if [ "n" != $ans ]
then 
wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh
sh ./Miniconda3-py38_4.10.3-Linux-x86_64.sh
echo "Miniconda installed!!"
fi


echo "Do you want to install Chrome (y/n)?"
read ans
if [ "n" != $ans ]
then
# install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
fi

echo "Do you want to install essentials?"
read ans 
if [ "n" != $ans ]
then
echo "Installing essentials..."
echo "Installing nvtop..."
sudo apt install nvtop -y
echo "Installing tmux..."
sudo apt install tmux -y
echo "Installing net-tools..."
sudo apt install net-tools -y
echo "Installing SSH..."
sudo apt install openssh-server -y
echo "Installing VSCode..."
sudo snap install code --classic 
echo "Installing Gnome Tweaks..."
sudo apt install gnome-tweak-tool -y
echo "Installing gnome shell extensions..."
sudo apt install gnome-shell-extensions -y
sudo apt install chrome-gnome-shell -y
fi

echo "Do you want to install OneNote?"
read ans
if [ "n" != $ans ]
then 
sudo snap install p3x-onenote
fi

echo "Do you want to install meshlab?"
read ans
if [ "n" != $ans]
then
sudo snap install meshlab
fi

echo "Do you want to install GIMP?"
read ans
if [ "n" != $ans ]
then 
sudo snap install gimp
fi

echo "Do you want to install Blender?"
read ans
if [ "n" != $ans ]
then 
sudo snap install blender
fi

echo "Do you want to install Discord?"
read ans
if [ "n" != $ans ]
then 
sudo snap install discord
fi

echo "Do you want to install Microsoft Teams?"
read ans
if [ "n" != $ans ]
then
wget https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.4.00.13653_amd64.deb
sudo dpkg -i teams_1.4.00.13653_amd64.deb
fi


echo "Do you want to install Whitesur GTK theme?"
read ans
if [ "n" != $ans ]
then
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
cd WhiteSur-gtk-theme
./install.sh -c dark -c light
./install.sh -i ubuntu
fi

echo "Do you want to install AnyDesk?"
read ans
if [ "n" != $ans ]
then
sudo apt install anydesk -y
fi


sudo apt autoremove -y 
sudo apt autoclean -y


echo "Set-up finished!!"
