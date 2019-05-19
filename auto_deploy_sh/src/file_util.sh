#!/bin/bash
# Author CloudS3n

function chmod_all() {
    find /home/5s/ -name "*.sh" -execdir chmod u+x {} +
}

function check_project_list() {
    if [[ ! -f "./project_list" ]]; then
        echo "[ ERR ] project_list file not found !" >> ./logs/log
        killall tail
        exit
    fi
    local projectList=($(cat ./project_list))
    if [[ ${#projectList[@]} == 0 ]]; then
        echo "[ ERR ] Project list is empty" >> ./logs/log
        killall tail
        exit
    else
        echo "> Success to read project list" >> ./logs/log
    fi
}

function check_para() {
    local projectName=$1
    if [[ $# == 0 || -z $projectName ]]; then
        echo "[ ERR ] project name is blank !"  >> ./logs/log
        killall tail
        exit
    fi
}

function create_deploy_path() {
    local projectName=$1
    echo "==========================create dir============================" >> ./logs/log
    echo "> Starting create [ ${projectName} ] deploy path..."  >> ./logs/log
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

function replace_files() {
    local projectName=$1
    echo "==========================replace files============================" >> ./logs/log
    echo "> Starting replace [ ${projectName} ] files..." >> ./logs/log
    yes | cp ./deploy/"${projectName}"/service/* /home/5s/web/"${projectName}"/service/
    if [[ -d ./deploy/"${projectName}"/webpage/ ]]; then
        yes | cp -r ./deploy/"${projectName}"/webpage/ /home/5s/web/"${projectName}"
    fi
    if [[ -f /home/5s/web/"${projectName}"/webpage/build.zip ]]; then
        unzip -qo /home/5s/web/"${projectName}"/webpage/build.zip -d /home/5s/web/"${projectName}"/webpage/
        rm -f /home/5s/web/"${projectName}"/webpage/build.zip
    fi
}

function mv_files() {
    local projectName=$1
    check_para $projectName
    create_deploy_path $projectName
    replace_files $projectName
}
