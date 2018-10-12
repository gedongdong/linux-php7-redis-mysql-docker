# nginx-php7-mysql5.7 docker-compose

包含内容如下：

* alpine v3.8
* nginx v1.14.0
* php v7.2.10
* mysql v5.7
* redis v4.0.11

# 构建及运行方式

```
#根据 docker-compose.yml 文件构建docker镜像
docker-compose build
```

```
#拉起docker-compose相关编排镜像，注意相关端口，保证80、443、3306、6379端口没有被占用
docker-compose up -d
```

# 其它操作

* 停止：docker-compose stop
* 启动：docker-compose start
* 重启：docker-compose restart
* 删除：docker-compose rm

# 目录说明

* /Users/tal/web：本地物理路径，映射到docker中的/var/www/目录，web项目存放在此目录
* /Users/tal/mysql-data：本地物理路径，映射到docker中的/var/lib/mysql/目录，mysql的数据目录存放于此

# 其它说明

nginx主docker连接redis和mysql时，直接使用redis和mysql这两个名称即可，mysql的root密码是root，redis无密码，如：

```
mysql -h mysql -u root -p
redis-cli -h redis
```
