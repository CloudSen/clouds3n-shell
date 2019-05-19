#!/bin/bash
# Author: CloudS3n

projectName='spy-optical-platform/spy-task'
clear
echo "==> Starting ${projectName}..."
if [[ ! -d "/home/5s/web/${projectName}/logs/info/" ]]; then
    mkdir -p "/home/5s/web/${projectName}/logs/info/"
fi
java -jar "/home/5s/web/${projectName}/service/${projectName##*/}.jar" --spring.profiles.active=prod &>/dev/null &
echo "==> Logs all at /home/5s/web/${projectName}/logs/"
sleep 2
echo "Reading log" `ls -t "/home/5s/web/${projectName}/logs/info/" | head -1`
watch tail -n 30 "/home/5s/web/${projectName}/logs/info/"`ls -t "/home/5s/web/${projectName}/logs/info/" | head -1`
