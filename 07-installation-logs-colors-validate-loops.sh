#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
Y="\e[32m"
G="\e[33m"
N="\e[0m"
echo "script started at:: $TIMESTAMP"
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $Y failed $N"
        exit 1
    else
        echo -e "$2 is $R success $N"    
    fi
}
if [ $USERID -ne 0 ]
then 
    echo "please run with root"
    exit 1
else 
    echo "you are root user"
fi

for i in $@
do
    echo "package need to install:: $i"
    dnf list installed $i &>>$LOGFILE
    if [ $? -eq 0 ]
    then
        echo -e "package is already installed.....$R skipping $N"
    else
        dnf install $i -y &>>LOGFILE
        VALIDATE $? "package installtion"
    fi
done        