Postgres
---

### Install

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

| mysql               | postgres           |
|---------------------|--------------------|
| show databases;     | \l                 |
| exit                | \q                 |
| use [database_name] | \c [database_name] |
| show tables;        | \d                 |
| desc [table_name]   | \d+ [table_name]   |

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


