#!/bin/bash

source $HOME/.dotfiles/functions.bash

export GOROOT=$HOME/go
path_append $GOROOT/bin

[[ ! -d $GOROOT ]] && {
    gotmp=$(mktemp -d)
    pushd $gotmp
        curl -O -L -J https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
        gzip -cd go1.6.linux-amd64.tar.gz | tar xf -
        mv ./go $HOME
    popd

    [[ -d $gotmp ]] && {
        rm -rf $gotmp
    }
}

BASE_GOPATH=$HOME/gopath

[[ ! -d $BASE_GOPATH ]] && {
    [[ -z $GOPATH ]] && {
        export GOPATH=$BASE_GOPATH
        mkdir -p $GOPATH
    }
}
