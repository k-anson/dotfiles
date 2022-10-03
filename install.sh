#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

sudo apt-get update -y
sudo apt-get install -y brew stow

echo 'DEBUGGING'
which brew
brew install neovim lazygit
nvim --headless +PlugInstall

stow --target=$HOME nvim vim tmux
