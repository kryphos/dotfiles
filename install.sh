#!/bin/bash

set -e

PACKAGES="
    act
    aircrack-ng
    alacritty
    ani-cli-git
    audacity
    awesome-terminal-fonts
    aws-cli-v2-bin
    bemenu-wayland
    betterdiscord-installer
    blender
    brightnessctl
    btop
    clang
    cloc
    cmake
    cmatrix
    code
    codelldb-bin
    copyq
    cups
    discord
    dnsmasq
    docker
    docker-compose
    entr
    fastfetch
    fd
    feh
    firefox
    flat-remix-gtk
    font-manager
    fzf
    gamemode
    gamescope
    gdb
    gf2-git
    ghcup-hs-bin
    giflib
    gnuplot
    gnutls
    gparted
    grim
    gst-plugins-base-libs
    gtk3
    handlr-regex
    hashcat
    headsetcontrol
    hydra
    hyprlock
    hyprpaper
    hyprpicker
    inkscape
    ipython
    jdownloader2
    john
    jq
    jupyterlab
    kitty
    kripton-theme-git
    krita
    kubectl
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
    lolcat
    lutris
    make
    man-db
    man-pages
    mangohud
    metasploit
    minecraft-launcher
    mingw-w64-gcc
    minikube
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
    pdftk
    pipewire
    pitivi
    polkit-kde-agent
    powerline-fonts
    python-pillow
    python-pip
    qemu-full
    qmk
    qutebrowser
    r2modman-bin
    ranger
    raylib
    ripgrep
    rustup
    sane
    sfxr-qt-bin
    slurp
    spicetify-cli
    spotify
    sqlite
    steam
    system-config-printer
    tar
    terminus-font-ttf
    terraform
    texlive
    texlive-langeuropean
    thunderbird
    tk
    tldr
    tmux
    trash-cli
    ttf-caladea
    ttf-fira-code
    ttf-hanazono
    ttf-ms-fonts
    ttf-opensans
    unzip
    update-grub
    v4l-utils
    valgrind
    ventoy-bin
    virt-manager
    vulkan-icd-loader
    vulkan-radeon
    waybar
    webcord-git
    whatsdesk-git
    wine-staging
    wireplumber
    wireshark-qt
    wl-clipboard
    wlogout
    xdg-desktop-portal-gtk
    xorg-xhost
    xournalpp
    xwaylandvideobridge
    zed
    zip
    zsh
"

CARGO_PKGS="
    cargo-binstall
 "

CARGO_BIN_PKGS="
    bacon
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
    rtx-cli
    starship
    tmux-sessionizer
    zoxide
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

## REMOVE PASSWORD FROM SUDO

if ! sudo grep -q '$USER' /etc/sudoers; then
    echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
fi

## CREATING / REMOVING FOLDERS AND LINKING

mkdir -p ~/.config/BetterDiscord/plugins
mkdir -p ~/.config/discord
mkdir -p ~/.config/fastfetch
mkdir -p ~/.config/kitty
mkdir -p ~/.config/nix
mkdir -p ~/.config/tmux
mkdir -p ~/.local
mkdir -p ~/.local/bin/
mkdir -p ~/code/

ln -sf $(pwd) ~/code/
ln -sf $(pwd)/configs/discord_settings.json ~/.config/discord/settings.json
ln -sf $(pwd)/configs/hypr ~/.config/
ln -sf $(pwd)/configs/nvim ~/.config/
ln -sf $(pwd)/configs/terminal/fastfetch.jsonc ~/.config/fastfetch/config.jsonc
ln -sf $(pwd)/configs/terminal/kitty.conf ~/.config/kitty/kitty.conf
ln -sf $(pwd)/configs/terminal/nix.conf ~/.config/nix/nix.conf
ln -sf $(pwd)/configs/terminal/rtx.toml ~/.rtx.toml
ln -sf $(pwd)/configs/terminal/starship.toml ~/.config/starship.toml
ln -sf $(pwd)/configs/terminal/tmux.conf ~/.config/tmux/tmux.conf
ln -sf $(pwd)/configs/terminal/zshrc ~/.zshrc
ln -sf $(pwd)/configs/waybar ~/.config/
ln -sf $(pwd)/configs/wlogout ~/.config/
sudo ln -sf $(pwd)/configs/blacklist.conf /etc/modprobe.d/blacklist.conf
sudo ln -sf $(pwd)/configs/grub /etc/default/grub
sudo ln -sf $(pwd)/configs/pacman.conf /etc/pacman.conf
sudo ln -sf $(pwd)/scripts/init-headset /usr/bin/init-headset
sudo ln -sf $(pwd)/scripts/system-update /usr/bin/system-update
sudo ln -sf $(pwd)/scripts/windows /usr/bin/windows
sudo ln -sf $(pwd)/scripts/xdg-open ~/.local/bin/xdg-open

## INSTALLING PACKAGES AND DEPENDENCIES

sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -Syyu --noconfirm

sudo pacman -S --needed --noconfirm git base-devel && \
    git clone https://aur.archlinux.org/yay.git && \
    cd yay && \
    makepkg -si --noconfirm && \
    cd .. && \
    rm -rf yay/

yay -S $PACKAGES --noconfirm
sudo pacman -S $(pacman -Sgq nerd-fonts) --noconfirm

sudo gpasswd -a $USER nix-users
sudo usermod -a -G nix-users $USER
sudo systemctl enable nix-daemon
sudo nix-channel --add https://nixos.org/channels/nixpkgs-unstable
sudo nix-channel --update

rustup default nightly
cargo install $CARGO_PKGS -j 8
cargo binstall $CARGO_BIN_PKGS -y

~/.cargo/bin/rtx install $RTX_LANGS -y

opam init --no-setup

/usr/bin/ghcup install ghc
/usr/bin/ghcup install cabal
/usr/bin/ghcup install hls
/usr/bin/ghcup install stack

wget "https://raw.githubusercontent.com/mwittrien/BetterDiscordAddons/af645f597c7e4da51a467d27f56f305edea6cb5e/Plugins/PluginRepo/PluginRepo.plugin.js" -O ~/.config/BetterDiscord/plugins/PluginRepo.plugin.js
wget "https://raw.githubusercontent.com/mwittrien/BetterDiscordAddons/af645f597c7e4da51a467d27f56f305edea6cb5e/Plugins/ThemeRepo/ThemeRepo.plugin.js" -O ~/.config/BetterDiscord/plugins/ThemeRepo.plugin.js


if [ ! -d ~/.config/spicetify/Themes/.git ]; then
    git clone --depth=1 https://github.com/spicetify/spicetify-themes.git ~/.config/spicetify/Themes/
fi

## DEFAULT HANDLERS

handlr set "application/pdf" okular
handlr set "application/x-www-form-urlencoded" firefox
handlr set "audio/*" mpv
handlr set "image/*" feh
handlr set "text/*" nvim
handlr set "video/*" mpv

## FURTHER CONFIG

sudo update-grub

~/.cargo/bin/tms config -p ~/code

git config --global credential.helper store

sudo gpasswd -a $USER docker

sudo systemctl enable cups

sudo chmod 777 /opt/spotify
sudo chmod 777 /opt/spotify/Apps -R
#/bin/spicetify config current_theme Sleek
#/bin/spicetify config color_scheme UltraBlack
#/bin/spicetify backup apply
