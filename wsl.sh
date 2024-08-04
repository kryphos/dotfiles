#!/bin/bash

PACKAGES="
    act
    aircrack-ng
    aws-cli
    btop
    clang
    cloc
    cmake
    codelldb-bin
    docker
    docker-compose
    fastfetch
    fd
    fzf
    gdb
    ghcup-hs-bin
    hashcat
    hydra
    ipython
    john
    jq
    lazydocker-bin
    lazygit
    libpqxx
    make
    man-db
    man-pages
    metasploit-git
    mingw-w64-gcc
    mold
    neofetch
    neovim
    ninja
    nix
    nmap
    noto-fonts
    noto-fonts-emoji
    noto-fonts-extra
    ntfs-3g
    oh-my-zsh-git
    opam
    pfetch
    powerline-fonts
    python-pillow
    python-pip
    ranger
    raylib
    ripgrep
    rustup
    tar
    terminus-font-ttf
    terraform
    texlive
    tk
    tldr
    tmux
    trash-cli
    ttf-caladea
    ttf-fira-code
    ttf-hanazono
    ttf-ms-fonts
    ttf-nerd-fonts-symbols
    ttf-opensans
    unzip
    valgrind
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

## LINKING CONFIGS

mkdir -p ~/.config/tmux

ln -sf $(pwd)/configs/nvim ~/.config/
ln -sf $(pwd)/configs/terminal/rtx.toml ~/.rtx.toml
ln -sf $(pwd)/configs/terminal/starship.toml ~/.config/
ln -sf $(pwd)/configs/terminal/tmux.conf ~/.config/tmux/tmux.conf
ln -sf $(pwd)/configs/terminal/zshrc ~/.zshrc
sudo ln -sf $(pwd)/configs/blacklist.conf /etc/modprobe.d/blacklist.conf
sudo ln -sf $(pwd)/configs/pacman.conf /etc/pacman.conf
sudo ln -sf $(pwd)/scripts/system-update /usr/bin/system-update

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

## FURTHER CONFIG

git config --global credential.helper store

sudo gpasswd -a $USER docker

sudo usermod -a -G nix-users $USER
su - $USER
systemctl enable nix-daemon
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update
