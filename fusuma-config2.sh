sudo apt-get install libinput-tools -y 
sudo apt-get install ruby 
sudo gem install fusuma 
sudo apt-get install xdotool -y 

sudo gem update fusuma 
mkdir -p ~/.config/fusuma
touch ~/.config/fusuma/config.yml 
sudo cat fusuma-conf.txt >> ~/.config/fusuma/config.yml

echo "Fusuma Multi-touch gestures installed and configured!! Please add the command 'fusuma' in startup applications to deploy fusuma everytime you boot your computer!!"
