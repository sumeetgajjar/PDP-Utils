#!/bin/bash

set -e

SUBMISSION_DIR="submissions"
SOURCE_CODE_DIR="src"
TEST_CODE_DIR="test"
RES_DIR="res"
PWD=`pwd`
CURRENT_DIR=`basename $PWD`
LOCK_FILE_ROOT_DIR="/tmp/submission-locks/"
HISTORY_FILE="${SUBMISSION_DIR}/history.csv"

if [ ! -d $LOCK_FILE_ROOT_DIR ]
then
	echo "creating the lock root dir"
	mkdir -p $LOCK_FILE_ROOT_DIR || exit 1
fi

(
	if flock -xn 9 ;
	then
		if [ ! -d  $SOURCE_CODE_DIR ]
		then
			echo "source code dir does not exist"
			exit 1
		fi

		if [ ! -d  $TEST_CODE_DIR ]
		then
			echo "test code dir does not exist"
			exit 1
		fi

		if [ ! -d $SUBMISSION_DIR ]
		then
			echo "creating the submission dir"
			mkdir $SUBMISSION_DIR	
			echo "submission dir created"
		fi

		if [ -f $HISTORY_FILE ]
		then 
			SUBMISSION_COUNT=`tail -n1 $HISTORY_FILE | awk -F"," '{print $2+1}'`
		else
			SUBMISSION_COUNT=0
			echo '"Submission Zip Creation Date","Submission Count"' >> $HISTORY_FILE
		fi
		
		SUBMISSION_FILE="${SUBMISSION_DIR}/submission-${SUBMISSION_COUNT}"

		echo "creating zip for the submission"
		zip -r $SUBMISSION_FILE $SOURCE_CODE_DIR $TEST_CODE_DIR $RES_DIR
		echo "submission zip created : ${SUBMISSION_FILE}.zip"

		SUBMISSION_HISTORY='"'`date`'",'${SUBMISSION_COUNT}
		echo $SUBMISSION_HISTORY >> $HISTORY_FILE
	else
		echo "Cannot acquire lock"
		exit 1
	fi
)9>$LOCK_FILE_ROOT_DIR"$CURRENT_DIR.lock"
