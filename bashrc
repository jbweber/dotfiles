# don't do anything on a non-interactive shell
case "$-" in
    *i*) ;;
    *) return ;;
esac

[[ -r /etc/bashrc && -f /etc/bashrc ]] && source /etc/bashrc

umask 022

source $HOME/.dotfiles/functions.sh

TERM=xterm-color
[[ -e "/usr/share/terminfo/s/screen-256color" ]] && TERM=screen-256color
[[ -e "/usr/share/terminfo/s/screen-256color-s" ]] && TERM=screen-256color-s
export TERM

# VAR=${OTHER:-default] var = other or default if not set
# VAR=${OTHER:=default] var = other or default if not set, also set other
# : noop operator
: ${LANG:="en_US.UTF-8"}
: ${LANGUAGE:="en"}
: ${LC_ALL:="en_US.UTF-8"}
: ${LC_CTYPE:="en_US.UTF-8"}
export LANG LANGUAGE LC_ALL LC_CTYPE

HISTCONTROL=ignoreboth
HISTFILESIZE=100000
HISTSIZE=100000
HISTIGNORE=" *:ls:cd:cd -:pwd:exit:date:history"
shopt -s histappend
export HISTCONTROL HISTFILESIZE HISTSIZE HISTIGNORE

HAVE_VIM=$(command -v vim)
[[ -n $HAVE_VIM ]] &&
    EDITOR=vim ||
    EDITOR=vi
export EDITOR

dircolors="$(type -P gdircolors dircolors | head -1)"
[[ -n $dircolors ]] && {
    COLORS=/etc/DIR_COLORS
    test -e "/etc/DIR_COLORS.$TERM" && COLORS="/etc/DIR_COLORS.$TERM"
    test -e "$HOME/.dircolors" && COLORS="$HOME/.dircolors"
    test ! -e "$COLORS" && COLORS=
    eval `$dircolors --sh $COLORS`
}
unset dircolors

# set the directory color to a better blue
export LS_COLORS=$(echo $LS_COLORS | sed "s/di=\(..\);../di=\1;94/")

# prompt
BLUE="\[\033[0;34m\]"
BBLUE="\[\033[1;34m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
PURPLE="\[\033[0;35m\]"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
WHITE="\[\033[0;37m\]"
NONE="\[\033[0m\]"
PS1="\n${WHITE}[\${?}]${YELLOW}\u${WHITE}@${RED}\h${WHITE}:\w\n\$ ${NONE}"
PS2="--> "
export PS1 PS2

# add binaries from our dotfiles
if [[ -d $HOME/.dotfiles/bin ]]; then
    path_prepend $HOME/.dotfiles/bin
fi

# add binaries from .local
[[ -d ${HOME}/.local/bin ]] && {
    path_prepend ${HOME}/.local/bin
}

# load golang configuration if installed
[[ -d ${HOME}/.go/bin ]] && {
    export GOROOT=${HOME}/.go
    path_prepend ${GOROOT}/bin
    path_prepend ${HOME}/go/bin
}

# setup ssh agent
SSH_AUTH_SOCK=/tmp/${USER}/ssh-agent.sock
SSH_AUTH_SOCK_DIR=$(dirname ${SSH_AUTH_SOCK})

mkdir -p ${HOME}/.ssh
chmod 700 ${HOME}/.ssh
grep -q -F "IdentityAgent ${SSH_AUTH_SOCK}" ${HOME}/.ssh/config || echo "IdentityAgent ${SSH_AUTH_SOCK}" >> ${HOME}/.ssh/config
grep -q -F "AddKeysToAgent yes" ${HOME}/.ssh/config || echo "AddKeysToAgent yes" >> ${HOME}/.ssh/config

[[ -d ${SSH_AUTH_SOCK_DIR} ]] || mkdir -m0700 ${SSH_AUTH_SOCK_DIR}
[[ -S ${SSH_AUTH_SOCK} ]] || eval $(ssh-agent -a "${SSH_AUTH_SOCK}" -t 8h)
export SSH_AUTH_SOCK

# default aliases
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias grep="grep --color=auto"
alias ls="ls --color=auto"

:
