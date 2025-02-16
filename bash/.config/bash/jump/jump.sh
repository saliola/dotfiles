# Bash bookmarks
#
# Adapted from:
#    http://stackoverflow.com/questions/7374534/directory-bookmarking-for-bash
#    http://ivan.fomentgroup.org/blog/2010/01/29/zsh-bookmarks-for-cd-change-directory-with-completion/
#
# Bookmarks are stored in a file (see $JUMP_LIST).
# Each line of the file corresponds to a bookmark, the syntax is:
#
#   bookmark -> target
#
# To make things more portable, it is better to use ~ of $HOME instead of
# /home/username. This script substitutes ~ for $HOME when creating bookmarks.

cecho() {
    tput setaf 2
    echo "$1"
    tput sgr0
}

function jj() {
    builtin cd $HOME
}

function LS() {
    if [ -x "$(command -v exa)" ]; then
        command exa
    else
        command ls
    fi;
}

function j() {
    USAGE="Usage: $FUNCNAME [add|cd|delete|del|edit|help|list|ls] [bookmark]" ;

    JUMP_LIST=~/.config/bash/jump/jump_list.txt

    if  [ ! -e $JUMP_LIST ] ; then
        touch $JUMP_LIST
    fi

    case $1 in

        add) shift
            if [ -z "$1" ] ; then
                BOOKMARK=$(basename $PWD)
            else
                BOOKMARK="$1"
            fi
            TEST_BOOKMARK=$(grep -e "^$BOOKMARK[[:space:]]->" $JUMP_LIST)
            if [ -z "$TEST_BOOKMARK" ] ; then
                TARGET=${PWD/$HOME/\$HOME}
                cecho "$FUNCNAME: add bookmark: $BOOKMARK -> $TARGET"
                echo "$BOOKMARK -> \"$TARGET\"" >> $JUMP_LIST
            else
                cecho "$FUNCNAME: Bookmark already exists: $BOOKMARK" ;
            fi
            ;;

        cd) shift
            BOOKMARK=$(grep -e "^$1[[:space:]]->" $JUMP_LIST)
            if [ -z "$BOOKMARK" ] ; then
                if [ -d "$1" ]; then
                    BOOKMARK="$1"
                else
                    cecho "$FUNCNAME: Bookmark does not exist: $1" ;
                    return 1 ;
                fi
            fi
            NEWDIR=$(echo $BOOKMARK | sed 's/^.*-> //')
            eval "builtin cd $NEWDIR"
            ;;

        cd_subdir) shift
            eval "builtin cd \"$@\""
            ;;

        delete) shift
            BOOKMARK=$(grep -e "^$1[[:space:]->" $JUMP_LIST)
            if [ -z "$BOOKMARK" ] ; then
                cecho "$FUNCNAME: No such bookmark: $1" ;
            else
                sed -i.bak "/^$1 ->/d" $JUMP_LIST
                cecho "$FUNCNAME: delete bookmark: $BOOKMARK"
            fi
            ;;

        del) shift
            $FUNCNAME delete $1 ;
            ;;

        edit) shift
            $EDITOR $JUMP_LIST
            ;;

        jumplist) shift
            echo $JUMP_LIST ;
            ;;

        help) echo "$USAGE" ;
            ;;

        list) shift
            cat $JUMP_LIST
            ;;

        ls)
            $FUNCNAME list ;
            ;;

        # otherwise:
        # - list bookmarks, if no arguments
        # - cd to bookmark, if one argument
        # - cd to subdirectory
        *)
            if [ -z "$1" ] ; then
                $FUNCNAME list ;
            elif [ -z "$2" ] ; then
                $FUNCNAME cd $1 || return 1;
                cecho $PWD ;
                LS ;
            else
                j cd $1
                shift
                $FUNCNAME cd_subdir "$@" ;
                cecho $PWD ;
                LS ;
            fi;

    esac
}

_j()
{
    local cur pre

    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    pre=${COMP_WORDS[COMP_CWORD-1]}

    if [ $COMP_CWORD -eq 1 ]; then
        BOOKMARKS=$(grep -E '^[[:alnum:]]' $(j jumplist) | sed 's/ ->.*$//')
        COMPREPLY=( $(compgen -W "$BOOKMARKS" -- $cur) )
        if [ -z "$COMPREPLY" ]; then
            _filedir -d
        fi;
    elif [ $COMP_CWORD -eq 2 ]; then
        BOOKMARK=$(grep -e "^$pre ->" $(j jumplist))
        if [ -z "$BOOKMARK" ] ; then
            COMPREPLY=()
        else
            TARGET_DIR=$(echo $BOOKMARK | sed 's/^.*-> //')
            eval "builtin cd $TARGET_DIR"
            _filedir -d
        fi
    else
        COMPREPLY=()
    fi

    return 0
}

complete -F _j -o bashdefault j
