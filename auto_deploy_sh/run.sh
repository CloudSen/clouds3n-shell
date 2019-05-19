#!/bin/bash
# Author CloudS3n

source ./src/file_util.sh
source ./src/config_util.sh
source ./src/project_info.sh

function start() {
    echo "==================start deploy====================" >> ./logs/log
    local projectList=($(cat ./project_list))
    for projectName in "${projectList[@]}"; do
        mv_files $projectName
        config_project $projectName
    done
    echo "[ DONE ] Spend time $SECONDS s" >> ./logs/log
}

function run() {
    echo "" > ./logs/log
    tail -f ./logs/log &
    check_project_list
    chmod_all
    clear
    start
    chmod_all
    killall tail
    nginx -s reload
}

run