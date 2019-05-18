#!/bin/bash
# Author: CloudS3n

function config_java_env() {
    local jdkName=$1
    local javaHome=/usr/local/java/$jdkName
    echo "export JAVA_HOME=$javaHome" >> /etc/profile
    echo "export PATH=\$JAVA_HOME/bin:$PATH" >> /etc/profile
    echo "export CLASSPATH=.:\$JAVA_HOME/jre/lib:\$JAVA_HOME/lib:\$JAVA_HOME/lib/tools.jar" >> /etc/profile
    source /etc/profile
}