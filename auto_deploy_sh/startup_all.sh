#!/bin/bash
# Author: CloudS3n

function startup_all() {
    local pathList=($(find /home/5s/web/ -name "run.sh"))
    if [[ ${#pathList[@]} == 0 ]]; then
        echo "> no need to start project"
        killall tail
        exit
    fi  
    for pathName in "${pathList[@]}"; do
        pathName="$(echo $pathName | rev | cut -d / -f2- | rev)"
        cd $pathName
        echo "> Starting ${pathName}/run.sh"
        ./run.sh
    done
}

startup_all