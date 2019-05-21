#!/bin/bash
# Author: CloudS3n

source ./config.sh

function check_files() {
    echo "======================checker======================" >> ./logs/log
    echo "> checking files..." >> ./logs/log
    if [[ "${enableNginx}" == true ]] && [[ ! -f "./deploy/${nginxFileName}${gzSuffix}" ]]; then
        echo "[ ERR ] Nginx file not found!" >> ./logs/log
        killall tail
        exit
    fi
    if [[ "${enablePcre}" == true ]] && [[ ! -f "./deploy/${pcreFileName}${gzSuffix}" ]]; then
        echo "[ ERR ] Pcre file not found!" >> ./logs/log
        killall tail
        exit
    fi
    if [[ "${enableZlib}" == true ]] && [[ ! -f "./deploy/${zlibFileName}${gzSuffix}" ]]; then
        echo "[ ERR ] Zlib file not found!" >> ./logs/log
        killall tail
        exit
    fi
    if [[ "${enableJDK}" == true ]] && [[ ! -f "./deploy/${jdkFileName}${gzSuffix}" ]]; then
        echo "[ ERR ] OpenJDK file not found!" >> ./logs/log
        killall tail
        exit
    fi
}

function decompress() {
    check_files
    echo "==================decompressing==================" >> ./logs/log
    echo "> decompressing files..." >> ./logs/log
    if [[ "${enableNginx}" == true ]]; then
        tar zxf ./deploy/${nginxFileName}${gzSuffix} -C ./deploy/ &
        local tarNginxPid=$!
    fi
    if [[ "${enablePcre}" == true ]]; then
        tar zxf ./deploy/${pcreFileName}${gzSuffix} -C ./deploy/ &
        local tarPcrePid=$!
    fi
    if [[ "${enableZlib}" == true ]]; then
        tar zxf ./deploy/${zlibFileName}${gzSuffix} -C ./deploy/ &
        local tarZlibPid=$!
    fi
    if [[ "${enableJDK}" == true ]]; then
        if [[ -d /opt/java/ ]]; then
            rm -rf /opt/java/
        fi
        mkdir /opt/java/
        tar zxf ./deploy/${jdkFileName}${gzSuffix} -C /opt/java/ &
        local tarJdkPid=$!
    fi

    if [[ "${enableNginx}" == true ]]; then
        wait $tarNginxPid
    fi
    if [[ "${enablePcre}" == true ]]; then
        wait $tarPcrePid
    fi
    if [[ "${enableZlib}" == true ]]; then
        wait $tarZlibPid
    fi
    if [[ "${enableJDK}" == true ]]; then
        wait $tarJdkPid
    fi
}

function clear_cache() {
    echo "==================clear==================" >> ./logs/log
    echo "> Clear cache..." >> ./logs/log
    rm -rf ./deploy/${nginxFileName}
    rm -rf ./deploy/${pcreFileName}
    rm -rf ./deploy/${zlibFileName}
    rm -rf ./deploy/${jdkFileName}
    if [[ "${isRpmJDK}" == true ]]; then
        rm -rf /opt/java/
    fi
}