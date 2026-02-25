#!/bin/bash -e

if [ ! -d "$HOME/.dotfiles/.git" ]; then
  echo "❌ .dotfiles repo is not installed in the $HOME directory"
  echo "exiting..."
fi

# create the empty file just to avoid errors
touch $HOME/.secretsenv

echo "⏳installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "✅ homebrew"

echo "⏳installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "✅ oh-my-zsh"

echo "⏳creating dotfiles symlinks..."
ln -s $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/zshenv $HOME/.zshenv
ln -s $HOME/.dotfiles/gitconfig $HOME/.gitconfig
ln -s $HOME/.dotfiles/gitignore_global $HOME/.gitignore_global

# create ~/.config if it doesn't exist
if [ ! -d "$HOME/.config" ]; then
  echo "⚠️ directory $HOME/.config does not exist. Creating it..."
  mkdir "$HOME/.config"
fi

ln -s $HOME/.dotfiles/alacritty $HOME/.config/alacritty
ln -s $HOME/.dotfiles/ghostty $HOME/.config/ghostty
ln -s $HOME/.dotfiles/nvim $HOME/.config/nvim
ln -s $HOME/.dotfiles/aerospace $HOME/.config/aerospace
# ln -s $HOME/.dotfiles/yabai $HOME/.config/yabai
# ln -s $HOME/.dotfiles/skhd $HOME/.config/skhd
echo "✅ dotfiles"

echo "⏳installing brewfile packages..."
brew bundle --file="$HOME/.dotfiles/Brewfile" install
echo "✅ brewfile packages"
