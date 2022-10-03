#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

sudo apt-get update -y
sudo apt-get install -y stow fzf

BREW=/home/linuxbrew/.linuxbrew/bin/brew
$BREW install neovim
$BREW install lazygit

/home/linuxbrew/.linuxbrew/bin/nvim --headless +PlugInstall

stow --target=$HOME nvim tmux vim
