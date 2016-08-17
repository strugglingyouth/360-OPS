#!/usr/bin/env python
# coding:utf-8
"""
    使用 socket 模拟 ssh 通道
"""

__author__ = 'tianfeiyu'

import SocketServer
import commands


class CommandSocketServer(SocketServer.BaseRequestHandler):
    """
        使用 socketserver 实现多线程
    """
    def handle(self):
        print "Got a new connect from:",self.client_address
        while True:
            cmd = self.request.recv(1024)
            if not cmd:
                print "lost connect:",self.client_address
                break
            print "from %s received: %s" %(self.client_address, cmd)
            cmd_result = commands.getstatusoutput(cmd)
            self.request.send(str(len(cmd_result[1])))
            self.request.sendall(cmd_result[1])

if __name__ == '__main__':
    host = '222.24.51.147'
    port = 50000
    s = SocketServer.ThreadingTCPServer((host,port), CommandSocketServer) 
    s.serve_forever()


