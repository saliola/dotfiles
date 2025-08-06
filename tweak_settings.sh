#!/bin/bash

# echo commands before execution (useful for tracing)
set -x

# exit script at first error
set -e


# set CAPSLOCK to CTRL
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
