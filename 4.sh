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


Year=$(date |awk '{print $6}')
Mon=$(date |awk '{print $2}')
Day=$(date |awk '{print $3}')

Yesterday=$((Day-1))
Logfile=${Year}-${Mon}-${Yesterday}.log

cat $Log| sed -n "/${Yesterday}\/${Mon}\/${Year}:00/,/${Day}\/${Mon}\/${Year}:00/p"  > $Logfile
