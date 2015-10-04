# remove native fullscreen for macvim
defaults write org.vim.MacVim MMNativeFullScreen 0

# make keyboard sane
defaults write NSGlobalDomain InitialKeyRepeat -int 12
defaults write NSGlobalDomain KeyRepeat -int 1

# disable Chrome two finger swipe
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool FALSE
