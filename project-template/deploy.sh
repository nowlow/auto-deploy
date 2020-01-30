#!/bin/bash

path_to=./mySuperProject/

do_to_launch()
{
    # actions required to launch your project
    #       ex: npm install ; npm start
}

export LAST_PID=`cat last_pid.txt`
echo "LAST_PID = $LAST_PID"
if [ ! -z $LAST_PID ]
then
    echo "Web server was started"
    kill $LAST_PID
fi

cd $path_to

git reset --hard
git pull

nohup do_to_launch > ./logs.txt &

cd -

export LAST_PID=$!
echo $LAST_PID > last_pid.txt