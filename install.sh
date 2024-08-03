#!/bin/bash

PACKAGES="
    act
    aircrack-ng
    ani-cli-git
    armitage-git
    aseprite
    audacity
    aws-cli
    bemenu
    betterdiscord-installer
    blender
    blockbench-bin
    btop
    chatterino2
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
    gamescope
    gdb
    gf2-git
    ghcup-hs-bin
    gparted
    grim
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
    mpv
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
    valgrind
    virt-manager
    waybar
    whatsdesk-git
    wine
    wireplumber
    wireshark-qt
    wl-clipboard
    wlogout
    xdg-desktop-portal-gtk
    xournalpp
    ytfzf
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

sudo pacman -R yarn dunst --noconfirm
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
