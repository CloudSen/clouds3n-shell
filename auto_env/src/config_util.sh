#!/bin/bash
# Author: CloudS3n

source ./config.sh

function config_java_env() {
    local jdkName=$1
    local javaHome=/usr/local/java/$jdkName
    echo "> Config openjdk..." >> ./logs/log
    echo "export JAVA_HOME=$javaHome" >> /etc/profile
    echo "export PATH=\$JAVA_HOME/bin:$PATH" >> /etc/profile
    echo "export CLASSPATH=.:\$JAVA_HOME/jre/lib:\$JAVA_HOME/lib:\$JAVA_HOME/lib/tools.jar" >> /etc/profile
    source /etc/profile
}

function config_bashrc() {
    echo "> Config bashrc..." >> ./logs/log
    source ./src/template/bashrc_template.sh >> /etc/bashrc
    source /etc/bashrc
}

function config_vim() {
    echo "> Config vim..." >> ./logs/log
    source ./src/template/vimrc_template.sh >> /etc/vimrc
}

function config_nginx() {
    echo "> Config nginx..." >> ./logs/log
    echo "> Create nginx.conf" >> ./logs/log
    source ./src/template/nginx_config_template.sh > /home/5s/nginx/conf/nginx.conf
    echo "> Create nginx.service" >> ./logs/log
    source ./src/template/nginx_service_template.sh > /etc/systemd/system/nginx.service
    echo "> Start nginx.service" >> ./logs/log
    systemctl daemon-reload
    systemctl enable nginx
    systemctl start nginx
}

function config_all() {
    config_bashrc
    config_vim
    if [[ "${enableNginx}" == true ]]; then
        config_nginx
    fi
}
