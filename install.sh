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
sudo apt install ./nvim-linux64.deb
#sudo ln -s ./nvim-linux64/bin/nvim /usr/local/bin

# Install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

#stow --target=$HOME nvim tmux vim
mkdir -p ~/.config
ln -s $(pwd)/nvim ~/.config/
ln -s $(pwd)/tmux/.tmux.conf ~/.tmux.conf
ln -s $(pwd)/vim/init.vim ~/init.vim

nvim --headless +PlugInstall +qall
