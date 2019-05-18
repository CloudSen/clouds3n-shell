#!/bin/bash
# Author: CloudS3n

projectName='spy-management'
echo "==> Stop ${projectName}..."
pid="$(netstat -tpln | grep 8877| awk '{printf $7}' | cut -d / -f1)"
if [[ -z $pid ]]; then
	echo "==> no need to stop"
	exit
fi
echo "==> ${projectName} pid=$pid"
$(kill -9 "$pid")
echo "==> Success to stop ${projectName}"
