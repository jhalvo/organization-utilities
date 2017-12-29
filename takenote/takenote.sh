#!/usr/bin/env bash

SCHEDULEFILE=schedule.txt
USERNAME=John\ Halvorson
DATE=$(date +%Y-%m-%d)
LINE=$(getclass.sh schedule.txt)

if [[ $LINE =~ Error ]]
then
    echo $LINE
    exit
fi

CLASS=( $LINE )
CLASSNAME=${CLASS[0]}
DAYSMET=${CLASS[1]}
START=${CLASS[2]}
END=${CLASS[3]}
NOTESDIR=${CLASS[4]}

cd; cd $NOTESDIR

FILE=$DATE.txt

if [ -f $FILE ]
then
    vi $FILE
else
    cat <<EOT>> $FILE

  $USERNAME
  $CLASSNAME
  $DATE

  =======================

  
EOT

vi $FILE

fi
