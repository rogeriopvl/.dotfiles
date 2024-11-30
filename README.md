# .dotfiles

This is just a backup of some of my config files.

## Quick setup

In your home folder do:

    git clone https://github.com/rogeriopvl/.dotfiles

Then just `ln -s` everything you're interested into your home folder :)

## Scripts

There are some scripts in this repo that aim to automate some of the manual
work. Here's a list and description:

- `install.sh` installs initial dependencies (homebrew and oh-my-zsh) and
  creates all the symlinks.
- `osx-configure.sh` for MacOS, configures the OS with some sane (very biased) defaults.
- `setup-git-signing.zsh` to setup git commit signing with SSH keys.
