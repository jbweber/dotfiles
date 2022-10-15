# don't do anything on a non-interactive shell
case "$-" in
    *i*) ;;
    *) return ;;
esac

if [[ -r /etc/bashrc ]]; then
    . /etc/bashrc
elif [[ -r /etc/bash.bashrc ]]; then
    . /etc/bash.bashrc
fi

umask 022

. $HOME/.dotfiles/functions.sh

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

[[ -x /usr/bin/dircolors ]] && {
    test -r "$HOME/.dircolors" && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"

    # color aliases
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
}

# set the directory color to a better blue
#export LS_COLORS=$(echo $LS_COLORS | sed "s/di=\(..\);../di=\1;94/")

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

# enable bash completion
#if ! shopt -oq posix; then
#    if [[ -f /usr/share/bash-completion/bash_completion ]]; then
#        . /usr/share/bash-completion/bash_completion
#    elif [[ -f /etc/bash_completion ]]; then
#        . /etc/bash_completion
#    fi
#fi

# add binaries from .local
#[[ -d ${HOME}/.local/bin ]] && {
#    path_prepend ${HOME}/.local/bin
#}

# load golang configuration if installed
#[[ -d ${HOME}/.go/bin ]] && {
#    export GOROOT=${HOME}/.go
#    export GOPATH=${HOME}/go
#
#    mkdir -p ${GOPATH}/bin
#
#    path_prepend ${GOPATH}/bin
#    path_prepend ${GOROOT}/bin
#}

# setup ssh agent
#SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}/ssh-agent.sock
#SSH_AUTH_SOCK_DIR=$(dirname ${SSH_AUTH_SOCK})

#[[ -d ${SSH_AUTH_SOCK_DIR} ]] || mkdir -m0700 -p ${SSH_AUTH_SOCK_DIR}
#[[ -S ${SSH_AUTH_SOCK} ]] || eval $(ssh-agent -a "${SSH_AUTH_SOCK}" -t 4h)

#NUM_AGENTS=$(ps --user ${USER} -ef | grep '[s]sh-agent' | wc -l)
#echo "~~~~"
#echo "there are ${NUM_AGENTS} ssh-agent processes running for ${USER}"
#echo "~~~~"

#export SSH_AUTH_SOCK

# load cargo
#if [[ -d "$HOME/.cargo/bin" ]]; then
#    path_prepend "$HOME/.cargo/bin"
#fi

# load nix
#if [[ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]]; then
#    . "$HOME/.nix-profile/etc/profile.d/nix.sh"
#fi

:
