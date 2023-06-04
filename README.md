# MySQL Trigger

```bash
docker-compose up -d mysql
```

```bash
mysql -h 127.0.0.1 -P 3306 -u root -p
```

password : mysql

```bash
SET GLOBAL log_bin_trust_function_creators = 1;
```

```bash
docker-compose run migrate
```
