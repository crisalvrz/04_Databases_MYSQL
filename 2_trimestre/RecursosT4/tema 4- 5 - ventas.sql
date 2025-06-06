DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas;
USE ventas;

CREATE TABLE cliente (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  ciudad VARCHAR(100),
  categoría INT UNSIGNED
);

CREATE TABLE comercial (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  comisión FLOAT
);

CREATE TABLE pedido (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  total DOUBLE NOT NULL,
  fecha DATE,
  id_cliente INT UNSIGNED NOT NULL,
  id_comercial INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id),
  FOREIGN KEY (id_comercial) REFERENCES comercial(id)
);

INSERT INTO cliente VALUES(1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100);
INSERT INTO cliente VALUES(2, 'Adela', 'Salas', 'Díaz', 'Granada', 200);
INSERT INTO cliente VALUES(3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL);
INSERT INTO cliente VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO cliente VALUES(5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200);
INSERT INTO cliente VALUES(6, 'María', 'Santana', 'Moreno', 'Cádiz', 100);
INSERT INTO cliente VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO cliente VALUES(8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200);
INSERT INTO cliente VALUES(9, 'Guillermo', 'López', 'Gómez', 'Granada', 225);
INSERT INTO cliente VALUES(10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);

INSERT INTO comercial VALUES(1, 'Daniel', 'Sáez', 'Vega', 0.15);
INSERT INTO comercial VALUES(2, 'Juan', 'Gómez', 'López', 0.13);
INSERT INTO comercial VALUES(3, 'Diego','Flores', 'Salas', 0.11);
INSERT INTO comercial VALUES(4, 'Marta','Herrera', 'Gil', 0.14);
INSERT INTO comercial VALUES(5, 'Antonio','Carretero', 'Ortega', 0.12);
INSERT INTO comercial VALUES(6, 'Manuel','Domínguez', 'Hernández', 0.13);
INSERT INTO comercial VALUES(7, 'Antonio','Vega', 'Hernández', 0.11);
INSERT INTO comercial VALUES(8, 'Alfredo','Ruiz', 'Flores', 0.05);

INSERT INTO pedido VALUES(1, 150.5, '2017-10-05', 5, 2);
INSERT INTO pedido VALUES(2, 270.65, '2016-09-10', 1, 5);
INSERT INTO pedido VALUES(3, 65.26, '2017-10-05', 2, 1);
INSERT INTO pedido VALUES(4, 110.5, '2016-08-17', 8, 3);
INSERT INTO pedido VALUES(5, 948.5, '2017-09-10', 5, 2);
INSERT INTO pedido VALUES(6, 2400.6, '2016-07-27', 7, 1);
INSERT INTO pedido VALUES(7, 5760, '2015-09-10', 2, 1);
INSERT INTO pedido VALUES(8, 1983.43, '2017-10-10', 4, 6);
INSERT INTO pedido VALUES(9, 2480.4, '2016-10-10', 8, 3);
INSERT INTO pedido VALUES(10, 250.45, '2015-06-27', 8, 2);
INSERT INTO pedido VALUES(11, 75.29, '2016-08-17', 3, 7);
INSERT INTO pedido VALUES(12, 3045.6, '2017-04-25', 2, 1);
INSERT INTO pedido VALUES(13, 545.75, '2019-01-25', 6, 1);
INSERT INTO pedido VALUES(14, 145.82, '2017-02-02', 6, 1);
INSERT INTO pedido VALUES(15, 370.85, '2019-03-11', 1, 5);
INSERT INTO pedido VALUES(16, 2389.23, '2019-03-11', 1, 5);

-- 1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados 
-- por la fecha de realización, mostrando en primer lugar los pedidos más recientes.

select *
from pedido
order by fecha desc, id desc;

-- 2. Devuelve todos los datos de los dos pedidos de mayor valor.

select *
from pedido
order by total desc
limit 2;


-- 3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. 
-- Tenga en cuenta que no debe mostrar identificadores que estén repetidos.

select distinct id_cliente
from pedido;

-- 4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, 
-- cuya cantidad total sea superior a 500€.

select *
from pedido
where fecha like '2017%' and total>500;

-- 5. Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre
-- 0.05 y 0.11.

select nombre, apellido1, apellido2
from comercial
where comisión>0.05 and comisión<0.11;

-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.

select comisión
from comercial
order by comisión desc
limit 1;

-- 7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido 
-- no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.

select id, nombre, apellido1, apellido2
from cliente
where apellido2 not like 'null';

-- 8. Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también
-- los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.

select nombre, apellido1
from cliente
where nombre like 'A%n' or nombre like 'P%'
order by apellido1, apellido2, nombre;

-- 9. Devuelve un listado de los nombres de los clientes que no empiezan por A. 
-- El listado deberá estar ordenado alfabéticamente.

select nombre
from cliente
where nombre not like 'A%'
order by nombre asc;

select nombre
from cliente
where not nombre like 'A%'
order by nombre asc;

-- 10. Devuelve un listado con los nombres de los comerciales que terminan por "el" u "o". 
-- Tenga en cuenta que se deberán eliminar los nombres repetidos.

select distinct nombre
from comercial
where nombre like '%el' or nombre like '%o';


-- 11. Muestra la columnaa password para cada cliente formada por los caracteres 3 y 4 del nombre y
-- de los apellidos y la categoria. Añade el campo en la tabla y almacenamiento.

alter table cliente
add contrasena VARCHAR(25);





SELECT CONCAT(SUBSTRING(nombre, 3, 2), 
              SUBSTRING(apellido1, 3, 2), 
              IF(apellido2 IS NULL OR apellido2 = '', 'XX', SUBSTRING(apellido2, 3, 2))) AS "contrasna con if"
FROM cliente;

SELECT CONCAT(SUBSTRING(nombre, 3, 2), 
              SUBSTRING(apellido1, 3, 2),
              substring(ifnull(apellido2, "xx"), 3,2),
              substring(ifnull(convert(categoría, char), 2,2), 00) as "contrasena con ifnull"
FROM cliente;


select *, 
concat(substr(nombre,3,2),
ifnull(substr(apellido1, 3, 2), "xx"),
ifnull(substr(apellido2, 3, 2), "xx"),
ifnull(substr(convert(categoría, char), 2, 2), "xx")) as "password"
from cliente;


UPDATE cliente 
SET contrasena = CONCAT(
    SUBSTR(nombre, 3, 2),
    IFNULL(SUBSTR(apellido1, 3, 2), 'XX'),
    IFNULL(SUBSTR(apellido2, 3, 2), 'XX'),
    IFNULL(SUBSTR(CONVERT(categoría, char), 2, 2), 'XX')
);


SELECT *
FROM cliente;



