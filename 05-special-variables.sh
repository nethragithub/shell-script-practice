#!/bin/bash
echo "$@ ---- all variables"
echo "$# ----- No of varaiables passed"
echo "$0 ------ name of the script"
echo "$HOME ----- home dir of user"
echo "$USER --- user who ran script"
echo "$PWD --- present working directory"
echo "$HOSTNMAE --- server hostname"
sleep 60 &
echo "$$ ---- pid of current shell script"
echo "$! ---- pid of last background command"
echo "$? -- exit status of previous command"