#!/bin/bash
source ./08-common.sh
check_root
dnf install nano -y &>>LOGFILE
