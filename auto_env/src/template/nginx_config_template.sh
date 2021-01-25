#!/bin/bash
# Author: CloudS3n

source ./config.sh

cat << EOF
user  root;
worker_processes  1;

error_log  ${nginxInstallPath}logs/error.log;
pid        ${nginxInstallPath}nginx.pid;

events {
    worker_connections  1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;
    sendfile        on;
    keepalive_timeout  65;

    server {
        listen       80;
        server_name  localhost;
        charset utf-8;

        location / {
            root   /home/5s/web/spy-optical-platform/spy-management/webpage/build;
            index  index.html index.htm;
            try_files \$uri \$uri/ /index.html =404;
        }

        location /dataExchange {
            proxy_pass http://localhost:8800/;
        }

        location /rwyb {
            proxy_pass http://localhost:8801/;
        }

        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
    }
}

EOF