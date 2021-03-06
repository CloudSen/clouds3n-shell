#!/bin/sh

git filter-branch --env-filter '

an="$GIT_AUTHOR_NAME"
am="$GIT_AUTHOR_EMAIL"
cn="$GIT_COMMITTER_NAME"
cm="$GIT_COMMITTER_EMAIL"

if [ "$GIT_COMMITTER_EMAIL" = "www.402645063@live.com" ]
then
    cn="CloudS3n"
    cm="www.402645063@gmail.com"
fi
if [ "$GIT_AUTHOR_EMAIL" = "www.402645063@live.com" ]
then
    an="CloudS3n"
    am="www.402645063@gmail.com"
fi

export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"
'
