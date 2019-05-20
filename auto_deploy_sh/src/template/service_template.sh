#!/bin/bash
# Author CloudS3n

projectName=$1

cat << EOF
[Unit]
Description=${projectName##*/}-auto-startup
After=syslog.target

[Service]
User=root
WorkingDirectory=/home/5s/web/${projectName}/service/
ExecStart=/usr/bin/java -jar ${projectName##*/}.jar
ExecStop=/home/5s/web/${projectName}/service/stop.sh
SuccessExitStatus=143

[Install]
WantedBy=multi-user.target
EOF