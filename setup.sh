#!/bin/bash

mkdir -p ~/.dotfiles_backup
mv ~/.bash_profile ~/.bashrc ~/.gitconfig ~/.tmux.conf ~/.dotfiles_backup
ln -sf ~/.dotfiles/bash_profile ~/.bash_profile
ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
mkdir -p ~/.local/bin
