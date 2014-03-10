# SQL

#### Commonly used commands

######ADD COLUMN
ALTER TABLE table_name ADD column_name column_type;

######DROP COLUMN
ALTER TABLE table_name DROP column_name;

######CHANGE COLUMN DATA TYPE
ALTER TABLE table_name MODIFY COLUMN column_name column_type;

ALTER TABLE targets MODIFY COLUMN address_similarity FLOAT;

######CHANGE COLUMN ORDERING
ALTER TABLE table_name MODIFY COLUMN column_name column_type AFTER another_column_name;

ALTER TABLE targets MODIFY COLUMN address_similarity FLOAT AFTER matched_address;

######ADD INDEX TO TABLE
ALTER TABLE table_name ADD INDEX index_name (column_name);

######GET ALL TABLE SIZES IN A DATABASE
SELECT table_name AS "Tables",
round(((data_length + index_length) / 1024 / 1024), 2) "Size in MB"
FROM information_schema.TABLES
WHERE table_schema = "TABLE_NAME"
ORDER BY (data_length + index_length) DESC;

######GET ALL DATABASE SIZES
SELECT table_schema                                        "DB Name",
   Round(Sum(data_length + index_length) / 1024 / 1024, 1) "DB Size in MB"
FROM   information_schema.tables
GROUP  BY table_schema;

#### mysql dumps

```bash
@server> mysqldump db_name table_name | gzip > ~/table_name.sql.gz

@local> scp root@server:~/table_name.sql.gz ~/local/directory/

@local> gunzip ~/table_name.sql.gz

@local> mysql -u root database_name < table_name.sql
```


#### show current status

- select version(); - shows mysql version
- select database(); - shows database used
- select user(); - shows user id
- select now();  - shows the current date and time
- show character set;

#### Data Types

- char(20) - fixed length, right-padded with spaces and consumes the same number of bytes
- varchar(20) - not right-padded with spaces and does not consume the same number of bytes
- varchar(20) character set utf8;
- create database foreign_sales character set utf8;
- Tinytext
- Text
- Mediumtext
- Largetext

- Tinyint
- Smallint
- Mediumint
- Int
- Bigint
- Float
- Double

- Date
- Datetime
- Timestamp
- Year
- Time

#### Table Creation

    CREATE TABLE person
    (person_id SMALLINT UNSIGNED,
    fname VARCHAR(20),
    lname VARCHAR(20),
    gender CHAR(1),
    birth_date DATE,
    street VARCHAR(30),
    city VARCHAR(20),
    state VARCHAR(20),
    country VARCHAR(20),
    postal_code VARCHAR(20),
    CONSTRAINT pk_person PRIMARY KEY (person_id)
    );

#### Describe Table

    DESC person;

#### Drop Table

    DROP TABLE person;

#### Constraints

    gender ENUM('M','F')
    CONSTRAINT pk_person PRIMARY KEY (person_id)

#### Insert Data

    INSERT INTO person
    (person_id, fname, lname, gender, birth_date)
    VALUES (null, 'William','Turner', 'M', '1972-05-27');

#### Updating Data

    UPDATE person
    SET street = '1225 Tremont St.',
    city = 'Boston', state = 'MA',
    country = 'USA', postal_code = '02138'
    WHERE person_id = 1;

#### Deleting Data

    DELETE FROM person WHERE person_id = 2;

#### Query Clauses

+ Select - Determines which columns to include in the query’s result set
+ From - Identifies the tables from which to draw data and how the tables should be joined
+ Where - Filters out unwanted data
+ Group by - Used to group rows together by common column values
+ Having - Filters out unwanted groups
+ Order by - Sorts the rows of the final result set by one or more columns

#### Column Aliases

    SELECT emp_id,
    'ACTIVE' status,
    emp_id * 3.14159 empid_x_pi, UPPER(lname) last_name_upper
    FROM employee;

###### Using 'As' keyword

    SELECT emp_id,
    'ACTIVE' AS status,
    emp_id * 3.14159 AS empid_x_pi, UPPER(lname) AS last_name_upper
    FROM employee;

#### Selecting Distinct records

    SELECT DISTINCT cust_id FROM account;


#### The 'From' Clause

+ The FROM clause defines the tables used by a query, along with the means of linking the tables together.

#### Tables (3 types)

+ Permanent tables (i.e., created using the create table statement)
+ Temporary tables (i.e., rows returned by a subquery)
+ Virtual tables (i.e., created using the create view statement)

#### Subqueries

    SELECT e.emp_id, e.fname, e.lname
    FROM (SELECT emp_id, fname, lname, start_date, title -> FROM employee) e;

#### Virtual Table

    CREATE VIEW employee_vw AS
    SELECT emp_id, fname, lname, -> YEAR(start_date) start_year -> FROM employee;

#### Table Aliases

    SELECT e.emp_id, e.fname, e.lname, d.name dept_name
    FROM employee e INNER JOIN department d ON e.dept_id = d.dept_id;

###### Using 'As' Keyword

    SELECT e.emp_id, e.fname, e.lname, d.name dept_name
    FROM employee AS e INNER JOIN department AS d ON e.dept_id = d.dept_id;

#### Where Clause

+ The where clause is the mechanism for filtering out unwanted rows from your result set.

    SELECT emp_id, fname, lname, start_date, title -> FROM employee
    WHERE title = 'Head Teller';

#### Order By Clause

+ The 'order by' clause is the mechanism for sorting your result set using either raw column data or expressions based on column data.

###### Sorting by Expression

    SELECT cust_id, cust_type_cd, city, state, ssn FROM customer
    ORDER BY RIGHT(ssn, 4);

###### Sort by columns by referencing column position

    SELECT emp_id, title, start_date, fname, lname FROM employee
    ORDER BY 2, 5;

#### Not Equal

    <>  or !=

#### Between conditional

    WHERE value between smaller_value and bigger_value;

#### Membership conditional

    WHERE product_cd IN ('CHK','SAV','CD','MM');

#### Matching conditional

    left
    right

#### Wildcards

    _ - exactly one character
    % - any number of characters (including 0)

    LIKE F% - string beginning with 'F'
    LIKE %g - string ending in 'g'
    LIKE ___-__-____ - string with hyphen at index 3 and 6 (SS# format)

#### NULL

+ An expression can be null, but it can never be equal to null.
+ Two nulls are never equal to each other.

    SELECT * FROM employees WHERE termination_date IS NULL;

####


