#!/bin/bash

LANG=en_US

Usage() {
        echo "Usage: $0 Logfile"
}

if [ $# -eq 0 ] ;then
    Usage
    exit 0
else
    Log=$1
fi



cat $Log | while read line;do
    Year=$(echo $line | awk '{print $4}'| awk -F '/' '{print $3}' |awk -F ':' '{print $1}')
    Month=$(echo $line | awk '{print $4}'| awk -F '/' '{print $2}')
    Day=$(echo $line | awk '{print $4}'| awk -F '/' '{print $1}' | sed 's/\[//')
    echo $line >> /tmp/log/${Year}-${Month}-${Day}
done
