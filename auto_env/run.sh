#!/bin/bash
# Author: CloudS3n

source ./src/file_util.sh
source ./src/install.sh

function init() {
    echo "" > ./logs/log
    tail -f ./logs/log &
    chmod +x ./src/*.sh
}

function run() {
    init
    echo "> Starting install env..." >> ./logs/log
    decompress
    install_all
    clear_cache
}

clear
run