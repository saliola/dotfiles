#!/bin/bash

# echo commands before execution (useful for tracing)
set -x

# exit script at first error
set -e


echo "Installing apps via apt..."

sudo apt install stow
sudo apt install tmux
sudo apt install bash-completion eza htop ncdu

sudo apt install gh git-lfs hub

sudo snap install nvim --classic
sudo apt install nodejs npm
sudo apt install fd-find fzf ripgrep tree
sudo apt remove tree-sitter-cli
npm install -g tree-sitter-cli

echo "Using stow to symlink configs..."

# tmux
stow -v -t ~ tmux
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh

# bash
mv ~/.bashrc{,.orig}
mv ~/.profile{,.orig}
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
