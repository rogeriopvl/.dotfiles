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

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...

# to avoid tmux losing its window names
DISABLE_AUTO_TITLE=true

# env variables for cli tools
# source ~/.cli_env

# ALIAS

## Programs

# needed because of ruby yaml and stuff
alias jekyll="LANG=en_US.UTF-8 jekyll"
alias tmux="tmux -u"
alias calibreserver="sudo /Applications/calibre.app/Contents/MacOS/calibre-server -p 443"
alias vlc=/Applications/VLC.app/Contents/MacOS/VLC
alias ffoxdev="/Applications/Firefox.app/Contents/MacOS/firefox-bin -no-remote -P dev"

## Utilities

alias temps="tempmonitor -ds -c -a -l"
alias sniff="sudo ngrep -W byline -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias remove_context_dups="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user"


# FUNCTIONS

precmd() {
    # sets the tab title to current dir
    echo -ne "\e]1;${PWD##*/}\a"
}

# checks if VIM is running in the current tty background
function is_vim_bg {
    isbg=$(ps | grep `tty | sed -e 's|/dev/||g'` | grep -i vim | wc -l)

    if [ $isbg -gt 0 ] ; then
        echo "\e[0;31m❐ VIM\e[m "
    fi
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

# TODO!!!!!!!!!!!!!!!!!
# function websaver() {
#     if [ "$1" = "add" ]; then
#         ln -s "/Users/rogeriopvl/.websavers/"$2 "Users/rogeriopvl/Library/Screen Savers/Web.saver/Contents/Resources/"$2
#     fi
# }

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

function firefox_extdev {
	/Applications/Firefox.app/Contents/MacOS/firefox-bin -P extdev
}

# for autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export ANDROID_HOME=/usr/local/opt/android-sdk

export PROMPT="$(is_vim_bg)$PROMPT"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
