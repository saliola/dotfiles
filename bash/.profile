# This file is ~/.profile

# From `Difference between .bashrc and .bash_profile`__:
#
# This is the place to put stuff that applies to your whole session, such as
# programs that you want to start when you log in (but not graphical programs,
# they go into a different file), and environment variable definitions.
#
# .. _`Difference between .bashrc and .bash_profile`: http://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile/183980

# add homebrew to the PATH and set homebrew environment variables
if [ -f "/usr/local/bin/brew" ]; then
    eval "$(/usr/local/bin/brew shellenv)"
elif [ -f "/opt/homebrew/bin/brew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# configure shell to automatically use chruby
source $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh
source $HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh

# Set the ruby version to the that which the `github-pages` gems expects
# This information can be found here: https://pages.github.com/versions.json
# To install it, use `ruby-install ruby 3.3.4`
chruby ruby-3.3.4

# add my bin directory to the PATH
export PATH=$HOME/Applications/bin:$PATH
