#!/bin/bash

set -x

GOLANG_VERSION=1.10.3
GOLANG_DOWNLOAD_URL=https://storage.googleapis.com/golang/go${GOLANG_VERSION}.linux-amd64.tar.gz

[[ ! -d ${HOME}/.go${GOLANG_VERSION} ]] && {
    gotmp=$(mktemp -d)
    trap "rm -rf ${gotmp}" EXIT

    pushd ${gotmp}
        curl -O -L -J ${GOLANG_DOWNLOAD_URL}
        tar -C ${HOME} --transform=s/^go/.go${GOLANG_VERSION}/g -zxf go${GOLANG_VERSION}.linux-amd64.tar.gz

        ln -sf ${HOME}/.go${GOLANG_VERSION} ${HOME}/.go
    popd
}
