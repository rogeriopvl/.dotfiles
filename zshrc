# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow)

# to allow macvim to have a proper prompt
if [ ! $TERM = dumb ]; then
    source $ZSH/oh-my-zsh.sh
fi
unsetopt correct_all

# Customize to your needs...

# to avoid tmux losing its window names
DISABLE_AUTO_TITLE=true

# load tokens n stuff
source ~/.secretsenv

# ALIAS

## Programs

# needed because of ruby yaml and stuff
alias jekyll="LANG=en_US.UTF-8 jekyll"
alias vlc=/Applications/VLC.app/Contents/MacOS/VLC
alias dug="du -h . | grep '[0-9\.]\+G'"
alias tmux="tmux -u"
alias battery="pmset -g batt | egrep \"([0-9]+\%).*\" -o --colour=auto | cut -f1 -d';'"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
alias emulator="/Users/rogeriopvl/Library/Android/sdk/emulator/emulator -avd Nexus_5X_API_28_x86"
alias todo="todo.sh"
alias mux="tmuxinator"
alias restart-audio="sudo launchctl stop com.apple.audio.coreaudiod && sudo launchctl start com.apple.audio.coreaudiod"

## Utilities

alias temps="tempmonitor -ds -c -a -l"
alias sniff="sudo ngrep -W byline -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias remove_context_dups="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user"


alias python="python3"

# FUNCTIONS

precmd() {
    # sets the tab title to current dir
    echo -ne "\e]1;${PWD##*/}\a"
}

function rtmp_open() {
    rtmpdump -r $1 --quiet | /Applications/VLC.app/Contents/MacOS/VLC fd://0 --playlist-autostart
}
# count the lines of code from a given file extension in the current folder and recursively
function loc() {
    find . -name *.$1 | xargs wc -l
}

function checkout-pr() {
    git fetch origin refs/pull/$1/head:PR$1
}

# toggle bluetooth on/off
function bluetooth {
    osascript -e 'tell application "System Events" to tell process "SystemUIServer" to tell (menu bar item 1 of menu bar 1 whose description is "bluetooth") to {click, click (menu item 2 of menu 1)}'
}

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

# for autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=/opt/homebrew/bin/nvim

# for FZF
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

eval "$(atuin init zsh)"

# fnm
eval "$(fnm env)"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
