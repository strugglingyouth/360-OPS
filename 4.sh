#!/bin/bash

LANG=en_US
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
    Day=$(echo $line | awk '{print $4}'| awk -F '/' '{print $1}' | awk -F '[' '{print $2}')
    echo $line >> /tmp/log2/${Year}-${Month}-${Day}
done


shell 改进版：


#!/bin/bash
 
Usage(){
    echo "Usage: -bash Logfile"
}
         
if [ 0 -eq 0 ] ;then
    Usage
    exit 0
else
    Log=
fi
 
date_log=/tmp/tmp.iOL3hbCEwu
 
cat  |awk -F'[ :]' '{print }'|awk -F'[' '{print }'|uniq > date_log
 
for i in 
do
grep   > /tmp/log/--.access
 
done
 
rm -f date_log





下面是python多线程版本的：

#!/usr/bin/env python
# coding=utf-8

import threading 
import re


pattern = re.compile(r'.*\[(\d+)\/(\w+)\/(\d+)\:.*')
#pattern = re.compile('.*\[([0-9]+)\/([a-zA-Z]+)\/([0-9]+)\:.*')

def parse_log(file_line):
    resu = pattern.match(file_line)
    day,month,year = resu.groups()
    
    with open('/tmp/log/%s-%s-%s' %(year,month,day),'a') as f:
        f.write(file_line)

if __name__ == '__main__':
    with open('/tmp/access.log') as f:
        for line in f: 
            log_cut_thread = threading.Thread(target=parse_log,args=(line,))
            log_cut_thread.setDaemon(1)
            log_cut_thread.start()



python 奇技淫巧：


#!/usr/bin/env python
# coding=utf-8
 
import threading 
import re
from multiprocessing.dummy import Pool as ThreadPool
 
pattern = re.compile(r'.*\[(\d+)\/(\w+)\/(\d+)\:.*')
 
def parse_log(file_line):
    resu = pattern.match(file_line)
    day,month,year = resu.groups()
    
    with open('/tmp/log/%s-%s-%s' %(year,month,day),'a') as f:
        f.write(file_line)
 
if __name__ == '__main__':
    pool = ThreadPool(4)
    with open('/tmp/access.log') as f:
           pool.map(parse_log,f)
