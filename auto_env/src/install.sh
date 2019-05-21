#!/bin/bash
# Author: CloudS3n

source ./config.sh

function install_zlib() {
    echo "---" >> ./logs/log
    echo "> compile install zlib..." >> ./logs/log
    if [[ "${isRpmZlib}" == true ]]; then
        echo "[ ERR ] ZLIB only support compile install now !" >> ./logs/log
        killall tail
        exit
    fi
    cd ./deploy/$zlibFileName/
    ./configure
    echo "> make install zlib" >> ../../logs/log
    make && make install
    cd ../..
    cat "$(find /usr -name zlib.pc | head -1)" >> ./logs/log
    echo "[ SUCCESS ] Success to install zlib" >> ./logs/log
}

function install_pcre() {
    echo "---" >> ./logs/log
    echo "> compile install pcre..." >> ./logs/log
    if [[ "${isRpmPcre}" == true ]]; then
        echo "[ ERR ] PCRE only support compile install now !" >> ./logs/log
        killall tail
        exit
    fi
    cd ./deploy/$pcreFileName/
    ./configure --disable-cpp
    echo "> make install pcre" >> ../../logs/log
    make && make install
    cd ../..
    echo "[ SUCCESS ] Success to install pcre" >> ./logs/log
}

function install_nginx() {
    echo "---" >> ./logs/log
    echo "> compile install nginx..." >> ./logs/log
    if [[ "${isRpmNginx}" == true ]]; then
        echo "[ ERR ] Nginx only support compile install now !" >> ./logs/log
        killall tail
        exit
    fi
    cd ./deploy/$nginxFileName/
    ./configure --prefix=/home/5s/nginx --sbin-path=/usr/bin/nginx
    echo "> make install nginx" >> ../../logs/log
    make && make install
    cd ../..
    echo "[ SUCCESS ] Success to install nginx" >> ./logs/log
}

function install_jdk() {
    echo "---" >> ./logs/log
    echo "> uninstalling all jdk" >> ./logs/log
    local jdkArray=($(rpm -qa | grep openjdk))
    if [[ "${#jdkArray[@]}" > 0  ]]; then
        echo "> remoing all ${#jdkArray[@]} exists openjdk via yum" >> ./logs/log
        rpm -qa | grep openjdk | xargs yum -y remove
    else
        echo "> no need to remove rpm openjdk" >> ./logs/log
    fi
    cd /opt/java/$jdkFileName/
    if [[ "${isRpmJDK}" == true ]]; then
        echo "> installing jdk via yum..." >> /home/5s/scripts/auto_env/logs/log
        yum --nogpgcheck -y localinstall "${jdkRpmHeadName}${rpmSuffix}"
        yum --nogpgcheck -y localinstall "${jdkRpmName}${rpmSuffix}"
    else
        echo "> compile install jdk..." >> /home/5s/scripts/auto_env/logs/log
    fi
    cd /home/5s/scripts/auto_env
    echo "[ SUCCESS ] Success to install jdk" >> ./logs/log
}

function install_all() {
    echo "==================install-start==================" >> ./logs/log
    if [[ "${enableZlib}" == true ]]; then
        install_zlib
    fi
    if [[ "${enablePcre}" == true ]]; then
        install_pcre
    fi
    if [[ "${enableNginx}" == true ]]; then
        install_nginx
    fi
    if [[ "${enableJDK}" == true ]]; then
        install_jdk
    fi
    echo "==================install-end====================" >> ./logs/log
}