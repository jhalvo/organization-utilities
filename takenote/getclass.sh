#!/usr/bin/env bash

DOW=`date +%a`
TOD=`date +%k%d`
FILENAME=$1

while IFS='' read -r LINE || [[ -n `$LINE` ]]
do
  if [[ $LINE =~ ^# ]]
  then continue
  fi
  CLASS=( $LINE )
  CLASSNAME=${CLASS[0]}
  DAYSMET=${CLASS[1]}
  START=${CLASS[2]}
  END=${CLASS[3]}

  if [[ $DAYSMET =~ $DOW ]] && [[ $TOD > $START ]] && [[ $TOD < $END ]]
  then
    echo $LINE
    exit
  fi

done < $FILENAME

echo Error: No class right now.
