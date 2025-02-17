# This file is ~/.bashrc

# From `Difference between .bashrc and .bash_profile`__:
#
# ~/.bashrc is the place to put stuff that applies only to bash itself, such as
# alias and function definitions, shell options, and prompt settings. (You
# could also put key bindings there, but for bash they normally go into
# ~/.inputrc.)
#
# .. _`Difference between .bashrc and .bash_profile`: http://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile/183980

# bash configuration directory
BASH_SCRIPTS_DIR=$HOME/.config/bash

# disable software flow control (ctrl-S/ctrl-Q)
stty -ixon

export EDITOR=nvim

# Bash Completion. We assume bash-4.1 or newer (macOS defaults to bash-3.2),
# which can be installed via brew as follows:
# ```
# brew install bash
# brew install bash_completion@2
# ```
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

source $BASH_SCRIPTS_DIR/jump/jump.sh
source $BASH_SCRIPTS_DIR/utils.sh
source $BASH_SCRIPTS_DIR/git.sh
source $BASH_SCRIPTS_DIR/bash_prompt.sh

source $BASH_SCRIPTS_DIR/add_alias.sh
add_alias c "clear"
add_alias grep "grep --color=auto"
add_alias icp "cp -i"
add_alias imv "mv -i"
add_alias l  "eza"
add_alias la "eza --long --header --git --all"
add_alias lg "lazygit"
add_alias ll "eza --long --header --git"
add_alias ls "ls --color=auto" "ls -G"
add_alias lt "eza --long --sort newest"
add_alias lv "ls --color=auto -v" 'lsort(){ ls -G "$@" | sort -V ;  unset -f lsort; }; lsort'
add_alias m "make"
add_alias mu "mupdf" "mupdf"
add_alias nv "nvim"
add_alias o "/usr/bin/gio open" "open"
add_alias s "sage"
add_alias skim "open -a /Applications/Skim.app"
add_alias t "tmux"
add_alias xournalpp "open -a /Applications/Xournal++.app"

# combine cd and (eza or ls) into one command;
# NOTE: use `builtin cd` to access the builtin command
function cd {
    builtin cd "$@" && command eza 2>/dev/null || ls
}
