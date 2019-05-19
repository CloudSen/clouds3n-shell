#!/bin/bash
# Author CloudS3n

servicePath="/etc/systemd/system/"
projectPath="/home/5s/web/"

function remove_systemd() {
    local projectName=$1
    if [[ -f "${servicePath}${projectName##*/}.service" ]]; then
        echo "> Removing ${servicePath}${projectName##*/}.service"
        systemctl stop ${projectName##*/}
        systemctl disable ${projectName##*/}
        rm -f ${servicePath}${projectName##*/}.service
        systemctl daemon-reload
    fi
}

function remove_files() {
    local projectName=$1
    if [[ -d "${projectPath}${projectName}" ]]; then
        echo "> Removing ${projectPath}${projectName}"
        rm -rf ${projectPath}${projectName}/
    fi
}

function start_uninstall() {
    local uninstallProjectList=("$@")
    if [[ ${uninstallProjectList[@]} == 0 ]]; then
        echo "[ DONE ] No need to uninstall project"
        exit
    fi
    for projectName in "${uninstallProjectList[@]}"; do
        echo "> Starting uninstall ${projectName}"
        remove_systemd $projectName
        remove_files $projectName
    done
    echo "[ DONE ] Spend time $SECONDS s"
}

clear
start_uninstall "$@"