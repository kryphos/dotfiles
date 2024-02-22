#!/bin/bash

# prompt installation target
read -p "Install for PC(1) or Notebook(2)? > " choice
if [ $choice != 1 ] && [ $choice != 2 ]; then
  echo "Invalid input."
  exit 1
fi

# directly use new pacman confs
sudo ln -sf $(pwd)/configs/pacman.conf /etc/pacman.conf

# update system
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -Syyu --noconfirm

# install aur helper
sudo pacman -S --needed --noconfirm git base-devel && \
    git clone https://aur.archlinux.org/yay.git && \
    cd yay && \
    makepkg -si --noconfirm && \
    cd .. && \
    rm -rf yay/

# install software
sudo pacman -S man-db man-pages btop neovim discord firefox neovide picom mold krita \
  sane cups system-config-printer python-pillow thunderbird okular flameshot peek kitty \
  tmux ripgrep ranger audacity obs-studio xournalpp gparted vlc feh gdb clang docker \
  docker-compose cloc make cmake fd tldr python-pip python-reportlab tar zip unzip \
  zsh nemo font-manager texlive xclip blender inkscape ipython raylib lib32-nvidia-utils \
  wine nmap wireshark-qt aircrack-ng hydra john hashcat ntfs-3g ttf-hanazono ttf-caladea \
  ttf-opensans noto-fonts-extra ttf-nerd-fonts-symbols ttf-fira-code powerline-fonts zenmap \
  thefuck
yay -S update-grub etcher-bin spotify onlyoffice-bin headsetcontrol opentabletdriver \
  spicetify-cli spicetify-themes-git oh-my-zsh-git act blockbench-bin metasplit-git pfetch \
  lxappearance-gtk3 gtk-theme-material-black pavucontrol betterdiscord-installer lazygit \
  codelldb sfxr-qt-bin boomer-git lazydocker ani-cli-git ttf-ms-fonts terminus-font-ttf \
  noto-fonts noto-fonts-emoji

# install separate pc/notebook software
if [ $choice == 1 ]; then
  sudo pacman -S steam lutris
  yay -S minecraft-launcher path-of-building-community-git
else
  sudo pacman -S xf86-input-synaptics
fi

# rust
sudo pacman -R rust --noconfirm
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
~/.cargo/bin/rustup default nightly
~/.cargo/bin/cargo install cargo-binstall rtx-cli bacon zoxide
~/.cargo/bin/cargo binstall exa bat irust du-dust cargo-watch evcxr_repl starship cargo-info \
  cargo-expand cargo-make cross systemfd sqlx-cli -y

# cleanup
sudo pacman -R nodejs yarn node-gyp semver npm nodejs-nopt --noconfirm
~/.cargo/bin/rtx install node@latest bun@latest java@latest maven@latest python@latest -y

# git config
git config --global credential.helper store

# make docker not need sudo
sudo gpasswd -a $USER docker

# enable printer service
sudo systemctl enable cups

# config grub
sudo ln -sf $(pwd)/configs/grub /etc/default/grub
sudo update-grub

# link config files
mkdir -p ~/.config/i3
mkdir -p ~/.config/i3status
mkdir -p ~/.config/BetterDiscord/plugins
mkdir -p ~/.config/picom
mkdir -p ~/.config/tmux
mkdir -p ~/.config/kitty
mkdir -p ~/.config/discord

ln -sf $(pwd)/configs/i3 ~/.config/i3/config
ln -sf $(pwd)/configs/zshrc ~/.zshrc
ln -sf $(pwd)/configs/nvim ~/.config/
ln -sf $(pwd)/configs/starship.toml ~/.config/
ln -sf $(pwd)/configs/picom.conf ~/.config/picom/
ln -sf $(pwd)/configs/tmux.conf ~/.config/tmux/tmux.conf
ln -sf $(pwd)/configs/kitty.conf ~/.config/kitty/kitty.conf
ln -sf $(pwd)/configs/discord_settings.json ~/.config/discord/settings.json
ln -sf $(pwd)/configs/rtx.toml ~/.rtx.toml
sudo ln -sf $(pwd)/configs/blacklist.conf /etc/modprobe.d/blacklist.conf
sudo ln -sf $(pwd)/files/windows /usr/bin/windows

if [ $choice == 1 ]; then
    ln -sf $(pwd)/configs/i3status ~/.config/i3status/config
else
    ln -sf $(pwd)/configs/i3status_notebook ~/.config/i3status/config
    sudo ln -sf $(pwd)/configs/synaptics /etc/X11/xorg.conf.d/70-synaptics.conf
fi

# install betterdiscord plugins (theme: AMOLED-Cord)
wget "https://raw.githubusercontent.com/mwittrien/BetterDiscordAddons/af645f597c7e4da51a467d27f56f305edea6cb5e/Plugins/PluginRepo/PluginRepo.plugin.js" -O ~/.config/BetterDiscord/plugins/PluginRepo.plugin.js
wget "https://raw.githubusercontent.com/mwittrien/BetterDiscordAddons/af645f597c7e4da51a467d27f56f305edea6cb5e/Plugins/ThemeRepo/ThemeRepo.plugin.js" -O ~/.config/BetterDiscord/plugins/ThemeRepo.plugin.js

# let spicetify-cli change files
sudo chmod 777 /opt/spotify
sudo chmod 777 /opt/spotify/Apps -R
#/bin/spicetify config current_theme Sleek
#/bin/spicetify config color_scheme UltraBlack
#/bin/spicetify backup apply
