#!/bin/bash

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

function path_clean_2() {
    PATH=${PATH/#":"/}     # delete leading colon
    PATH=${PATH/%":"/}     # delete trailing colon
}

function path_remove() {
    # if the pattern is repeated the find / replace has to be run multiple times
    # .e.g PATH=/bin:$1:$1:$1:/usr/bin will run three time
    while [[ "$PATH" = *":$1:"* ]]; do
        PATH=${PATH//":$1:"/":"} # search middle of string // = replace all occurances
        let COUNTER=COUNTER+1
    done
    PATH=${PATH/#"$1:"/}     # delete from the start of string
    PATH=${PATH/%":$1"/}     # delete from the end of string
}
