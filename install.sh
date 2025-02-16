#!/bin/bash

# echo commands before execution (useful for tracing)
set -x

# exit script at first error
set -e

# tmux
stow -v -t ~ tmux
git clone git@github.com:tmux-plugins/tpm.git ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh
