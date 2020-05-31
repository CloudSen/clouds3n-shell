#!/bin/bash
# Author: CloudS3n

source ./config.sh

function config_java_env() {
    local javaHome=/opt/java/$jdkFileName
    echo "---" >> ./logs/log
    echo "> Config jdk env..." >> ./logs/log
    cp /etc/profile /etc/profile.bak
    source ./src/template/profile_template.sh $javaHome >> /etc/profile
    # for systemd service
    alternatives --install /usr/bin/java java ${javaHome}/bin/java 3
}

function config_bashrc() {
    echo "---" >> ./logs/log
    echo "> Config bashrc..." >> ./logs/log
    cp /etc/bashrc /etc/bashrc.bak
    source ./src/template/bashrc_template.sh >> /etc/bashrc
}

function config_vim() {
    echo "---" >> ./logs/log
    echo "> Config vim..." >> ./logs/log
    cp /etc/vimrc /etc/vimrc.bak
    source ./src/template/vimrc_template.sh >> /etc/vimrc
}

function config_nginx() {
    echo "---" >> ./logs/log
    echo "> Config nginx..." >> ./logs/log
    echo "> Create nginx.conf" >> ./logs/log
    cp /home/5s/nginx/conf/nginx.conf /home/5s/nginx/conf/nginx.conf.bak
    source ./src/template/nginx_config_template.sh > /home/5s/nginx/conf/nginx.conf
    echo "> Create nginx.service" >> ./logs/log
    source ./src/template/nginx_service_template.sh > /etc/systemd/system/nginx.service
    echo "> Start nginx.service" >> ./logs/log
    systemctl daemon-reload
    systemctl enable nginx
    systemctl start nginx
}

function refresh_config() {
    source /etc/profile
    source /etc/bashrc
}

function config_all() {
    echo "==================Config-start==================" >> ./logs/log
    if [[ "${enableBash}" == true ]]; then
        config_bashrc
    fi
    if [[ "${enableVim}" == true ]]; then
        config_vim
    fi
    if [[ "${enableNginx}" == true ]]; then
        config_nginx
    fi
    if [[ "${enableJDK}" == true ]]; then
        config_java_env
    fi
    refresh_config
    echo "==================Config-end====================" >> ./logs/log
}
