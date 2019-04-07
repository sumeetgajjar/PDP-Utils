#!/bin/bash

set -e

if [ $# -ne 1 ]; then
    echo "Usage: bash unzip-submission.sh Archive.zip"
    exit 1
fi

if [ ! -f $1 ]; then
	echo "'$1' does not exists"
	exit 1
fi

DIR_PREFIX="pdp-submission-"
ID=1

if [ -d $DIR_PREFIX$ID ]; then
	CURRENT_ID=`ls -l | grep $DIR_PREFIX | awk '{print $9}' | sort -r | head -n1 | awk -F "-" '{print $3}'`
	echo $CURRENT_ID
	ID=$((CURRENT_ID+1))
	echo $ID
fi

UNZIP_FOLDER=$DIR_PREFIX$ID
echo "Current Unzip Folder => "$UNZIP_FOLDER
mkdir $UNZIP_FOLDER
unzip $1 -d $UNZIP_FOLDER
idea $UNZIP_FOLDER