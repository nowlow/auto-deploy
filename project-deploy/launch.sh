#!/bin/bash
export SERVER_PID=`cat last_pid.txt`
if [ ! -z $SERVER_PID ]
then
    echo "Server was started on pid : $SERVER_PID"
    kill $SERVER_PID
fi
nohup node server.js &
export SERVER_PID=$!
echo $SERVER_PID > last_pid.txt
echo "Launched server [$SERVER_PID]"
