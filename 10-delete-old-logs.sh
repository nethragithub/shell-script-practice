#!/bin/bash
SOURCE_DIRECTORY=/tmp/app-logs
if [ -d $SOURCE_DIRECTORY ]
then
    echo -e "$SOURCE_DIRECTORY is already exit ...skipping"
else
    echo -e "$SOURCE_DIRECTORY is no exist"
    mkdir -p /tmp/app-logs
fi
FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

while IFS= read -r line
do
  echo "files delete::$line"
  rm -rf $line
done <<< $FILES  
