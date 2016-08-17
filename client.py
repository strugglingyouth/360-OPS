#!/usr/bin/env python
# coding:utf-8

__author__ = 'tianfeiyu'

import socket


def recv_all(obj,msg_size):
    """
        循环接收数据
    """ 

    raw_result = ''
    while msg_size != 0:
        if msg_size <= 4096:
            data = obj.recv(4096)
            msg_size = 0
        else:
            data = obj.recv(4096)
            msg_size -= 4096

        raw_result += data
    return raw_result

def connect_server(host,port):
    c = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    c.connect((host,port))
    while True:
        user_input = raw_input('input cmd > ').strip()
        if len(user_input) ==  0:
            continue
        c.sendall(user_input)
        return_size = int(c.recv(1024))
        result = recv_all(c,return_size)
        print result

if __name__ == '__main__':
    host = '222.24.51.147'
    port = 50000
    connect_server(host,port)
    

