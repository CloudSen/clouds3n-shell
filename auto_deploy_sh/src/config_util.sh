#!/bin/bash
# Author CloudS3n

function add_systemd() {
    local projectName=$1
    echo "==========================config==========================" >> ./logs/log
    echo "> Adding ${projectName##*/}.service" >> ./logs/log
    source ./src/template/service_template.sh $projectName > /etc/systemd/system/${projectName##*/}.service
    systemctl daemon-reload
}

function set_auto_startup () {
    local projectName=$1
    echo "==========================config==========================" >> ./logs/log
    echo "> Starting ${projectName##*/}.service" >> ./logs/log
    systemctl enable ${projectName##*/}.service
    systemctl start ${projectName##*/}.service
}

function config_project() {
    local projectName=$1
    add_systemd $projectName
    set_auto_startup $projectName
}