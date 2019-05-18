#!/bin/bash
# Author CloudS3n

function chmod_all() {
    chmod +x ./src/*.sh
}

function start() {
    local projectList=($(cat ./deploy/project_list))
    source ./src/prepare_files.sh
    source ./src/project_setup.sh
    if [[ #projectList[@] == 0 ]]; then
        echo "[ ERR ] Project list is empty"
        exit
    else
        echo "> Success to read project list"
    fi
    for projectName in "${projectList[@]}"; do
        prepare_start $projectName
        add_systemd $projectName "/home/5s/web/${projectName}/service/${projectName##*/}.jar"
        set_auto_startup $projectName
    done
    for projectName in "${projectList[@]}"; do
        echo "================================="
        systemctl status ${projectName##*/}
    done
    echo "[ DONE ] Spend time $SECONDS s"
}

function run() {
    chmod_all
    clear
    start
}

run