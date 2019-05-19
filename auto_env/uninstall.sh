#!/bin/bash
# Author: CloudS3n

function uninstall_nginx() {
    echo "==================uninstall=================="
    echo "> removing nginx.service"
    systemctl disable nginx
    systemctl stop nginx
    rm -f /etc/systemd/system/nginx.service
    systemctl daemon-reload
    echo "> removing nginx folder"
    rm -rf /home/5s/nginx/
    echo "> removing nginx executor"
    rm -f /bin/nginx
}

function uninstall_yum_openjdk() {
    echo "==================uninstall=================="
    echo "> removing all openjdk via yum"
    rpm -qa | grep openjdk | xargs yum -y remove
}

function clear_log() {
    echo "==================uninstall=================="
    echo "> clear log"
    echo "" > ./logs/log
}

function uninstall_all() {
    clear
    uninstall_nginx
    uninstall_yum_openjdk
    clear_log
}

uninstall_all