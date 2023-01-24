#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

sudo apt-get update -y
sudo apt-get install -y stow fzf

BREW=/home/linuxbrew/.linuxbrew/bin/brew
$BREW install neovim
$BREW install lazygit

stow --target=$HOME nvim tmux vim

# Line below causing some issues in Codespaces by keeping the "Installing Dotfiles" process open indefinitely
# /home/linuxbrew/.linuxbrew/bin/nvim --headless +PlugInstall
