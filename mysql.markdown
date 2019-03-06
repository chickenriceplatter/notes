mysql 笔记
---

### select * and export as csv ( select * 和 导出csv文件 )
```sql
SELECT *
FROM <table_name>
INTO OUTFILE 'file_name.ext'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
```

### print out table size in mb ( 打印表的大小 mb 单位 )
```sql
SELECT table_name AS "Table",
round(((data_length + index_length) / 1024 / 1024), 2) "Size in MB"
FROM information_schema.TABLES
WHERE table_schema = "$DB_NAME"
AND table_name = "$TABLE_NAME";
```

### dump database

    $ mysqldump -uroot database_name | gzip > ~/database_name.sql.gz

### dump table

    $ mysqldump -uroot database_name table_name | gzip > ~/table_name.sql.gz

### load database

    $ mysql -uroot database_name < database_name.sql

### grant access

    $ GRANT ALL ON [database_name].* TO `[username]`@`localhost` IDENTIFIED BY '[password]';
    $ GRANT CREATE TEMPORARY TABLES ON [database_name].* TO `[username]`@`localhost`;

### show grants

    $ show grants for `[username]`@`localhost`;

### delete user

    $ DROP USER '[username]'@'localhost';

### show all users

    $ SELECT User FROM mysql.user;
    $ select user from mysql.db where db='[database_name]';

### show current user

    $ select current_user();

### show data store location

    mysql> show variables where Variable_name ='datadir';
