#!/bin/bash
source ./08-common.sh
check_root
dnf install mysql -y &>>LOGFILE
