#!/bin/bash
# Author CloudS3n

projectName=$1
projectPath=$2

cat << EOF
[Unit]
Description=$projectName
After=syslog.target

[Service]
User=root
ExecStart=$projectPath --spring.profiles.active=prod
SuccessExitStatus=143

[Install]
WantedBy=multi-user.target
EOF