# this should come after platform-specfic configurations since that sets $PS1_HOSTNAME
# Reference: https://superuser.com/a/517110

HOSTNAME=$(hostname -s)
if [[ $HOSTNAME == *Mac-Pro ]]; then
    PS1_HOSTNAME="\001\033[46m\002\001\033[30m\002\h"
elif [[ $HOSTNAME == *MacBook-Pro ]]; then
    PS1_HOSTNAME="\001\033[100m\002\001\033[97m\002\h"
elif [[ -z "${PS1_HOSTNAME}" ]]; then
    PS1_HOSTNAME=$(hostname -s);
fi;

function prompt_left() {
    DIR=$(pwd|sed -e "s!$HOME!~!")
    if [ ${#DIR} -gt $(($(tput cols)-40)) ];
    then
        CurDir=${DIR:0:15}...${DIR:${#DIR}-32};
    else
        CurDir=$DIR;
    fi;
    echo -e "${PS1_HOSTNAME}\001\033[00m\002\001\033[33m\002:${CurDir}\001\033[00m\002"
}

function prompt_right() {
    echo -e "\001\033[90m\002[\D{%Y-%m-%d}][\A]\001\033[00m\002"
}

function prompt() {
    compensate=12
    PS1=$(printf "\n%*s\r%s\n» " "$(($(tput cols)+${compensate}))" "$(prompt_right)" "$(prompt_left)")
}
PROMPT_COMMAND=prompt
