#!/bin/bash
# Author: CloudS3n
# Warn: Nginx&PCRE&ZLIB only support compile install now !

# root user id
ROOT_UID=0

# shell dir
shellDir="$(pwd)"

# files name
nginxFileName="nginx-1.15.0"
pcreFileName="pcre-8.38"
zlibFileName="zlib-1.2.11"
jdkFileName="openjdk-8u242"
copyJdkConfigsName="copy-jdk-configs-3.3-10.el7_5.noarch"
jdkRpmHeadName="java-1.8.0-openjdk-headless-1.8.0.242.b08-1.el7.x86_64"
jdkRpmName="java-1.8.0-openjdk-1.8.0.242.b08-1.el7.x86_64"

# install path
nginxInstallPath="/home/app/nginx/"


# files suffix
tarSuffix=".tar"
gzSuffix=".tar.gz"
rpmSuffix=".rpm"

# enable switch
enableVim=true
enableBash=true
enableNginx=true
enablePcre=true
enableZlib=true
enableJDK=true

# installation type switch
isRpmNginx=false
isRpmPcre=false
isRpmZlib=false
isRpmJDK=true