#!/bin/bash
# Author: CloudS3n

function project_summary() {
    local projectList=($(cat ./project_list))
    systemctl status spy-*
    sleep 5
    for projectName in "${projectList[@]}"; do
        echo "====================project summary=======================" >> ./logs/log
        if [[ ! -f "/home/5s/web/${projectName}/service/${projectName##*/}-pid" ]]; then
            echo "[ FAILED ] ${projectName} failed to start up !" >> ./logs/log
        else
            echo "[ SUCCESS ] ${projectName} already start up ! pid=$(cat "/home/5s/web/${projectName}/service/${projectName##*/}-pid")" >> ./logs/log
        fi
    done
    echo "---" >> ./logs/log
    ifconfig >> ./logs/log
}