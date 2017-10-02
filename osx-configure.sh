# remove native fullscreen for macvim
defaults write org.vim.MacVim MMNativeFullScreen 0

# make keyboard sane
defaults write NSGlobalDomain InitialKeyRepeat -int 12
defaults write NSGlobalDomain KeyRepeat -int 1

# disable Chrome two finger swipe
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool FALSE

# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
# Follow the keyboard focus while zoomed in
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# disable automatically rearrange spaces based on recent use
defaults write com.apple.dock mru-spaces -bool false

# enable key repeat in vscode
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
