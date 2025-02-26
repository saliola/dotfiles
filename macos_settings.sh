#!/usr/bin/env bash

# References:
# https://github.com/driesvints/dotfiles/blob/main/.macos
# https://ryanmo.co/2017/01/05/setting-keyboard-shortcuts-from-terminal-in-macos/

# Close any open System Preferences panes,
# to prevent them from overriding settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Dock
defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide -bool true

# Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Skim.app
defaults write -app skim SKLeftSidePaneWidth '0'
defaults write -app skim SKRightSidePaneWidth '0'
defaults write -app skim SUAutomaticallyUpdate '1'
defaults write -app skim SUEnableAutomaticChecks '1'
defaults write -app Skim SKAutoCheckFileUpdate '1'
defaults write -app Skim SKAutoReloadFileUpdate '1'
defaults write -app Skim SKTeXEditorPreset ''
defaults write -app Skim SKTeXEditorCommand 'nvim'
defaults write -app Skim SKTeXEditorArguments '"--headless -c \"VimtexInverseSearch %line '%file'\""'

# Microsoft Outlook
defaults write com.microsoft.Outlook NSUserKeyEquivalents -dict-add "Toggle Unread" "^t"

# Wallpaper
osascript -e 'tell application "System Events" to set picture of every desktop to "~/.dotfiles/wallpapers/tunic.jpg"'

# Kill affected applications so that changes can take effect
for app in "Dock" \
    "Finder" \
    "Skim"; do
    killall "${app}"
done
