#!/bin/bash
DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5
MESSAGE=" "
while IFS=read -r line
do
  USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -F1)
  FOLDER=$(echo $line | awk -F " " '{print $NF}')
  if [ $USAGE -ge $DISK_THRESHOLD ]
  then
      MESSAGE+= "$FOLDER is more than $DISk_THRESHOLD, current usage is:: $USAGE \n"
  fi
done <<<$DISK_USAGE
echo -e "MESSAGE:: $MESSAGE"
echo -e "$MESSAGE / s-nail -s "DISk_USAGE ALERT" nethra.sangeetham@gmail.com"      