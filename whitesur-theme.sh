git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
cd WhiteSur-gtk-theme
./install.sh -c dark -c light
./install.sh -i ubuntu

gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-dark-solid"
echo "Whitesur theme installed!!"

cd .. 
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd WhiteSur-icon-theme
./install.sh

gsettings set org.gnome.desktop.interface icon-theme "WhiteSur-dark"
echo "WhiteSur Icon theme installed!!"


