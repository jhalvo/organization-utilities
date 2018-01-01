#!/usr/bin/env bash

SCHEDULEFILE=~/.schedule.conf
USERNAME=John\ Halvorson
DATE=$(date +%Y-%m-%d)
DOW=$(date +%a)
TOD=$(date +%k%d)

while IFS='' read -r LINE || [[ -n $LINE ]]
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
    CURRENTCLASS=$LINE
    break
  fi

done < $SCHEDULEFILE

FILE=$DATE.txt

if [[ $CURRENTCLASS =~ [0-9a-zA-Z] ]]
then #everything is good
  echo "taking note: $FILE"
else #everything is not good
  echo "everything is not good."
  exit
fi

CLASS=( $CURRENTCLASS )
CLASSNAME=${CLASS[0]}
DAYSMET=${CLASS[1]}
START=${CLASS[2]}
END=${CLASS[3]}
NOTESDIR=${CLASS[4]}

cd "$HOME/$NOTESDIR"

if [ -f "$FILE" ]
then
    vi "$FILE"
else
    cat <<EOT>> "$FILE"

  $USERNAME
  $CLASSNAME
  $DATE

  =======================
  
EOT

vi "$FILE"

fi
