#!/bin/bash
# Author: CloudS3n

source ./config.sh

function install_zlib() {
    echo "==================install==================" >> ./logs/log
    echo "=> installing zlib..." >> ./logs/log
    echo "=> configuring zlib" >> ./logs/log
    cd ./deploy/$zlibFileName/
    ./configure
    echo "=> make install zlib" >> ../../logs/log
    make && make install
    cd ../..
    cat "$(find /usr -name zlib.pc | head -1)" >> ./logs/log
    echo "[ SUCCESS ] Success to install zlib" >> ./logs/log
}

function install_pcre() {
    echo "==================install==================" >> ./logs/log
    echo "=> installing pcre..." >> ./logs/log
    echo "=> configuring pcre" >> ./logs/log
    cd ./deploy/$pcreFileName/
    ./configure --disable-cpp
    echo "=> make install pcre" >> ../../logs/log
    make && make install
    cd ../..
    echo "[ SUCCESS ] Success to install pcre" >> ./logs/log
}

function install_nginx() {
    echo "==================install==================" >> ./logs/log
    echo "=> installing nginx..." >> ./logs/log
    echo "=> configuring nginx" >> ./logs/log
    cd ./deploy/$nginxFileName/
    ./configure --prefix=/home/5s/nginx --sbin-path=/usr/bin/nginx
    echo "=> make install nginx" >> ../../logs/log
    make && make install
    cd ../..
    echo "[ SUCCESS ] Success to install nginx" >> ./logs/log
}

function install_jdk() {
    echo "==================install==================" >> ./logs/log
    echo "=> installing jdk via yum..." >> ./logs/log
    cd /opt/java/$jdkFileName/
    yum --nogpgcheck -y localinstall "${jdkRpmHeadName}${rpmSuffix}"
    yum --nogpgcheck -y localinstall "${jdkRpmName}${rpmSuffix}"
    cd /home/5s/scripts/auto_env
    echo "[ SUCCESS ] Success to install jdk" >> ./logs/log
}

function install_all() {
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
}