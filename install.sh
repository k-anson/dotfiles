#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

# Update system and install base packages
sudo apt-get update -y
sudo apt-get install -y fzf

# Install neovim
curl -LO "https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb"
#tar xf nvim-linux64.tar.gz
sudo install nvim-linux64.deb
#sudo ln -s ./nvim-linux64/bin/nvim /usr/local/bin
#curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
#chmod u+x nvim.appimage
#./nvim.appimage --appimage-extract
#./squashfs-root/AppRun --version

# Install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

stow --target=$HOME nvim tmux vim
ln -s ${PWD}/config/nvim ~/.config/nvim
ln -s ${PWD}/config/tmux ~/tmux
ln -s ${PWD}/config/vim ~/vim

nvim --headless +PlugInstall +qall
