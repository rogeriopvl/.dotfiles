export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=$(which nvim)

export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# load tokens n stuff
source $HOME/.secretsenv

export TMUX_SESSIONIZER_DIRS=(
  "$HOME/src/projects"
  "$HOME/src/projects/learn"
  "$HOME/src/projects/httpcats"
  "$HOME/src/projects/hushcat"
  "$HOME/src/projects/studentfinance"
)
