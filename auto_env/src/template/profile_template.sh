#!/bin/bash
# Author: CloudS3n

javaHome=$1

cat << EOF
export JAVA_HOME=${javaHome}
export PATH=\$JAVA_HOME/bin:\$PATH
export CLASSPATH=.:\$JAVA_HOME/jre/lib:\$JAVA_HOME/lib:\$JAVA_HOME/lib/tools.jar
EOF