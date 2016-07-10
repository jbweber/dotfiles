#!/bin/bash

source $HOME/.dotfiles/functions.bash

#
GOLANG_VERSION=1.6.2
GOLANG_DOWNLOAD_URL=https://storage.googleapis.com/golang/go${GOLANG_VERSION}.linux-amd64.tar.gz

GOLANG_BASE=${HOME}/go
export GOROOT=${GOLANG_BASE}/go${GOLANG_VERSION}
export GOPATH=${GOLANG_BASE}/gopath

[[ ! -d $GOROOT ]] && {
    gotmp=$(mktemp -d)
    pushd $gotmp
        curl -O -L -J $GOLANG_DOWNLOAD_URL
        gzip -cd go${GOLANG_VERSION}.linux-amd64.tar.gz | tar xf -

        mkdir -p $GOLANG_BASE
        mv ./go ${GOLANG_BASE}/go${GOLANG_VERSION}
    popd

    [[ -d $gotmp ]] && {
        rm -rf $gotmp
    }
}

[[ ! -d $GOPATH/bin ]] && {
    mkdir -p $GOPATH/bin
}

path_prepend $GOROOT/bin
path_prepend $GOPATH/bin
