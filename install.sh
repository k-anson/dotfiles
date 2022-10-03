#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

sudo apt-get update -y
sudo apt-get install -y stow

BREW=/home/linuxbrew/.linuxbrew/bin/brew
$BREW install neovim
$BREW install lazygit

nvim --headless +PlugInstall

stow --target=$HOME nvim tmux vim
