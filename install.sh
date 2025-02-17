#!/bin/bash

# echo commands before execution (useful for tracing)
set -x

# exit script at first error
set -e


echo "Installing apps via brew..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Add brew to the PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Update Homebrew recipes
brew update

# Install packages listed in brewfile
brew tap homebrew/bundle
brew bundle --file ./brewfile


echo "Using stow to symlink configs..."
# tmux
stow -v -t ~ tmux
git clone git@github.com:tmux-plugins/tpm.git ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh

stow -v -t ~ bash
stow -v -t ~ ghostty
stow -v -t ~ git
stow -v -t ~ inputrc
stow -v -t ~ karabiner
stow -v -t ~ kitty
stow -v -t ~ nvim
stow -v -t ~ rectangle


echo "Setting shell for $USER"
sudo chsh -s $HOMEBEW_PREFIX/bin/bash $USER
