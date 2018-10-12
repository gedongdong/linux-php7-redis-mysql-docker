#!/bin/sh

#root启动php-fpm
php-fpm7 -R

#启动nginx
nginx -c /etc/nginx/nginx.conf

tail -f /dev/null
