export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=$(which nvim)

# for GOLANG external modules
export GOPATH=$HOME/.gocode
export PATH="$GOPATH/bin:$PATH"

# rust/cargo
. "$HOME/.cargo/env"

export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# Linux specific envs
if [[ $(uname) == "Linux" ]]; then
    # homebrew linux
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# load tokens n stuff
source $HOME/.secretsenv

export TMUX_SESSIONIZER_DIRS=(
  "$HOME/src/projects"
  "$HOME/src/projects/learn"
  "$HOME/src/projects/httpcats"
  "$HOME/src/projects/studentfinance"
)
