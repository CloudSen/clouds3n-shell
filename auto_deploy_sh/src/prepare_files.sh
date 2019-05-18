#!/bin/bash
# Author CloudS3n

function check_para() {
    local projectName=$1
    if [[ $# == 0 || -z $projectName ]]; then
        echo "[ ERR ] project name is blank"
        exit
    fi
}

function create_deploy_path() {
    local projectName=$1
    echo "> Starting create [ ${projectName} ] deploy path..."
    if [[ ! -d "/home/5s/web/${projectName}/logs/" ]]; then
        mkdir -p "/home/5s/web/${projectName}/logs/"
    fi
    if [[ ! -d "/home/5s/web/${projectName}/service/" ]]; then
        mkdir -p "/home/5s/web/${projectName}/service/"
    fi
    if [[ ! -d "/home/5s/web/${projectName}/webpage/" ]]; then
        mkdir -p "/home/5s/web/${projectName}/webpage/"
    fi
}

function copy_files() {
    local projectName=$1
    echo "> Starting copy [ ${projectName} ] files..."
    cp ./deploy/"${projectName}"/service/* /home/5s/web/"${projectName}"/service/
    cp ./deploy/"${projectName}"/webpage/* /home/5s/web/"${projectName}"/webpage/
}

function prepare_start() {
    local projectName=$1
    check_para $projectName
    create_deploy_path $projectName
    copy_files $projectName
}