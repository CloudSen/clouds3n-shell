#!/bin/bash
# Author: CloudS3n
# Description: Stop Current APP, And Delete PID File

source ./config.sh

clear
echo "> Stopping ${projectName}..."
if [[ ! -f ${pidFilePath} ]]; then
    echo "[ DONE ] No Need To Stop"
    exit
fi
local pid="$(cat ${pidFilePath})"
if [[ -z $pid ]]; then
    echo "[ ERR ] PID Not Found"
    exit
fi
echo "> APP PID = $pid"
$(kill -9 "$pid")
rm -f ${pidFilePath}
echo "[ SUCCESS ] APP Has Been Closed"
