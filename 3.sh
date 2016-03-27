#!/bin/bash

[ $UID -ne 0 ] && echo "please use root to excute!" 
[ -e /etc/init.d/functions ] && . /etc/init.d/functions || exit 

task_file=/var/spool/cron/root
crontabfile=$(mktemp)
crontab -l > $crontabfile

#delete blank line
sed -i '/^$/d' $crontabfile

line=$(cat $crontabfile | wc -l) 

crontab_list(){
    echo -e "\n\033[32m crontab as follows:\033[0m\n"
    cat -n $crontabfile 
}

#input the number of modify  
input_num(){
    while true;do
        echo -e "\n\033[32mplease input a task number:\033[0m\n" 
        read num
        if [ "$num" -lt 1 -o "$num" -gt "$line" ];then
            echo "input error!Please input again:"
            continue
        else
            break
        fi
    done
}

crontab_list
input_num

#operate task
while true;do

    read -p "please input to perform operations:[ stop | start | quit ] "  do

    case $do in
        quit|q):
            exit 
            ;;
        start):
            task=$(head -n $num $crontabfile | tail -n 1)
            echo "$task" | grep '^#' &> /dev/null

            if [ $? -eq 0 ];then
                sed -i "${num}s/^#//" $crontabfile
                cat "$crontabfile" > $task_file
                action "success!" /bin/true
                break
            else
                echo "This task is already start.Pleasse input again:"
            fi    
            
            ;;
        stop):
            task=$(head -n $num $crontabfile | tail -n 1)
            echo "$task" | grep '^[^#]' &> /dev/null
            if [ $? -eq 0 ];then
                sed -i "${num}s/^/#/" $crontabfile
                cat "$crontabfile" > $task_file
                action "success!" /bin/true
                break
            else
                echo "This task is already stop.Pleasse input again:"
            fi    
            ;;
        *):
            echo "Input is error! Please input again:"
            ;;
    esac
done
crontab_list
