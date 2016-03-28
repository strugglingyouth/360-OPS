sshtunnel.sh 判断是否连接vpn，若没有连接，则会调用 ssh1.exp 连接vpn

## sshtunnel.sh

#!/bin/bash

while true;do

    ps aux | grep  ssh1.exp | grep -v grep

    if [ $? -ne 0 ];then
        /usr/bin/expect /root/shell/ssh1.exp
    fi

done



##  ssh1.exp 

#!/usr/bin/expect 
  
set port 22 
set user feilei  
set host 115.28.48.187  
set password feilei123  
set timeout -1  
  
set timeout -1

spawn ssh -4 -p $port $user@$host 
expect {
    "yes/no" { send "yes\r";exp_continue}
    "*password:*" {send "${password}\r";exp_continue}
    }
expect eof   
