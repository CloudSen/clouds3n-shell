#!/bin/bash
# Author: CloudS3n

nginxFileName="nginx-1.15.0"
pcreFileName="pcre-8.38"
zlibFileName="zlib-1.2.11"
jdkFileName="openjdk-8u242-b08"
fileSuffix=".tar.gz"

function check_files() {
    echo "> checking files..." >> ./logs/log
    if [[ ! -f "./deploy/${nginxFileName}${fileSuffix}" ]]; then
        echo "[ ERR ] Nginx not found!"
        exit
    fi
    if [[ ! -f "./deploy/${pcreFileName}${fileSuffix}" ]]; then
        echo "[ ERR ] Pcre not found!"
        exit
    fi
    if [[ ! -f "./deploy/${zlibFileName}${fileSuffix}" ]]; then
        echo "[ ERR ] Zlib not found!"
        exit
    fi
    #if [[ ! -f "./deploy/${jdkFileName}${fileSuffix}" ]]; then
    #    echo "[ ERR ] OpenJDK not found!"
    #    exit
    #fi
}

function decompress() {
    check_files
    echo "> decompressing files..." >> ./logs/log
    tar zxf ./deploy/${nginxFileName}${fileSuffix} -C ./deploy/ &
    local tarNginxPid=$!
    tar zxf ./deploy/${pcreFileName}${fileSuffix} -C ./deploy/ &
    local tarPcrePid=$!
    tar zxf ./deploy/${zlibFileName}${fileSuffix} -C ./deploy/ &
    local tarZlibPid=$!
    mkdir -p /usr/local/java/
    #tar zxf ./deploy/${jdkFileName}${fileSuffix} -C /opt/java/ &
    #local tarJdkPid=$!
    wait $tarNginxPid
    wait $tarPcrePid
    wait $tarZlibPid
    #wait $tarJdkPid
}

function clear_cache() {
    echo "> Clear cache..." >> ./logs/log
    rm -rf ./deploy/${nginxFileName}
    rm -rf ./deploy/${pcreFileName}
    rm -rf ./deploy/${zlibFileName}
}