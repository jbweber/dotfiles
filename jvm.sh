#!/bin/bash

source $HOME/.dotfiles/functions.sh

# Go variables
GOLANG_VERSION=1.7.5
export GOLANG_VERSION

GOLANG_BASE=${HOME}/go
export GOROOT=${GOLANG_BASE}/go${GOLANG_VERSION}
export GOPATH=${GOLANG_BASE}/gopath

[[ ! -d $GOPATH/bin ]] && {
    mkdir -p $GOPATH/bin
}

path_prepend $GOROOT/bin
path_prepend $GOPATH/bin
