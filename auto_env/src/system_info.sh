#!/bin/bash
# Author: CloudS3n

function summary() {
    echo "=================summary===================" >> ./logs/log
    cat /proc/version >> ./logs/log
    echo "---" >> ./logs/log
    nginx -v 2>> ./logs/log
    echo "---" >> ./logs/log
    java -version 2>> ./logs/log
    echo "---" >> ./logs/log
    javac -version 2>> ./logs/log
    echo "---" >> ./logs/log
    alternatives --display java
}