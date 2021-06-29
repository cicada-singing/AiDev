[TOC]

# [PostgreSQL](https://hub.docker.com/_/postgres) 

## PostgreSQL 10

```sh
docker run -dit --name test_postgres10 -p 5432:5432 -e POSTGRES_PASSWORD=123456 -v D:\\Work\\Docker\\test_mysql57\\data:/var/lib/postgresql/data postgres:10
```

连接配置：

```yaml
hostname: localhost
port: 5432
username: postgres
password: 123456
```

