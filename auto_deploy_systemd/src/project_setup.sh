#!/bin/bash
# Author CloudS3n

function add_systemd() {
    local projectName=$1
    local jarPath=$2
    local servicePath=/etc/systemd/system/${projectName##*/}.service
    echo "> Adding ${projectName##*/}.service"
    source ./src/service_template.sh $projectName $jarPath > ${servicePath}
}

function set_auto_startup () {
    local projectName=$1
    systemctl daemon-reload
    systemctl enable ${projectName##*/}.service
    systemctl start ${projectName##*/}.service
}