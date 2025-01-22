DROP DATABASE IF EXISTS tema4;
create database tema4;
use tema4;
CREATE TABLE clientes(
    dni VARCHAR(9) NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    apellido1 VARCHAR(60) NOT NULL,
    apellido2 VARCHAR(60) NOT NULL,
    domicilio VARCHAR(60) DEFAULT " CALLE ",
    telefono VARCHAR(9),
    provincia VARCHAR(60),
    saldo int
    );
    
##esto ya no entra en el examen de noviembre...
#insert into pub (cod_pub, nombre_pub) VALUES (19, Nano); así insertas solo en lo que quieres; sin el primer () hay que meter todo.

insert into clientes VALUES ("111111111", "Pedro", "Gutiérrez", "Crespo", DEFAULT, NULL, "Asturias", 2000);
insert into clientes (dni, nombre, apellido1, apellido2, provincia, saldo) VALUES ("222222222", "Maria", "Gutierrez", "Crespo", "Asturias", 35000);
insert into clientes (dni, nombre, apellido1, apellido2, provincia, saldo) VALUES ("333333333", "Cristina", "García", "Crespo","Sevilla", 45000);

update clientes set nombre="Catalina", apellido2="Alvarez" where nombre="Catalina"&& apellido2="Crespo";
update clientes set provincia="Principado de Asturias" where provincia="Asturias";
update clientes set saldo=saldo+300;
#update clientes set saldo=0 where dni="222222222";
alter table clientes add fecha_nacimiento DATE after apellido2;
update clientes set fecha_nacimiento=CURDATE();
update clientes set fecha_nacimiento=fecha_nacimiento+5;

select * from clientes;