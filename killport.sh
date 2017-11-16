#!/usr/bin/env bash

for port in $@
do
    pid=$(ss -lptn "sport = :$port" | sed -n '2 p' | awk -F "=" '{print $2}' | awk -F "," '{print $1}')
    if [ -z "$pid" ]
    then
        echo "port $port is free"
    else
        kill $pid
        echo "port $port process $pid killed"
    fi
done
