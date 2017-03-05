# global variables; overriden by local variables;

if [[ -f "$HOME/.dotfiles/locals.sh" ]]; then
    source $HOME/.dotfiles/locals.sh
fi

# HTTP proxy variables
: ${http_proxy:=""}
: ${https_proxy:=""}
: ${no_proxy:=""}
HTTP_PROXY=${http_proxy}
HTTPS_PROXY=${https_proxy}
NO_PROXY=${no_proxy}
export http_proxy https_proxy no_proxy HTTP_PROXY HTTPS_PROXY NO_PROXY
