#!/bin/bash
# Author CloudS3n

function add_systemd() {
    echo "> Adding spy.service"
    source ./src/service_template.sh > /etc/systemd/system/spy.service
}

function set_auto_startup () {
    local projectName=$1
    add_systemd
    systemctl daemon-reload
    systemctl enable spy.service
    systemctl start spy.service
}