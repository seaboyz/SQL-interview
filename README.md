# SQL
#### filter even
`select * from dbname`
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
