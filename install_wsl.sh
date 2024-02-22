#!/bin/bash

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
sudo pacman -S noconfirm man-db man-pages btop neovim tmux ripgrep ranger gdb clang docker \
  docker-compose cloc make cmake fd tldr python-pip tar zip unzip zsh xclip mold ipython thefuck
yay -S oh-my-zsh-git act pfetch codelldb lazydocker lazygit

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

# link config files
mkdir -p ~/.config/tmux

ln -sf $(pwd)/configs/zshrc ~/.zshrc
ln -sf $(pwd)/configs/nvim ~/.config/
ln -sf $(pwd)/configs/starship.toml ~/.config/
ln -sf $(pwd)/configs/tmux.conf ~/.config/tmux/tmux.conf
ln -sf $(pwd)/configs/rtx.toml ~/.rtx.toml
