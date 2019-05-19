#!/bin/bash
# Author: CloudS3n

function shutdown_all() {
    find /home/5s/web/ -name "stop.sh" -exec chmod +x {} \; -exec {} \; 2>/dev/null
}

shutdown_all