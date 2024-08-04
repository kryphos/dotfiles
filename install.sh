#!/bin/bash

PACKAGES="
    act
    aircrack-ng
    alsa-lib
    alsa-plugins
    ani-cli-git
    aseprite
    audacity
    aws-cli
    bemenu
    betterdiscord-installer
    blender
    blockbench-bin
    btop
    clang
    cloc
    cmake
    codelldb-bin
    copyq
    cups
    discord
    docker
    docker-compose
    fastfetch
    fd
    feh
    firefox
    flameshot
    flat-remix-gtk
    font-manager
    fzf
    gamemode
    gamescope
    gdb
    gf2-git
    ghcup-hs-bin
    giflib
    gnutls
    gparted
    grim
    gst-plugins-base-libs
    gtk3
    hashcat
    headsetcontrol
    hexchat
    hydra
    hyprlock
    hyprpaper
    hyprpicker
    inkscape
    ipython
    jdownloader2
    john
    jq
    kitty
    kripton-theme-git
    krita
    lazydocker-bin
    lazygit
    lib32-alsa-lib
    lib32-alsa-plugins
    lib32-giflib
    lib32-gnutls
    lib32-gst-plugins-base-libs
    lib32-gtk3
    lib32-libgcrypt
    lib32-libgpg-error
    lib32-libjpeg-turbo
    lib32-libldap
    lib32-libpng
    lib32-libpulse
    lib32-libva
    lib32-libxcomposite
    lib32-libxinerama
    lib32-libxslt
    lib32-mesa
    lib32-mpg123
    lib32-ncurses
    lib32-openal
    lib32-opencl-icd-loader
    lib32-sqlite
    lib32-v4l-utils
    lib32-vulkan-icd-loader
    lib32-vulkan-icd-loader
    lib32-vulkan-radeon
    libgcrypt
    libgpg-error
    libjpeg-turbo
    libldap
    libpng
    libpqxx
    libpulse
    libva
    libxcomposite
    libxinerama
    libxslt
    logseq-desktop-wayland-bin
    lutris
    make
    man-db
    man-pages
    mangohud
    metasploit-git
    minecraft-launcher
    mingw-w64-gcc
    mold
    mpg123
    mpv
    ncurses
    nemo
    neofetch
    neovide
    neovim
    ninja
    nix
    nmap
    noto-fonts
    noto-fonts-emoji
    noto-fonts-extra
    ntfs-3g
    nwg-look
    obs-studio
    oh-my-zsh-git
    okular
    onlyoffice-bin
    opam
    openal
    opencl-icd-loader
    opentabletdriver
    path-of-building-community-git
    pavucontrol
    peek
    pfetch
    pipewire
    pitivi
    polkit-kde-agent
    powerline-fonts
    python-pillow
    python-pip
    qemu-full
    qutebrowser
    ranger
    raylib
    ripgrep
    rustup
    sane
    sfxr-qt-bin
    slurp
    spicetify-cli
    spicetify-themes-git
    spotify
    sqlite
    steam
    system-config-printer
    tar
    terminus-font-ttf
    terraform
    texlive
    thunderbird
    tk
    tldr
    tmux
    ttf-caladea
    ttf-fira-code
    ttf-hanazono
    ttf-ms-fonts
    ttf-nerd-fonts-symbols
    ttf-opensans
    unzip
    update-grub
    v4l-utils
    valgrind
    virt-manager
    vulkan-icd-loader
    vulkan-icd-loader
    vulkan-radeon
    waybar
    whatsdesk-git
    wine-staging
    wireplumber
    wireshark-qt
    wl-clipboard
    wlogout
    xdg-desktop-portal-gtk
    xorg-xhost
    xournalpp
    zenmap
    zip
    zsh
"

CARGO_PKGS="
    bacon
    cargo-binstall
    rtx-cli
    zoxide
 "

CARGO_BIN_PKGS="
    bat
    cargo-expand
    cargo-info
    cargo-make
    cargo-watch
    cross
    du-dust
    evcxr_repl
    exa
    irust
    starship
    tmux-sessionizer
"

RTX_LANGS="
    bun@latest
    go@latest
    java@latest
    maven@latest
    node@latest
    python@latest
    zig@latest
"

## LINKING CONFIGS

mkdir -p ~/.config/BetterDiscord/plugins
mkdir -p ~/.config/discord
mkdir -p ~/.config/tmux
rm -rf ~/.config/hypr

ln -sf $(pwd)/configs/discord_settings.json ~/.config/discord/settings.json
ln -sf $(pwd)/configs/hypr ~/.config/
ln -sf $(pwd)/configs/nvim ~/.config/
ln -sf $(pwd)/configs/terminal/kitty.conf ~/.config/kitty/kitty.conf
ln -sf $(pwd)/configs/terminal/rtx.toml ~/.rtx.toml
ln -sf $(pwd)/configs/terminal/starship.toml ~/.config/
ln -sf $(pwd)/configs/terminal/tmux.conf ~/.config/tmux/tmux.conf
ln -sf $(pwd)/configs/terminal/zshrc ~/.zshrc
ln -sf $(pwd)/configs/waybar ~/.config/
ln -sf $(pwd)/configs/wlogout ~/.config/
sudo ln -sf $(pwd)/configs/blacklist.conf /etc/modprobe.d/blacklist.conf
sudo ln -sf $(pwd)/configs/grub /etc/default/grub
sudo ln -sf $(pwd)/configs/pacman.conf /etc/pacman.conf
sudo ln -sf $(pwd)/scripts/system-update /usr/bin/system-update
sudo ln -sf $(pwd)/scripts/windows /usr/bin/windows

## INSTALLING PACKAGES

sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -Syyu --noconfirm

sudo pacman -S --needed --noconfirm git base-devel && \
    git clone https://aur.archlinux.org/yay.git && \
    cd yay && \
    makepkg -si --noconfirm && \
    cd .. && \
    rm -rf yay/

yay -S $PACKAGES

rustup default nightly
cargo install $CARGO_PKGS -j 8
cargo binstall $CARGO_BIN_PKGS -y

~/.cargo/bin/rtx install $RTX_LANGS -y

opam init

/usr/bin/ghcup install ghc
/usr/bin/ghcup install cabal
/usr/bin/ghcup install hls
/usr/bin/ghcup install stack

# for nvim jupynium
pip install --upgrade notebook nbclassic

wget "https://raw.githubusercontent.com/mwittrien/BetterDiscordAddons/af645f597c7e4da51a467d27f56f305edea6cb5e/Plugins/PluginRepo/PluginRepo.plugin.js" -O ~/.config/BetterDiscord/plugins/PluginRepo.plugin.js
wget "https://raw.githubusercontent.com/mwittrien/BetterDiscordAddons/af645f597c7e4da51a467d27f56f305edea6cb5e/Plugins/ThemeRepo/ThemeRepo.plugin.js" -O ~/.config/BetterDiscord/plugins/ThemeRepo.plugin.js

## FURTHER CONFIG

git config --global credential.helper store

xhost +SI:localuser:root

sudo gpasswd -a $USER docker

sudo systemctl enable cups

sudo update-grub

sudo usermod -a -G nix-users $USER
systemctl enable nix-daemon
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update

sudo chmod 777 /opt/spotify
sudo chmod 777 /opt/spotify/Apps -R
#/bin/spicetify config current_theme Sleek
#/bin/spicetify config color_scheme UltraBlack
#/bin/spicetify backup apply
