Postgresql
---

### install on arch linux
```bash
$ sudo pacman -Syu
$ sudo pacman -S postgresql
$ sudo su postgres
[postgres]$ initdb --locale en_US.UTF-8 -D '/var/lib/postgres/data'
[postgres]$ exit
$ sudo systemctl start postgresql
$ sudo systemctl stop postgresql
```

### create user
```bash
CREATE USER [user-name] WITH PASSWORD [password]; # names containing '-' must be quoted by double quotes
```

### change owner of database
```bash
ALTER DATABASE [database_name] OWNER TO [user-name];
```

### show all users
```bash
\du
```

### Install on mac

- download from http://postgresapp.com/, follow instructions on the site.

### open/close postgres.app

- use spotlight to search for 'postgres', open it and an elephant icon should show in the menubar.
- to close, click on elephant icon and select 'quit'.

### add to .bash_profile

```bash
# Postgres
alias psql='/Applications/Postgres.app/Contents/Versions/9.3/bin'/psql -p5432
```

### navicat client

- download navicat premium trial, http://navicat.com/download

### connect to navicat

```
Connection Name: localhost
Host Name/IP Address: localhost
Port: 5432
User Name: <output you get when you type 'whoami' in bash>
```

### Install pg gem

- if having issues with 'gem install pg':
  - first find pg_config

    ```bash
      $ sudo find / -name pg_config
    ```

  - then try the following, substitute your pg_config location if it is different:

    ```bash
    $ gem install pg -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/9.3/bin/pg_config
    $ gem install pg -v '0.14.1' -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/9.3/bin/pg_config
    ```

### database.yml

```
common: &common
  adapter: postgresql
  host: localhost
  reconnect: true
  min_messages: warning
  prepared_statements: false

development:
  <<: *common
  database: <database_name>

test:
  <<: *common
  database: <database_name>
```

**\<database_name\> should be substituted with your corresponding database names**

### data types

| Data Type        | Description                                                |
|------------------|------------------------------------------------------------|
| SMALLINT         | signed two-byte integer                                    |
| INTEGER          | signed four-byte integer                                   |
| BIGINT           | signed eight-byte integer                                  |
| DECIMAL          | exact numeric of selectable precision                      |
| REAL             | single precision floating-point number                     |
| DOUBLE PRECISION | double precision floating-point number                     |
| BOOLEAN          | logical boolean (true/false)                               |
| CHAR             | fixed-length character string                              |
| VARCHAR          | variable-length character string with a user-defined limit |
| DATE             | calendar date (year, month, day)                           |
| TIMESTAMP        | date and time (without time zone)                          |


### postgres commands

| mysql               | postgres slash command  | long command |
|---------------------|-------------------------|--------------|
| show databases;     | \l                      | SELECT datname FROM pg_database;
| exit                | \q                      |
| use [database_name] | \c [database_name]      | The command to switch database does not exist in postgresql, the \c command kills the current connections and establishes a new connection.
| show tables;        | \d                      | SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';
| show columns;       | \d [table_name]         | SELECT column_name FROM information_schema.columns WHERE table_name ='table';
| desc [table_name]   | \d+ [table_name]        | SELECT column_name FROM information_schema.columns WHERE table_name ='table';
| show processlist    |                         | SELECT * FROM pg_stat_activity;

### create table
```sql
CREATE TABLE table_name(
   column1 datatype,
   column2 datatype,
   column3 datatype,
   .....
   columnN datatype,
   PRIMARY KEY( one or more columns )
);
```

### insert data into table
```sql
INSERT INTO TABLE_NAME (column1, column2, column3,...columnN)]
VALUES (value1, value2, value3,...valueN);
```

### delete row from table
```sql
DELETE FROM TABLE_NAME WHERE columnN = valueN;
```

### run sql file against specific database
```bash
$ psql -d [database_name] -a -f sequel_file.sql
```

### show databases size
```sql
select t1.datname AS db_name,
       pg_size_pretty(pg_database_size(t1.datname)) as db_size
from pg_database t1
order by pg_database_size(t1.datname) desc;
```

### show largest tables in database
```sql
SELECT relname AS "relation", pg_size_pretty(pg_relation_size(C.oid)) AS "size"
  FROM pg_class C LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace)
  WHERE nspname NOT IN ('pg_catalog', 'information_schema')
  ORDER BY pg_relation_size(C.oid) DESC
  LIMIT 10;
```

### export table as csv with header
```sql
COPY table_name TO '/path/to/file_name.csv' DELIMITER ',' CSV HEADER;
```

#### import csv to table with header
```sql
COPY table_name FROM '/path/to/file_name.csv' DELIMITER ',' CSV HEADER;
```
