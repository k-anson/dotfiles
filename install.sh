#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/vimrc $HOME/.vimrc
ln -s $(pwd)/vim $HOME/.vim

vim -Es -u $HOME/.vimrc -c "PlugInstall | qa"
