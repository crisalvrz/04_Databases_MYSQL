DROP DATABASE IF EXISTS empresa;
CREATE DATABASE empresa;
USE empresa;
CREATE TABLE departamento (
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE NOT NULL
);
CREATE TABLE empleado (
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
dni     VARCHAR(9)   NOT NULL,
nombre    VARCHAR(60)  NOT NULL,
apellido1 VARCHAR(60)  NOT NULL,
apellido2 VARCHAR(60)  NOT NULL,
codigo_departamento INT UNSIGNED NOT NULL,
FOREIGN KEY (codigo_departamento) REFERENCES departamento(codigo)
);

insert into departamento values (1,'Desarrollo',120000);
insert into departamento values (2,'Sistemas',150000);
insert into departamento values (3,'Recursos Humanos',280000);

insert into empleado values (1,'32481596F','Aarón','Rivero','Gómez',1);
insert into empleado values (2,'Y5575632D','Adela','Salas','Díaz',2); 
insert into empleado values (3,'R6970642B','Adolfo','Rubio','Flores',3);