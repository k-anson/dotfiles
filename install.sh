#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

# Update system and install base packages
sudo apt-get update -y
sudo apt-get install -y fzf

# Install neovim
curl -LO "https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb"
sudo apt install ./nvim-linux64.deb

# Install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

mkdir -p ~/.config
ln -s $(pwd)/nvim ~/.config/
ln -s $(pwd)/tmux/.tmux.conf ~/.tmux.conf
ln -s $(pwd)/vim/.vimrc ~/.vimrc

nvim --headless +PlugInstall +qall
