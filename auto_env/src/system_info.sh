#!/bin/bash
# Author: CloudS3n

function summary() {
    echo "=================summary===================" >> ./logs/log
    cat /proc/version >> ./logs/log
    nginx -v 2>> ./logs/log
    java -version 2>> ./logs/log
    #javac -version 2>> ./logs/log
    echo "=================summary===================" >> ./logs/log
}