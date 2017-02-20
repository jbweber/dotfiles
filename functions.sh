#!/bin/bash

# parameter substitution
# ${var-default} ${var:-default} - use default value : will use even if var declared but null
# ${var=default} ${var:=default} - set default value : will set even if var declared but null
# ${var+alt} ${var:+alt}         - use alt value if var set, otherwise null string : use alt value even if var declared but null otherwise null string

manpath_append() {
    [[ -n "$1" ]] && \
    [[ -d "$1" ]] && \
    [[ ":$MANPATH:" != *":$1:"* ]] && \
    MANPATH="${MANPATH:+"$MANPATH:"}$1"
}

### this is buggy
manpath_clean() {
    MANPATH=$(echo $MANPATH | /bin/sed -e "s/\(.*\):$/\1/" -e "s/:[:.]*/:/g")
}

path_append() {
    [[ -n "$1" ]] && \
    [[ -d "$1" ]] && \
    [[ ":$PATH:" != *":$1:"* ]] && \
    PATH="${PATH:+"$PATH:"}$1"
}

### this is buggy
path_clean() {
    PATH=$(echo $PATH | /bin/sed -e "s/\(.*\):$/\1/" -e "s/^:\(.*\)$/\1/" -e "s/:[:.]*/:/g")
}

path_prepend() {
    [[ -n "$1" ]] && \
    [[ -d "$1" ]] && \
    [[ ":$PATH:$" != *":$1:"* ]] && \
    PATH="$1${PATH:+":$PATH"}"
}
