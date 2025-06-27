ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git tmux)

source $ZSH/oh-my-zsh.sh

# disable auto-correction
unsetopt correct_all

# to avoid tmux losing its window names
DISABLE_AUTO_TITLE=true

# ALIAS

if [[ $(uname) == "Darwin" ]]; then
  alias vlc=/Applications/VLC.app/Contents/MacOS/VLC
  alias battery="pmset -g batt | egrep \"([0-9]+\%).*\" -o --colour=auto | cut -f1 -d';'"
  alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
  alias restart-audio="sudo launchctl stop com.apple.audio.coreaudiod && sudo launchctl start com.apple.audio.coreaudiod"
  alias temps="tempmonitor -ds -c -a -l"
fi

alias tm="tmux -u"
alias tma="tmux -u attach"

alias python="python3"

alias gs="git branch --sort=-committerdate | fzf --preview 'git log -p main..{-1} --color=always {-1}' | cut -c 3- | xargs git switch"

# FUNCTIONS

if [[ $(uname) == "Darwin" ]]; then
  # show and hide the desktop icons (for presentations)
  function hide_desktop {
    defaults write com.apple.finder CreateDesktop -bool false
    killall Finder
  }

  function show_desktop {
    defaults write com.apple.finder CreateDesktop -bool true
    killall Finder
  }

  # show and hide the hidden files
  function show_hidden_files {
    defaults write com.apple.finder AppleShowAllFiles TRUE
    killall Finder
  }

  function hide_hidden_files {
    defaults write com.apple.finder AppleShowAllFiles FALSE
    killall Finder
  }

  function wifi_name {
    /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'
  }

  function wifi_pass() {
    security find-generic-password -D "AirPort network password" -a $(wifi_name) -gw
  }

  function rtmp_open() {
      rtmpdump -r $1 --quiet | /Applications/VLC.app/Contents/MacOS/VLC fd://0 --playlist-autostart
  }

  function toggle_mic() {
    if [[ $(osascript -e "input volume of (get volume settings)") -eq 0 ]]; then
      osascript -e "set volume input volume 100"
      osascript -e "display notification \"You are now unmuted\" with title \"🎤 on\" sound name \"Funk\""
    else
      osascript -e "set volume input volume 0"
      osascript -e "display notification \"You are now muted\" with title \"🎤 off\" sound name \"Funk\""
    fi
  }
fi

# autojump
if [[ $(uname) == "Darwin" ]]; then
  . $(brew --prefix)/etc/profile.d/autojump.sh
else
  . /usr/share/autojump/autojump.zsh
fi

# for shell history with FZF
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# atuin (another history tool I'm currently trying out)
eval "$(atuin init zsh)"

# mise (manages programming languages versions)
if [[ $(uname) == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/mise activate zsh)"
else
  eval "$(/home/linuxbrew/.linuxbrew/bin/mise activate zsh)"
fi

