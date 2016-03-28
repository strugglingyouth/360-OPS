执行此脚本前，需要先进行公钥认证，先将本机的公钥复制到目标主机上

#!/bin/bash


#${!#}-->$#--->$$#
cmd=${!#}    
logfile=$(mktemp)

i=1
success=0
failed=0
for ip in $@;do 
    if [ $i -eq $# ];then
        break
    fi
    ssh $ip $cmd &> $logfile
    if [ $? -eq 0 ];then
        ((success++))
        echo -e "\n\033[32m $ip | success >> \033[0m \n"
        cat $logfile
    else
        ((failed++))
        echo -e "\n\033[31m $ip | failed >> \033[0m\n "
        cat $logfile
    fi
    ((i++))
done
echo -e "\n\033[32m success: $success || failed: $failed \033[0m"
