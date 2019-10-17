# remove native fullscreen for macvim
defaults write org.vim.MacVim MMNativeFullScreen 0

# make keyboard sane
defaults write NSGlobalDomain InitialKeyRepeat -int 10
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

# Show the /Volumes folder
chflags nohidden /Volumes

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# disable automatically rearrange spaces based on recent use
defaults write com.apple.dock mru-spaces -bool false

# enable key repeat in vscode
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# Top left screen corner → Mission Control
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Desktop
defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Start screen saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0
