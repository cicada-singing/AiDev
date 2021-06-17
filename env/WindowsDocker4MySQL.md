[TOC]

# [MySQL](https://hub.docker.com/_/mysql) 

## mysql 5.7

```sh
docker run -dit --name test_mysql57 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 -v D:\\Work\\Docker\\test_mysql57\\conf:/etc/mysql/conf.d mysql:5.7
```

连接配置：

```yaml
hostname: localhost
port: 3306
username: root
password: 123456
```

