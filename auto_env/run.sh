#!/bin/bash
# Author: CloudS3n

source ./src/file_util.sh
source ./src/install.sh
source ./src/config_util.sh
source ./src/system_info.sh

ROOT_UID=0

function init() {
    echo "" > ./logs/log
    tail -f ./logs/log &
    chmod +x ./src/*.sh
    if [[ "$UID" -ne "$ROOT_UID"  ]]; then
        echo "[ ERR ] Must be root to run this script!"
        killall tail
        exit 87
    fi
    systemctl stop firewalld
    systemctl disable firewalld
}

function run() {
    init
    echo "> Starting intial env..." >> ./logs/log
    decompress
    install_all
    config_all
    clear_cache
    summary
    killall tail
    echo "[ DONE ] Spend time $SECONDS s" >> ./logs/log
    exit
}

clear
run