#!/bin/bash
DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=50
MESSAGE=""

while IFS= read -r line
do
  USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
  FOLDER=$(echo $line | awk -F " " '{print $NF}')
  if [ $USAGE -ge $DISK_THRESHOLD ]
  then
      MESSAGE+="$FOLDER is more than $DISk_THRESHOLD, current usage is:: $USAGE \n"
  fi
done <<<$DISK_USAGE
echo -e "message:: $MESSAGE"
echo -e "$MESSAGE | s-nail -s "DISk USAGE ALERT" nethra.sangeetham@gmail.com"      