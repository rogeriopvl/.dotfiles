#!/bin/bash -e

ln -s .dotfiles/tmux.conf $HOME/.tmux.conf
ln -s .dotfiles/zshrc $HOME/.zshrc
ln -s .dotfiles/zshenv $HOME/.zshenv
ln -s .dotfiles/gitconfig $HOME/.gitconfig
ln -s .dotfiles/gitignore_global $HOME/.gitignore_global

# remove native fullscreen for macvim
defaults write org.vim.MacVim MMNativeFullScreen 0

# make keyboard sane
defaults write NSGlobalDomain InitialKeyRepeat -int 12
defaults write NSGlobalDomain KeyRepeat -int 1
