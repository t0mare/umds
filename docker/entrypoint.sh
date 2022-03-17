#!/bin/bash

while true;
do
    printf -v TIME "%(%H:%M)T\n" 
    echo $TIME
    if [ $TIME == $EXECTIME ]
    then
	cowsay Timer test | lolcat
    fi
    sleep 60s
done
