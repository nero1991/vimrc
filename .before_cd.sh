#!/bin/bash

red=31
green=32
yellow=33

function echocolor() {
    echo -e "\033["$1"m"$2"\033[0m"
}

project_root=$HOME/Documents

goproject_dirs=(
)


function echogolang() {
    echocolor $red "[golang] <`go version`> work at $GOPATH"
}

function prepare_go() {
    currentDir=`pwd`
    for dir in ${goproject_dirs[@]}
    do
        if [ $dir = $currentDir ]; then
            export GOPATH=`pwd`
            echogolang
            return
        fi

        #if [[ $currentDir == $dir* ]];then
        #    return
        #fi
    done

    if [ $GOPATH != $DEFAULTGOPATH ]; then
        export GOPATH=$DEFAULTGOPATH
        echogolang
    fi
}

prepare_go
