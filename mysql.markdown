mysql notes
---

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
