FROM alpine:latest
LABEL author=gedongdong2010@163.com

# apk国内镜像
# 备份原始文件
RUN cp /etc/apk/repositories /etc/apk/repositories.bak

# 修改为国内镜像源
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

# nginx安装
RUN apk update && apk add --no-cache nginx

# 目录准备
RUN mkdir -p /run/nginx && mkdir -p /shell

# 外部文件
COPY conf/* /etc/nginx/conf.d/
COPY cert/* /etc/nginx/
COPY start.sh /shell
RUN chmod -R 777 /shell

# php7及扩展
RUN apk add --no-cache php7-fpm php7-common php7-pdo php7-pdo_mysql php7-mysqli php7-curl php7-gd php7-mcrypt php7-openssl php7-json php7-pear php7-phar php7-ctype php7-zip php7-zlib php7-iconv php7-redis php7-tokenizer php7-mbstring php7-xml php7-dom

# composer
RUN php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer && \
    composer config -g repo.packagist composer https://packagist.phpcomposer.com

#开放端口
EXPOSE 80 443

# 启动
CMD ["/shell/start.sh"]
