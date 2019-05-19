#!/bin/bash
# Author: CloudS3n

cat << EOF
[Unit]
Description=The NGINX Server
After=syslog.target network.target remote-fs.target nss-lookup.target

[Service]
Type=forking
PIDFile=/home/5s/nginx/nginx.pid
ExecStartPre=/bin/nginx -t
ExecStart=/bin/nginx
ExecReload=/bin/nginx -s reload
ExecStop=/bin/kill -s QUIT $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target
EOF