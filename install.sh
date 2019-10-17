#!/bin/bash -e

ln -s .dotfiles/tmux.conf $HOME/.tmux.conf
ln -s .dotfiles/tmuxp $HOME/.tmuxp
ln -s .dotfiles/zshrc $HOME/.zshrc
ln -s .dotfiles/zshenv $HOME/.zshenv
ln -s .dotfiles/gitconfig $HOME/.gitconfig
ln -s .dotfiles/gitignore_global $HOME/.gitignore_global

# create the empty file just to avoid errors
touch $HOME/.secretsenv
