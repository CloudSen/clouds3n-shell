#!/bin/bash
# Author: CloudS3n

projectName='spy-optical-platform/spy-task'
pidFilePath="/home/5s/web/${projectName}/service/${projectName##*/}-pid"
clear
echo "==> Stopping ${projectName}..."
if [[ ! -f ${pidFilePath} ]]; then
    echo "==> no need to stop"
    exit
fi
pid="$(cat ${pidFilePath})"
if [[ -z $pid ]]; then
    echo "==> no need to stop"
    exit
fi
echo "==> ${projectName} pid=$pid"
$(kill -9 "$pid")
rm -f ${pidFilePath}
echo "==> Success to stop ${projectName}"
