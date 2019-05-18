#!/bin/bash
# Author: CloudS3n

cat << EOF
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias .='pwd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias tarx='tar zxf '
alias tarc='tar zcf '
alias nginx-p='netstat -tpln | grep nginx'
alias nginx-t='nginx -t'
alias nginx-r='nginx -s reload'
alias nginx-s='nginx -s stop'
alias pse='ps -ef | grep '
alias last-file="$(ls -t | head -1)"
alias la='ls -la'
EOF