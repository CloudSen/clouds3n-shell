#!/bin/bash
# Author: CloudS3n

source ./config.sh

function uninstall_nginx() {
    echo "---"
    if [[ -f /etc/systemd/system/nginx.service ]]; then
        echo "> removing nginx.service"
        systemctl disable nginx
        systemctl stop nginx
        rm -f /etc/systemd/system/nginx.service
        systemctl daemon-reload
        echo "> removing nginx folder"
        rm -rf ${nginxInstallPath}
        echo "> removing nginx executor"
        rm -f /bin/nginx
    else
        echo "> no need to removing nginx"
    fi
}

function uninstall_openjdk() {
    echo "---"
    local jdkArray=($(rpm -qa | grep openjdk))
    if [[ "${#jdkArray[@]}" > 0  ]]; then
        echo "> remoing all ${#jdkArray[@]} exists openjdk via yum"
        rpm -qa | grep openjdk | xargs yum -y remove
    else
        echo "> no need to remove rpm openjdk"
    fi
    if [[ -d /opt/java ]]; then
        echo "> removing compiled jdk files"
        rm -rf /opt/java/
    else
        echo "> no need to remove compiled jdk files"
    fi
    alternatives --remove java /opt/java/$jdkFileName/bin/java
}

function resetEvnFile() {
    echo "---"
    if [[ -f /etc/bashrc.bak ]]; then
        echo "> reset /etc/bashrc"
        rm -f /etc/bashrc && mv /etc/bashrc.bak /etc/bashrc
    else
        echo "> no need to reset bashrc"
    fi
    if [[ -f /etc/vimrc.bak ]]; then
        echo "> reset /etc/vimrc"
        rm -f /etc/vimrc && mv /etc/vimrc.bak /etc/vimrc
    else
        echo "> no need to reset vimrc"
    fi
    if [[ -f /etc/profile.bak ]]; then
        echo "> reset /etc/profile"
        rm -f /etc/profile && mv /etc/profile.bak /etc/profile
    else
        echo "> no need to reset profile"
    fi
}

function clear_log() {
    echo "---"
    echo "> clear log"
    echo "" > ./logs/log
}

function uninstall_all() {
    clear
    echo "==================uninstall-start=================="
    uninstall_nginx
    uninstall_openjdk
    resetEvnFile
    clear_log
    echo "==================uninstall-end===================="
}

uninstall_all