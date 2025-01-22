show databases;

create database asirl_2024;

drop database if exists asirl_2023;
create database asirl_2023;
use asirl_2024;
create table t (c CHAR(3));
insert into t values ('AAA'),('bbb'),('aaa'),('BBB');

select * from t;
