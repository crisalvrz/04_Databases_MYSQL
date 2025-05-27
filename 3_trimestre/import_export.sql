create database test_import;
use test_import;
create table gente(
    nombre varchar(20),
    fecha_nacimiento date
    );
    
create table gente2(
    nombre varchar(20),
    fecha_nacimiento date);
    
insert into gente values ("fulano", "1965-04-03"),
                         ("Mengano", "1903-12-12");

select * from gente;

select * from gente2;

select * from gente limit 0, 1000
into outfile "C:\\Archivos de programa\\MySQL\\MySQL Server 5.1\\gente5.txt"
FIELDS terminated by ';'
OPTIONALLY ENCLOSED BY '\"'
LINES TERMINATED BY '\r\n'; -- en los apuntes viene mal \n\r

load data local infile "C:\\Archivos de programa\\MySQL\\MySQL Server 5.1\\gente5.txt"
into table gente2
fields terminated by ';'
optionally enclosed by '\"'
lines terminated by '\r\n'
-- ignore 2 lines
(nombre, fecha_nacimiento);

    