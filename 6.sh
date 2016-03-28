##cpu_info.sh

#!/bin/bash

save_file="/tmp/`date +%F`-cpuinfo"

cpuinfo=`top -bn 1 | grep "Cpu"`

if [ ! -e $save_file ] ;then
    cat << EOF >> $save_file
     注：
    us：用户态使用的cpu时间比
    sy：系统态使用的cpu时间比
    ni：用做nice加权的进程分配的用户态cpu时间比
    id：空闲的cpu时间比
    wa：cpu等待磁盘写入完成时间
    hi：硬中断消耗时间
    si：软中断消耗时间
    st：虚拟机偷取时间
EOF

    echo -e "\033[32m \t\t\t\t\t\tdate:`date +%F`\033[0m\n" >> $save_file
    echo -e "times:\t\tus:\t\tsy:\t\tni:\t\tid:\t\twa:\t\thi:\t\tsi:\t\tst:\t\n" >> $save_file
fi

us=$(echo $cpuinfo | awk '{print $2}')
sy=$(echo $cpuinfo | awk '{print $3}')
ni=$(echo $cpuinfo | awk '{print $4}')
id=$(echo $cpuinfo | awk '{print $5}')
wa=$(echo $cpuinfo | awk '{print $6}')
hi=$(echo $cpuinfo | awk '{print $7}')
si=$(echo $cpuinfo | awk '{print $8}')
st=$(echo $cpuinfo | awk '{print $9}')

hour=$(date +%H)
echo -e "${hour}\t\t${us}\t\t${sy}\t\t${ni}\t\t${id}\t${wa}\t\t${hi}\t\t${si}\t\t${st}" >> $save_file 
