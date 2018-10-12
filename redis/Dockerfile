FROM alpine:latest
LABEL author=gedongdong2010@163.com

# apk国内镜像
# 备份原始文件
RUN cp /etc/apk/repositories /etc/apk/repositories.bak

# 修改为国内镜像源
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

# 目录准备
RUN mkdir -p /shell

# 外部文件
COPY start.sh /shell
RUN chmod -R 777 /shell

# redis
RUN apk update
RUN apk add --no-cache redis
RUN sed -i "s|protected-mode yes|protected-mode no|" /etc/redis.conf
RUN sed -i "s|bind 127.0.0.1|# bind 127.0.0.1|" /etc/redis.conf

#开放端口
EXPOSE 6379

# 启动
CMD ["/shell/start.sh"]
