case "$-" in
    *i*) INTERACTIVE=yes ;;
    *)   unset INTERACTIVE ;;
esac

case "$0" in
    -*) LOGIN=yes ;;
    *)  unset LOGIN ;;
esac

[[ -r /etc/bashrc && -f /etc/bashrc ]] && source /etc/bashrc

[[ -e "/usr/share/terminfo/x/xterm-256color" ]] &&
    TERM=xterm-256color ||
    TERM=xterm-color
export TERM

umask 022

# VAR=${OTHER:-default] var = other or default if not set
# VAR=${OTHER:=default] var = other or default if not set, also set other
: ${LANG:="en_US.UTF-8"}
: ${LANGUAGE:="en"}
: ${LC_ALL:="en_US.UTF-8"}
: ${LC_CTYPE:="en_US.UTF-8"}
export LANG LANGUAGE LC_ALL LC_CTYPE

HISTCONTROL=erasedups
HISTFILESIZE=100000
HISTSIZE=100000
HISTIGNORE='[ \t]*:exit:^&'
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

#
BLUE="\[\033[0;34m\]"
BBLUE="\[\033[1;34m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
PURPLE="\[\033[0;35m\]"
PURPLE_BOLD="\[\033[1;35m\]"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
WHITE="\[\033[0;37m\]"
NONE="\[\033[0m\]"
PS1="\n${WHITE}[\${?}] ${PURPLE_BOLD}\u${WHITE}@${PURPLE_BOLD}\h${WHITE}:${CYAN}\w\n${WHITE}\$ ${NONE}"
PS2="--> "

export PS1 PS2

# set the directory color to a better blue
export LS_COLORS=$(echo $LS_COLORS | sed "s/di=\(..\);../di=\1;94/")

# load keychain into scope
if [[ -x $HOME/.dotfiles/keychain/keychain ]]; then
    eval $($HOME/.dotfiles/keychain/keychain --eval --agents ssh id_rsa)
fi

if [[ -d $HOME/.bin ]]; then
    export PATH=$HOME/.bin:$PATH
fi
