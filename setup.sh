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


echo "Do you want to install ZSH Shell? (y/n)?"
read ans
if [ "n" != $ans ]
then
# install zsh
sudo apt install zsh -y
# change default shell to zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
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

echo "Do you want to configure Static IP to the machine (y/n)?"
read ans
if [ "n" != $ans ]
then
sh ./static_ip_config.sh
fi


echo "Do you want to install NVIDIA drivers and CUDA Dependencies (y/n)?"
read ans
if [ "n" != $ans ]
then 
sh ./cuda_setup.sh
echo "CUDA Dependencies installed!!"
fi 


echo "Do you want to install miniconda (y/n)?"
read ans
if [ "n" != $ans ]
then 
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh ./Miniconda3-latest-Linux-x86_64.sh

echo "Miniconda installed!!"
fi

echo "Do you want to install Docker (y/n)?"
read ans
if [ "n" != $ans ]
then 
sh ./docker_installer.sh
fi

echo "Do you want to install and configure Samba (y/n)?"
read ans
if [ "n" != $ans ]
then 
sh ./samba_configuration.sh
fi 


echo "Do you want to install Chrome (y/n)?"
read ans
if [ "n" != $ans ]
then
# install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb --no-check-certificate
sudo apt install ./google-chrome-stable_current_amd64.deb 
fi

echo "Do you want to install brave browser (y/n)"
read ans
if [ "n" != $ans ]
then 
sudo apt install apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser -y
fi 



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


echo "Do you want to install OneNote (y/n)?"
read ans
if [ "n" != $ans ]
then 
sudo snap install p3x-onenote
fi

echo "Do you want to install Notion (y/n)?"
read ans
if [ "n" != $ans ]
then 
sudo snap install notion-snap
fi

echo "Do you want to install Xmind (y/n)?"
read ans
if [ "n" != $ans ]
then 
sudo snap install xmind
fi

echo "Do you want to install meshlab (y/n)?"
read ans
if [ "n" != $ans ]
then
sudo apt install meshlab -y
fi

echo "Do you want to install GIMP (y/n)?"
read ans
if [ "n" != $ans ]
then 
sudo snap install gimp
fi

echo "Do you want to install Blender (y/n)?"
read ans
if [ "n" != $ans ]
then 
wget https://www.blender.org/download/release/Blender4.4/blender-4.4.3-linux-x64.tar.xz/
tar -xf blender-4.4.3-linux-x64.tar.xz
fi

echo "Do you want to install Discord (y/n)?"
read ans
if [ "n" != $ans ]
then 
sudo snap install discord
fi

echo "Do you want to install Microsoft Teams (y/n)?"
read ans
if [ "n" != $ans ]
then
wget https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.4.00.13653_amd64.deb --no-check-certificate
sudo dpkg -i teams_1.4.00.13653_amd64.deb
fi

echo "Do you want to install VLC media player (y/n)?"
read ans
if [ "n" != $ans ]
then
sudo apt install vlc -y
fi

echo "Do you want to install Whitesur GTK theme and Icons pack (y/n)?"
read ans
if [ "n" != $ans ]
then
sh ./whitesur-theme.sh
fi

echo "Do you want to install Multi-touch gestures for trackpad?"
read ans 
if [ "n" != $ans ]
then 
sh ./fusuma-config.sh
sh ./fusuma-config2.sh 
fi

echo "Do you want to install LaTeX tools for Ubuntu (y/n)?
Warning: Installation of LaTeX tools will take quite some time. Only proceed if you have enough time for the installation."
read ans
if [ "n" != $ans ]
then
sudo apt update
sudo apt install texlive-full texmaker -y
fi

echo "Do you want to install AnyDesk (y/n)?"
read ans
if [ "n" != $ans ]
then
wget https://download.anydesk.com/linux/anydesk_6.1.1-1_amd64.deb --no-check-certificate
sudo apt install ./anydesk_6.1.1-1_amd64.deb -y
fi

echo "Do you want to install NoMachine (y/n)?"
read ans
if [ "n" != $ans ]
then
wget https://download.nomachine.com/download/9.0/Linux/nomachine_9.0.188_11_amd64.deb
sudo dpkg -i nomachine_9.0.188_11_amd64.deb
fi

echo "Do you want to install RustDesk? (y/n)?"
read ans 
if [ "n" != $ans ]
then
wget https://github.com/rustdesk/rustdesk/releases/download/1.4.0/rustdesk-1.4.0-x86_64.deb
sudo apt install ./rustdesk-1.4.0-x86_64.deb -y
fi  


echo "Do you want to install Spotify (y/n)?"
read ans
if [ "n" != $ans ]
then 
sudo snap install spotify
fi

echo "Do you want to install WhatsApp (y/n)?"
read ans
if [ "n" != $ans ]
then 
sudo snap install whatsdesk
fi

echo "Do you want to install Telegram Desktop (y/n)?"
read ans
if [ "n" != $ans ]
then
sudo snap install telegram-desktop 
fi 

echo "Do you want to install KeepassXC (y/n)?"
read ans 
if [ "n" != $ans ]
then 
sudo snap install keepassxc 
fi 


sudo apt autoremove -y 
sudo apt autoclean -y


echo "Set-up finished!!"
