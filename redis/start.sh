#!/bin/sh

#启动redis后台运行
redis-server /etc/redis.conf --daemonize yes

tail -f /dev/null
