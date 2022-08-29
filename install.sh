#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

brew install nvim lazygit

nvim --headless +PlugInstall

ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/vimrc $HOME/.vimrc
ln -s $(pwd)/vim $HOME/.vim
ln -s $(pwd)/nvim/init.vim $HOME/.config/nvim/init.vim

vim -Es -u $HOME/.vimrc -c "PlugInstall | qa"
