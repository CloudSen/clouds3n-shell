#!/bin/bash
# Author: CloudS3n

function config_java_env() {
    local jdkName=$1
    local javaHome=/usr/local/java/$jdkName
    echo "> Config openjdk..."
    echo "export JAVA_HOME=$javaHome" >> /etc/profile
    echo "export PATH=\$JAVA_HOME/bin:$PATH" >> /etc/profile
    echo "export CLASSPATH=.:\$JAVA_HOME/jre/lib:\$JAVA_HOME/lib:\$JAVA_HOME/lib/tools.jar" >> /etc/profile
    source /etc/profile
}

function config_bashrc() {
    echo "> Config bashrc..."
    source ./src/template/bashrc_template.sh >> /etc/bashrc
    source /etc/bashrc
}

function config_vim() {
    echo "> Config vim..."
    source ./src/template/vimrc_template.sh >> /etc/vimrc
}

function config_nginx() {
    echo "> Config nginx..."
    source ./src/template/nginx_config_template.sh > /home/5s/nginx/conf/nginx.conf
}

function config_all() {
    config_bashrc
    config_vim
    config_nginx
}
