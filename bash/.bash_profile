# This file is ~/.bash_profile

# From `Difference between .bashrc and .bash_profile`__:
#
# ~/.bash_profile can be used instead of ~/.profile, but you also need to include
# ~/.bashrc if the shell is interactive. I recommend the following contents.
#
# .. _`Difference between .bashrc and .bash_profile`: http://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile/183980

if [ -r ~/.profile ]; then
    source ~/.profile;
fi

case "$-" in
    *i*)
        if [ -r ~/.bashrc ]; then
            source ~/.bashrc;
        fi;;
esac

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/opt/homebrew/opt/micromamba/bin/mamba';
export MAMBA_ROOT_PREFIX='/Users/saliola/mamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
