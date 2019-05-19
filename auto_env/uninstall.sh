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

function clear_log() {
    echo "==================uninstall=================="
    echo "> clear log"
    echo "" > ./logs/log
}

function uninstall_all() {
    clear
    uninstall_nginx
    clear_log
}

uninstall_all