#/bin/env bash

git config --global credential.helper store

sudo gpasswd -a $USER docker

sudo systemctl enable cups

sudo update-grub

sudo chmod 777 /opt/spotify
sudo chmod 777 /opt/spotify/Apps -R
#/bin/spicetify config current_theme Sleek
#/bin/spicetify config color_scheme UltraBlack
#/bin/spicetify backup apply
