#!/bin/bash

set -xe

GOLANG_VERSION=$(curl -sSL "https://go.dev/VERSION?m=text")

GOLANG_DOWNLOAD_URL=https://storage.googleapis.com/golang/${GOLANG_VERSION}.linux-amd64.tar.gz

[[ ! -d ${HOME}/.${GOLANG_VERSION} ]] && {
    gotmp=$(mktemp -d)
    trap "rm -rf ${gotmp}" EXIT

    pushd ${gotmp}
        curl -O -L -J ${GOLANG_DOWNLOAD_URL}
        tar -C ${HOME} --transform=s/^go/.${GOLANG_VERSION}/g -zxf ${GOLANG_VERSION}.linux-amd64.tar.gz

        rm -f ${HOME}/.go
        ln -sf ${HOME}/.${GOLANG_VERSION} ${HOME}/.go
    popd
}
