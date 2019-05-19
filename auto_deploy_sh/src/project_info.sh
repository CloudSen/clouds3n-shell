#!/bin/bash
# Author: CloudS3n

function project_summary() {
    local projectList=($(cat ./project_list))
    for projectName in "${projectList[@]}"; do
        echo "====================project summary=======================" >> ./logs/log
        if [[ ! -f "/home/5s/web/${projectName}/service/${projectName##*/}-pid" ]]; then
            echo "[ FAILED ] ${priject} failed to start up !" >> ./logs/log
        else
            echo "[ SUCCESS ] ${priject} already start up ! pid=$(cat "/home/5s/web/${projectName}/service/${projectName##*/}-pid")" >> ./logs/log
        fi
    done
}