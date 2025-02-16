#######################################################################
#              function to add platform-dependent alias               #
#######################################################################

function add_alias() {
    # set a platform-dependent alias:
    #
    #   add_alias alias linux-command mac-command
    #
    # add_alias(h, 'hg') is equivalent to `alias h='hg'`
    if [ -z ${3+x} ]; then
        alias $1="$2";
    else
        UNAME=$(uname)
        if [[ $UNAME == 'Linux' ]]; then
            alias $1="$2"
        elif [[ $UNAME == 'Darwin' ]]; then
            alias $1="$3"
        fi
    fi;
}
