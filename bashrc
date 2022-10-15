# don't do anything on a non-interactive shell
case "$-" in
    *i*) ;;
    *) return ;;
esac

umask 0022

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

# check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}/ssh-agent.socket
[[ -S "${SSH_AUTH_SOCK}" ]] && {
    export SSH_AUTH_SOCK
}

:
