#!/bin/bash
# Author: CloudS3n

source ./src/config.sh

nginxFileName="nginx-1.15.0"
pcreFileName="pcre-8.38"
zlibFileName="zlib-1.2.11"
jdkFileName="openjdk-8u242-b08"
fileSuffix=".tar.gz"

function install_zlib() {
    echo "====================================" >> ./logs/log
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
    echo "====================================" >> ./logs/log
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
    echo "====================================" >> ./logs/log
    echo "=> installing nginx..." >> ./logs/log
    echo "=> configuring nginx" >> ./logs/log
    cd ./deploy/$nginxFileName/
    ./configure --prefix=/home/5s/nginx --sbin-path=/usr/bin/nginx
    echo "=> make install nginx" >> ../../logs/log
    make && make install
    cd ../..
    echo "[ SUCCESS ] Success to install nginx" >> ./logs/log
}

function install_java() {
    config_java_env $jdkFileName
}

function summary() {
    echo "=================summary===================" >> ./logs/log
    nginx -v 2>> ./logs/log
    java -version 2>> ./logs/log
    #javac -version 2>> ./logs/log
    echo "=================summary===================" >> ./logs/log
}

function install_all() {
    install_zlib
    install_pcre
    install_nginx
    #install_java
    summary
}