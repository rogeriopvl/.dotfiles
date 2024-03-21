#!/bin/bash -e

# create the empty file just to avoid errors
touch $HOME/.secretsenv

echo "⏳installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "✅ homebrew"

echo "⏳installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "✅ oh-my-zsh"

echo "⏳creating dotfiles symlinks..."
ln -s .dotfiles/tmux.conf $HOME/.tmux.conf
ln -s .dotfiles/zshrc $HOME/.zshrc
ln -s .dotfiles/zshenv $HOME/.zshenv
ln -s .dotfiles/gitconfig $HOME/.gitconfig
ln -s .dotfiles/gitignore_global $HOME/.gitignore_global

# create ~/.config if it doesn't exist
if [ ! -d "$HOME/.config" ]; then
	echo "⚠️ directory $HOME/.config does not exist. Creating it..."
	mkdir "$HOME/.config"
fi

ln -s .dotfiles/alacritty $HOME/.config/alacritty
ln -s .dotfiles/nvim $HOME/.config/nvim
ln -s .dotfiles/yabai $HOME/.config/yabai
ln -s .dotfiles/skhd $HOME/.config/skhd
echo "✅ dotfiles"

echo "⏳installing brewfile packages..."
brew bundle --file="$HOME/.dotfiles/Brewfile" install
echo "✅ brewfile packages"
