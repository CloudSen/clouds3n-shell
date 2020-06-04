#!/bin/bash
# Author: CloudS3n
# Description: Startup APP, And Watch Last 30 Row Info Log

souce ./config.sh

clear
echo "> Starting ${projectName}..."
if [[ ! -d $infoLogPath ]]; then
    mkdir -p $infoLogPath
fi
echo "> Exec jar..."
java -jar $jarPath --spring.profiles.active=prod &>/dev/null &
local jarPid=$!
wait jarPid
echo "> APP Log Path: $logPath"
echo "> Reading Info Log: "`ls -t $infoLogPath" | head -1`
watch tail -n 30 $infoLogPath`ls -t $infoLogPath | head -1`
