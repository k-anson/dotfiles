#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

# Update system and install base packages
sudo apt update -y
sudo apt install -y fzf tmux

# Install neovim
curl -LO "https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb"
sudo apt install ./nvim-linux64.deb
rm ./nvim-linux64.deb

# Install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm ./lazygit ./lazygit.tar.gz

# Symlink config files
mkdir -p ~/.config
ln -sf $(pwd)/nvim ~/.config/
ln -sf $(pwd)/tmux/.tmux.conf ~/.tmux.conf
ln -sf $(pwd)/vim/.vimrc ~/.vimrc

# Install nvim plugins
nvim --headless +PlugInstall +qall
