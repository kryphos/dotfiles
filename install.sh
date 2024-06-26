#!/bin/env bash

FONTS="
    font-manager
    noto-fonts noto-fonts-extra noto-fonts-emoji
    ttf-nerd-fonts-symbols powerline-fonts
    ttf-opensans ttf-fira-code ttf-hanazono ttf-caladea
"

FONTS_AUR="
    ttf-ms-fonts terminus-font-ttf
"

DEV="
    nix
    man-db man-pages
    make cmake ninja clang mold gdb rustup raylib
    texlive
    neovim neovide
    kitty zsh tmux fzf
    ipython python-pip opam
    docker docker-compose aws-cli terraform
    mingw-w64-gcc
"

DEV_AUR="
    pfetch
    oh-my-zsh-git
    gf2-git codelldb-bin
    act
    lazygit lazydocker-bin
    ghcup-hs-bin
"

UTILS="
    btop feh fd tk tldr tar zip unzip ripgrep ranger jq ntfs-3g thefuck cloc neofetch mpv
    gparted nemo
    polkit-kde-agent
    xdg-desktop-portal-gtk
    pipewire wireplumber
    waybar hyprpaper bemenu
    copyq wl-clipboard
    grim slurp
    nwg-look
"

UTILS_AUR="
    update-grub etcher-bin ani-cli-git
    headsetcontrol opentabletdriver
    hyprpicker hyprlock wlogout
    kripton-theme-git
"

PRINTER="
    sane cups system-config-printer python-pillow
"

GAMING="
    steam lutris wine gamescope mangohud
"

GAMING_AUR="
    minecraft-launcher path-of-building-community-git
"

PTESTING="
    nmap wireshark-qt aircrack-ng hydra john hashcat
"

PTESTING_AUR="
    metasploit-git zenmap
"

CARGO_PKGS="
    cargo-binstall rtx-cli bacon zoxide
"

CARGO_BIN_PKGS="
    starship exa bat du-dust
    irust evcxr_repl
    cargo-watch cargo-info cargo-expand cargo-make
    cross tmux-sessionizer
"

SOFTWARE="
    discord firefox thunderbird okular
    flameshot peek
    blender krita inkscape audacity xournalpp
    obs-studio pitivi
"

SOFTWARE_AUR="
    spotify spicetify-cli spicetify-themes-git
    betterdiscord-installer
    onlyoffice-bin blockbench-bin
    sfxr-qt-bin pavucontrol
    logseq-desktop-wayland-bin
    jdownloader2
"

RTX_LANGS="
    node@latest bun@latest
    java@latest maven@latest
    python@latest
    go@latest
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

sudo pacman -S $FONTS $DEV $UTILS $PRINTER $GAMING $PTESTING $SOFTWARE

yay -S $FONTS_AUR $DEV_AUR $UTILS_AUR $GAMING_AUR $PTESTING_AUR $SOFTWARE_AUR

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
