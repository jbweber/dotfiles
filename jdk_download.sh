#!/bin/bash

JDK_DOWNLOAD_URL="http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.tar.gz"

JDK_BASE=${HOME}/jdk

[[ ! -d $JDK_BASE ]] && {
    jdktmp=$(mktemp -d)
    pushd $jdktmp
        curl -O -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" $JDK_DOWNLOAD_URL
        gzip -cd jdk-8u112-linux-x64.tar.gz | tar xf -

        mkdir -p $JDK_BASE
        mv ./jdk1.8.0_112 $JDK_BASE
    popd

    [[ -d $jdktmp ]] && {
        rm -rf $jdktmp
    }
}
