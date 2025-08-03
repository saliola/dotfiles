#!/bin/bash

# echo commands before execution (useful for tracing)
set -x

# exit script at first error
set -e


echo "Installing apps via apt..."

sudo apt install stow
sudo apt install tmux
sudo apt install npm
sudo apt install tree-sitter-cli

sudo snap install neovim --classic
sudo snap install hub --classic


echo "Using stow to symlink configs..."

# tmux
stow -v -t ~ tmux
git clone git@github.com:tmux-plugins/tpm.git ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh

# bash
rm ~/.bashrc ~/.profile
stow -v -t ~ bash

# others
stow -v -t ~ ghostty
stow -v -t ~ git
stow -v -t ~ inputrc
stow -v -t ~ kitty
stow -v -t ~ nvim


echo "Tweaking some settings"
sh tweak_settings.sh


echo "Creating some symlinks in home directory"
cd ~
ln -s ~/Downloads dl
ln -s ~/ownCloud oc
