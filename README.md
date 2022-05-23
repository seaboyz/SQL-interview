### Transaction
#### begin
#### commit
* after begin a transaction, any query failed, when we commit, it will actually do a roll back instead of commit.
#### rollback

### ACID
#### atomicity
* All or nothing
#### consistency
* No constraint violation. Database contains consistent data.
#### isolation
* Users (sessions) don't affect each other.
#### durability
* Once data is committed, it is permanent.


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
* structured query language

* connect to database
`psql -h localhost -p 5432 -U postgres -d dbname -c "select * from tbname;"`

* change database
`\c database_name` 

* create database
`create database dbname;`

* drop database
`drop database dbname;`

* create table
```sql
`create table tbname (
    id int,
    name varchar(20)
    );
```

* reset query buffer
`\r`

* check table schema
`\d table_name`

* create table with constraint
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
* check settings
```sql
\set
```

* insert
  ```sql
  insert into person (
      first_name,
      last_name,
      gender,
      date_of_birth)
  values ('Anne', 'Smith', 'FEMALE', date '1988-01-09');
  ```

* add column to schema
```sql
alter table person
add column email varchar(50) not null;
```

* remove column from schema
```sql
alter table person
drop column email;
```

* change coloumn type
```sql
alter table person
alter column email set data type varchar(100);
```

* change column constraint
```sql
alter table person
alter column email set not null;
```

* remove column constraint
```sql
alter table person
alter column email drop not null;
```

* only show empty table
```sql
\dt
```

* all columns
```sql
\?
```

* insert data from .sql file
1. `comannd line to the file location`
2. `pwd`
3. copy the file path
4. `\i /Users/qianggao/Desktop/SQL/filename.sql`
```sql
\i filename.sql
```
    

  










