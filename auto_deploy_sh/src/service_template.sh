#!/bin/bash
# Author CloudS3n

cat << EOF
[Unit]
Description=spy-auto-startup
After=syslog.target

[Service]
User=root
ExecStart=/home/5s/scripts/auto_deploy_sh/startup.sh
SuccessExitStatus=143

[Install]
WantedBy=multi-user.target
EOF