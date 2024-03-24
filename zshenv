export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=$(which nvim)

# for GOLANG external modules
export GOPATH=$HOME/.gocode
export PATH="$GOPATH/bin:$PATH"

# rust/cargo
. "$HOME/.cargo/env"

export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# fnm
export PATH="$HOME/.local/share/fnm:$PATH"

# dracula theme for fzf
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'

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
