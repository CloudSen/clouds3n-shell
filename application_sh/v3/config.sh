#!/bin/bash
# Author: CloudS3n
# Description: Configuration File

# Please correspond to the Spring configuration file "spring.application.name"
# The project name can be multi-level, indicating a hierarchical relationship, eg: "parent-name/child-name"
# What's more, The subdirectory name will be used as the jar package name
projectName=""

# The absolute directory prefix for storing executable jar package, eg: "/home/app/web/"
projectPathPrefix=""

# The relative directory for executable jar package, default is "/service"
jarRelativePath="service/"

# The relative directory prefix for storing project log files, default using "/logs"
logRelativePath="logs/"

# The relative directory for info log, Used to monitor logs after starting script
infoLogRelativePath="info/"



# Constants, DO NOT MODIFY
projectPath="${projectPathPrefix}${projectName}/"
logPath="${projectPath}${logRelativePath}"
infoLogPath="${projectPath}${logPath}${infoLogRelativePath}"
jarFileName="${projectName##*/}.jar"
jarPath="${projectPath}${jarRelativePath}${jarFileName}"
pidFilePath="${projectPath}${jarRelativePath}${projectName##*/}-pid"
