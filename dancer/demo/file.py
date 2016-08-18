#!/usr/bin/env python
# coding:utf-8

import commands


def file_details():
    """
        返回文件与对应的时间戳
    """

    result = commands.getoutput("ls -l /tmp | awk '{print $6,$7,$8,$9}'")
    result = result.split('\n')
    file_list = {}

    for line in result:
        if len(line.strip()):
            line = line.split()
            file_time = line[0] + ' ' + line[1] + ' ' + line[2]
            file_name = line[3]
            file_list[file_name] = file_time

    for key,value in file_list.items():
        print key,value
    return file_list

if __name__ == '__main__':
    file_details()





