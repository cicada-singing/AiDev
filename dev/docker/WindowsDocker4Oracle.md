[TOC]

# Oracle

## [loliconneko/oracle-ee-11g](https://hub.docker.com/r/loliconneko/oracle-ee-11g) 

```sh
docker run -dit --name test_oracle-ee-11g -p 8080:8080 -p 1521:1521 -e DBCA_TOTAL_MEMORY=1024 -v D:\\Work\\Docker\\test_oracle-ee-11g:/u01/app/oracle loliconneko/oracle-ee-11g
```

连接配置：

```yaml
hostname: localhost
port: 1521
sid: EE
service name: EE.oracle.docker
username: system
password: oracle
```

