# Define `g` as an alias for `git`;
# and configure it to default to `git status` if no command is specified.
function _my_git_cmd() {
    if [ $# -eq 0 ] ; then
        git status
    else
        git "$@"
    fi
}

alias g='_my_git_cmd'

# To configure bash completion for `g`, use `complete -p git` to see the
# completion rule used for `git` and copy/paste it replacing `git` by `g`.
source /usr/local/etc/bash_completion.d/git-completion.bash
complete -o bashdefault -o default -o nospace -F __git_wrap__git_main g
