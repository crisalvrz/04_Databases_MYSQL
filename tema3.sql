drop database if exists tema3;
create database tema3;
use tema3;
show create database tema3;
USE tema3;
create table if not exists aula (cod int primary key, nombre varchar (10));
insert into aula values (1,'aa'), (2,'AA'), (3,'BB'), (4,'bb');

SHOW CHARACTER SET;
SHOW COLLATION; #cotejamiento; key sensitive= tiene en cuenta mays. o ci case insensitive.

SELECT * FROM aula order by nombre;
SELECT @@character_set_database, @@collation_database;
SHOW COLLATION LIKE 'utf8';
show databases;

delete from aula;
insert into aula values (1,'AA'), (2,'bb'), (3,'aa'), (4,'BB');
SELECT * FROM aula ORDER BY nombre COLLATE latin1_general_ci;
SELECT * FROM aula ORDER BY nombre COLLATE latin1_general_cs;
SELECT * FROM aula ORDER BY nombre COLLATE latin1_bin;
SELECT * FROM aula ORDER BY nombre;





