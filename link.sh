#/bin/bash

mkdir -p ~/.config/BetterDiscord/plugins
mkdir -p ~/.config/tmux
mkdir -p ~/.config/discord

rm -rf ~/.config/hypr

ln -sf $(pwd)/configs/hypr ~/.config/
ln -sf $(pwd)/configs/nvim ~/.config/
ln -sf $(pwd)/configs/waybar ~/.config/
ln -sf $(pwd)/configs/terminal/zshrc ~/.zshrc
ln -sf $(pwd)/configs/terminal/starship.toml ~/.config/
ln -sf $(pwd)/configs/terminal/tmux.conf ~/.config/tmux/tmux.conf
ln -sf $(pwd)/configs/terminal/kitty.conf ~/.config/kitty/kitty.conf
ln -sf $(pwd)/configs/terminal/rtx.toml ~/.rtx.toml
ln -sf $(pwd)/configs/discord_settings.json ~/.config/discord/settings.json
sudo ln -sf $(pwd)/configs/grub /etc/default/grub
sudo ln -sf $(pwd)/configs/blacklist.conf /etc/modprobe.d/blacklist.conf
sudo ln -sf $(pwd)/configs/pacman.conf /etc/pacman.conf
sudo ln -sf $(pwd)/files/windows /usr/bin/windows
