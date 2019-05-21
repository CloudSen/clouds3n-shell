#!/bin/bash
# Author: CloudS3n
# Warn: Nginx&PCRE&ZLIB only support compile install now !

# file name
nginxFileName="nginx-1.15.0"
pcreFileName="pcre-8.38"
zlibFileName="zlib-1.2.11"
jdkFileName="openjdk-8u242"
jdkRpmHeadName="java-1.8.0-openjdk-headless-1.8.0.242.b08-1.el7.aarch64"
jdkRpmName="java-1.8.0-openjdk-1.8.0.242.b08-1.el7.aarch64"

# file suffix
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

# install switch
isRpmNginx=false
isRpmPcre=false
isRpmZlib=false
isRpmJDK=false