#!/bin/bash
SCHEDULEDTIME="${SCHEDULEDTIME:-01:00}" #Default set to 01:00 if not set
/usr/local/vmware-umds/bin/vmware-umds -D #Run initial sync
while true;
do
    printf -v TIME "%(%H:%M)T\n" 
    if [ $TIME == $SCHEDULEDTIME ]
    then
	    /usr/local/vmware-umds/bin/vmware-umds -D
    fi
    sleep 60s
done