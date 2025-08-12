# This file is ~/.profile

# From `Difference between .bashrc and .bash_profile`__:
#
# This is the place to put stuff that applies to your whole session, such as
# programs that you want to start when you log in (but not graphical programs,
# they go into a different file), and environment variable definitions.
#
# .. _`Difference between .bashrc and .bash_profile`: http://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile/183980

# # configure shell to automatically use chruby
# source $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh
# source $HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh
#
# # Set the ruby version to the lastest stable version supported by Jekyll
# # https://jekyllrb.com/docs/installation/macos/#step-2-install-chruby-and-the-latest-ruby-with-ruby-install
# # To install it `ruby-install ruby 3.4.1`
# chruby ruby-3.4.1

# add my bin directory to the PATH
export PATH=$HOME/Applications/bin:$PATH
