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
    else
        echo -e "$2 is $R success $N"    
    fi
}

check_root(){
    if [ $USERID -ne 0 ]
    then 
        echo "please run with root"
        exit 1
    else 
        echo "you are root user"
    fi
}

set -e
HANDLE_ERROR(){
    echo "error at line::$1,error command::$2"
}

trap 'HANDLE_ERROR ${LINENO} "$BASH_COMMAND"' ERR