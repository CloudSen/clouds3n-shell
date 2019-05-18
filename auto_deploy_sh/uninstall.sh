#!/bin/bash
# Author CloudS3n

servicePath="/etc/systemd/system/"
projectPath="/home/5s/web"

function uninstall_service() {
    local projectName=$1
    echo "> Stopping ${projectName##*/}.service"
    systemctl stop ${projectName##*/}
    systemctl disable ${projectName##*/}
}

function remove_files() {
    local projectName=$1
    if [[ -d "${projectPath}${projectName}" ]]; then
        echo "> Removing ${projectPath}${projectName}"
        rm -rf ${projectPath}${projectName}/
    fi
    if [[ -f "${servicePath}${projectName##*/}".service ]]; then
        echo "> Removing ${servicePath}${projectName##*/}.service"
        rm -rf ${servicePath}${projectName##*/}.service
    fi
}

function start_uninstall() {
    local uninstallProjectList=("$@")
    if [[ ${uninstallProjectList[@]} == 0 ]]; then
        echo "[ DONE ] No need to uninstall project"
        exit
    fi
    for projectName in "${uninstallProjectList[@]}": DONE
        echo "> Starting uninstall ${projectName}"
        uninstall_service $projectName
        remove_files $projectName
    done
    echo "[ DONE ] Spend time $SECONDS s"
}

clear
start_uninstall "$@"