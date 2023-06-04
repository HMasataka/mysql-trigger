# MySQL Trigger

## MySQL の起動

```bash
docker-compose up -d mysql
```

## 関数作成のためのセキュリティ設定

```bash
mysql -h 127.0.0.1 -P 3306 -u root -p
```

password : mysql

```bash
SET GLOBAL log_bin_trust_function_creators = 1;
```

## マイグレート

```bash
docker-compose run migrate
```
