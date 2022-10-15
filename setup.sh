#!/bin/bash

ln -snf ~/.dotfiles/bash_profile ~/.bash_profile
ln -snf ~/.dotfiles/bashrc ~/.bashrc
ln -snf ~/.dotfiles/gitconfig ~/.gitconfig
ln -snf ~/.dotfiles/inputrc ~/.inputrc
ln -snf ~/.dotfiles/tmux.conf ~/.tmux.conf

mkdir -p ~/.config/systemd/user
cp ssh-agent.service ~/.config/systemd/user
systemctl --user enable --now ssh-agent

#mkdir -p ~/.local/bin
