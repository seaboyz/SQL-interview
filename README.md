- [SQL](#sql)
      - [filter even](#filter-even)
      - [none duplecate](#none-duplecate)
      - [count](#count)
      - [order by, asc, desc, limit](#order-by-asc-desc-limit)
      - [SQL](#sql-1)
        - [structured query language](#structured-query-language)
        - [connect to database](#connect-to-database)
        - [change database](#change-database)
        - [create database](#create-database)
        - [drop database](#drop-database)
        - [create table](#create-table)
        - [reset query buffer](#reset-query-buffer)
        - [check table schema](#check-table-schema)
        - [create table with constraint](#create-table-with-constraint)
        - [check settings](#check-settings)
        - [insert](#insert)
        - [add column to schema](#add-column-to-schema)
        - [remove column from schema](#remove-column-from-schema)
        - [change coloumn type](#change-coloumn-type)
        - [change column constraint](#change-column-constraint)
        - [remove column constraint](#remove-column-constraint)
        - [only show empty table](#only-show-empty-table)
        - [all columns](#all-columns)
        - [insert data from .sql file](#insert-data-from-sql-file)
        - [select](#select)
        - [order by](#order-by)
        - [distinct](#distinct)
        - [where](#where)
        - [operator](#operator)
        - [offset/limit](#offsetlimit)
        - [fetch](#fetch)
        - [in](#in)
        - [between](#between)
        - [like and ilike](#like-and-ilike)
        - [having](#having)
        - [sum max min avg count](#sum-max-min-avg-count)
        - [`+ - * / ^ %`](#------)
        - [round](#round)
        - [as](#as)
        - [coalesce](#coalesce)
        - [nullif(if equal return null, else return the first value)](#nullifif-equal-return-null-else-return-the-first-value)
        - [date](#date)
        - [interval](#interval)
        - [extract](#extract)
        - [temporary table and age()](#temporary-table-and-age)
        - [primary key](#primary-key)
        - [drop constraint](#drop-constraint)
        - [add primary key](#add-primary-key)
        - [add unique constraint](#add-unique-constraint)
        - [primary key vs unique](#primary-key-vs-unique)
        - [check constraint](#check-constraint)
        - [delete](#delete)
        - [update](#update)
### Transaction
#### begin
#### commit
##### after begin a transaction, any query failed, when we commit, it will actually do a roll back instead of commit.
#### rollback

### ACID
#### atomicity
##### All or nothing
#### consistency
##### No constraint violation. Database contains consistent data.
#### isolation
##### Users (sessions) don't affect each other.
#### durability
##### Once data is committed, it is permanent.


# SQL
#### filter even
`select * from tbname`
`where mod(id, 2) = 2;`

#### none duplecate
`select DISTINCT name from dbname;`

#### count
`select count(city) - count(distinct(city))`
`from station;`

#### order by, asc, desc, limit

`select city, length(city)`
`from station`
`order by length(city) asc, city asc`
`limit 1;`

#### SQL
##### structured query language

##### connect to database
`psql -h localhost -p 5432 -U postgres -d dbname -c "select * from tbname;"`

##### change database
`\c database_name` 

##### create database
`create database dbname;`

##### drop database
`drop database dbname;`

##### create table
```sql
`create table tbname (
    id int,
    name varchar(20)
    );
```

##### reset query buffer
`\r`

##### check table schema
`\d table_name`

##### create table with constraint
```sql
create table person(
    id bigserial not null primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    age int not null,
    gender varchar(7) not null,
    date_of_birth date not null
)
```
##### check settings
```sql
\set
```

##### insert
  ```sql
  insert into person (
      first_name,
      last_name,
      gender,
      date_of_birth)
  values ('Anne', 'Smith', 'FEMALE', date '1988-01-09');
  ```

##### add column to schema
```sql
alter table person
add column email varchar(50) not null;
```

##### remove column from schema
```sql
alter table person
drop column email;
```

##### change coloumn type
```sql
alter table person
alter column email set data type varchar(100);
```

##### change column constraint
```sql
alter table person
alter column email set not null;
```

##### remove column constraint
```sql
alter table person
alter column email drop not null;
```

##### only show empty table
```sql
\dt
```

##### all columns
```sql
\?
```

##### insert data from .sql file
1. `comannd line to the file location`
2. `pwd`
3. copy the file path
4. `\i /Users/qianggao/Desktop/SQL/filename.sql`
```sql
\i filename.sql
```

##### select
```sql
select * from person;
```
```sql
select first_name, last_name from person;
```
```sql
select email from person;
```

##### order by
```sql
select * from person 
order by first_name asc;
```
```sql
select * from person
order by first_name desc;
```
```sql
select * from person
order by first_name asc, last_name desc;
```

##### distinct
```sql
select distinct country_of_birth from person
order by country_of_birth asc;
```

##### where
```sql
select * from person
where country_of_birth = 'China' or country_of_birth = 'USA';
```

##### operator
```sql
select * from person
where country_of_birth != 'China';
```

##### offset/limit
```sql
select * from person limit 10 offset 10;
```

<!-- equivlent to offset/limit -->
##### fetch
```sql
select * from person
offset 10
fetach 10 rows only;
```

##### in
```sql
select * from person
where country_of_birth in ('China', 'USA');
```

##### between
```sql
select * from person
where date_of_birth 
between date '1988-01-09' and date '1988-01-10';
```
##### like and ilike
```sql
select * from person
where email like '%@gmail.com';
```
```sql
select * from person
where email ilike '_______@%';
```
```sql
select * from person
where email ilike '%@google%';
```
```sql
select * from person
where country_of_birth ilike 'china';
```

##### having
```sql
select country_of_birth, count(*) from person
group by country_of_birth
having count(*) > 5
order by country_of_birth asc;
```

##### sum max min avg count
```sql
select max(price) from car;
```
```sql
select sum(price) from car;
```
```sql
select round(avg(price)) from car;
```
```sql
select make, model, max(price) from car
group by make
order by max(price) desc;
```
```sql
select sum(price) from car
where make = 'Ford' and model = 'Fiesta';
```
```sql
select sum(price) from car
group by make;
```

##### `+ - * / ^ %`
```sql
select 10 % 3;
```

##### round
```sql
select round(avg(price), 2);
```

##### as
```sql
select make, model, max(price) as max_price from car
group by make;
```

##### coalesce
```sql
select coalesce(email, 'no email');
```

##### nullif(if equal return null, else return the first value)
```sql
select max(price) / nullif(count(*), 0), make
from car
group by make;
```

##### date
```sql
select now()::date;
select now()::time;
select now()::timestamp;
select now()::timestamp with time zone;
select now()::timestamp with time zone at time zone 'UTC';
```

##### interval
```sql
select now() - interval '1 day';
select now() - interval '1 day' + interval '1 hour';
select now() - interval '1 day' + interval '1 hour' + interval '1 minute';
select now() - interval '1 day' + interval '1 hour' + interval '1 minute' + interval '1 second';
```

##### extract
```sql
select extract(year from now());
select extract(month from now());
select extract(day from now());
select extract(hour from now());
select extract(minute from now());
select extract(second from now());
```

##### temporary table and age()
```sql
create temporary table person_temp as select * from person;
alter table person_temp drop column email;
select *, age(now(), date_of_birth) from person_temp;
```

##### primary key
```sql
create table person(
    id bigserial not null primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    age int not null,
```

##### drop constraint
```sql
alter table person
drop constraint person_pkey;
insert into person (id,first_name, last_name, age)
values (1, 'Anne', 'Smith', 25);
insert into person (id,first_name, last_name, age)
values (1, 'John', 'Smith', 25);
--  without constraint, table will have duplicate rows with the same id
```

##### add primary key
```sql
alter table person
add primary key (id);
```

##### add unique constraint
```sql
alter table person
add constraint person_unique_email unique (email);
```
```sql
-- equivalent to the above, only different syntax and let sql name the constraint
alter table person
add unique (email);
```

##### primary key vs unique
* Primary Key is used to uniquely identify a row 
* a unique key is used to prevent duplicate values in a column

##### check constraint
```sql
alter table person
add constraint person_check_gender 
check (gender = 'Female' or gender = 'Male');
```

##### delete
<!-- use primary key only -->
<!-- never use other field -->
* delete all
```sql
delete from person;
```

##### update
```sql
update person set email='Edsel@gmail.com' where first_name='Edsel';
```
```sql
update person set
first_name = 'Edsel',
last_name = 'Smith',
where first_name = 'Edsel';
```



    

  










