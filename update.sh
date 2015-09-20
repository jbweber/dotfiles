#!/bin/bash

git submodule update --init --recursive

pushd $HOME/.dotfiles/keychain
    rm -f keychain
    make
popd

