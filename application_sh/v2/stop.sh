#!/bin/bash
# Author: CloudS3n

projectName='spy-optical-platform/spy-task'
echo "==> Stopping ${projectName}..."
if [[ ! -f "./${projectName##*/}-pid" ]]; then
    echo "==> no need to stop"
    exit
fi
pidFileName="${projectName##*/}-pid"
pid="$(cat ./${pidFileName})"
if [[ -z $pid ]]; then
        echo "==> no need to stop"
        exit
fi
echo "==> ${projectName} pid=$pid"
$(kill -9 "$pid")
rm -f ./${pidFileName}
echo "==> Success to stop ${projectName}"
