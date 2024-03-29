# .dotfiles

This is just a backup of some of my config files.

## Quick setup

In your home folder do:

    git clone https://github.com/rogeriopvl/.dotfiles

Then just `ln -s` everything you're interested into your home folder :)

## Caveats

The `markdownlint.jsonc` file was added because of LazyVim's markdown extras.
This uses markdownlint to lint markdown files and at least two rules are not
suitable for code blocks (line-length and no-hard-tabs). The only way I found
to disable those rules was by creating this config file in my `$HOME` and force
the plugin to use it (check `nvim/lua/plugins/lint.lua`). I even documented this
approach on [this LazyVim repo discussion][1] in the hopes that someone will
challenge it with a cleaner solution.

[1]: https://github.com/LazyVim/LazyVim/discussions/2268
