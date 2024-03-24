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

alias sniff="sudo ngrep -W byline -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"

alias tmux="tmux -u"
alias tm="tmux -u"
alias tma="tmux -u attach"

alias python="python3"

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
fi

# autojump
if [[ $(uname) == "Darwin" ]]; then
  . $(brew --prefix)/etc/profile.d/autojump.zsh
else
  . /usr/share/autojump/autojump.zsh
fi

# rbenv (TODO: do I still need this?)
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# for shell history with FZF
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# atuin (another history tool I'm currently trying out)
eval "$(atuin init zsh)"

# fnm (node version manager)
eval "$(fnm env)"
