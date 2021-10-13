sudo apt update
sudo apt install samba

mkdir ~/sambashare

sudo cat samba-conf.txt >> /etc/samba/smb.conf
sudo service smbd restart
sudo ufw allow samba

sudo smbpasswd -a $USER

echo "Samba installed and configured!!"
