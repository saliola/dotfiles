# This file is ~/.profile

# From `Difference between .bashrc and .bash_profile`__:
#
# This is the place to put stuff that applies to your whole session, such as
# programs that you want to start when you log in (but not graphical programs,
# they go into a different file), and environment variable definitions.
#
# .. _`Difference between .bashrc and .bash_profile`: http://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile/183980

# add homebrew to the PATH and set homebrew environment variables
eval "$(/opt/homebrew/bin/brew shellenv)"

# configure shell to automatically use chruby
source $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh
source $HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3

# add my bin directory to the PATH
export PATH=$HOME/Applications/bin:$PATH
