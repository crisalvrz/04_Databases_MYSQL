DROP DATABASE IF EXISTS empleados;
CREATE DATABASE empleados;
USE empleados;

CREATE TABLE departamento (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  presupuesto DOUBLE UNSIGNED NOT NULL,
  gastos DOUBLE UNSIGNED NOT NULL
);

CREATE TABLE empleado (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nif VARCHAR(9) NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  id_departamento INT UNSIGNED,
  FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);

--  Consultas sobre una tabla
-- ------------------------------------------------------------------
-- soluciones: https://github.com/JuanmaFranco/Ejercicios-SQL/blob/main/ejercicios/empleados.MD 

-- 1.- Lista el primer apellido de todos los empleados.
select apellido1
from empleado;

-- 2.- Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
select apellido1
from empleado
where apellido1;


-- 3.-Lista todas las columnas de la tabla empleado.



-- 4.- Lista el nombre y los apellidos de todos los empleados.



-- 5.- Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado.



-- 6.- Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado, 
-- eliminando los identificadores que aparecen repetidos.



-- 7.- Lista el nombre y apellidos de los empleados en una única columna.



-- 8.- Lista el nombre y apellidos de los empleados en una única columna, convirtiendo 
-- todos los caracteres en mayúscula.




-- 9.- Lista el nombre y apellidos de los empleados en una única columna, convirtiendo 
-- todos los caracteres en minúscula.




-- 10.- Lista el identificador de los empleados junto al nif, pero el nif deberá aparecer
-- en dos columnas, una mostrará únicamente los dígitos del nif y la otra la letra.




-- 11.- Lista el nombre de cada departamento y el valor del presupuesto actual 
-- del que dispone. Para calcular este dato tendrá que restar al valor del 
-- presupuesto inicial (columna presupuesto) los gastos que se han generado (columna gastos). 
-- Tenga en cuenta que en algunos casos pueden existir valores negativos. 
-- Utilice un alias apropiado para la nueva columna columna que está calculando.




-- 12.- Lista el nombre de los departamentos y el valor del presupuesto 
-- actual ordenado de forma ascendente.




-- 13.- Lista el nombre de todos los departamentos ordenados de forma ascendente.




-- 14.- Lista el nombre de todos los departamentos ordenados de forma desscendente.




-- 15.- Lista los apellidos y el nombre de todos los empleados, ordenados 
-- de forma alfabética tendiendo en cuenta en primer lugar sus 
-- apellidos y luego su nombre.




-- 16.- Devuelve una lista con el nombre y el presupuesto, 
-- de los 3 departamentos que tienen mayor presupuesto.




-- 17.- Devuelve una lista con el nombre y el presupuesto, 
-- de los 3 departamentos que tienen menor presupuesto.




-- 18.- Devuelve una lista con el nombre y el gasto, de los 
-- 2 departamentos que tienen mayor gasto.




-- 19.- Devuelve una lista con el nombre y el gasto, de los 
-- 2 departamentos que tienen menor gasto.




-- 20.- Devuelve una lista con 5 filas a partir de la tercera 
-- fila de la tabla empleado. La tercera fila se debe incluir en la respuesta.
-- La respuesta debe incluir todas las columnas de la tabla empleado.




-- 21.- Devuelve una lista con el nombre de los departamentos y 
-- el presupuesto, de aquellos que tienen un presupuesto mayor o 
-- igual a 150000 euros.




-- 22.- Devuelve una lista con el nombre de los departamentos y el gasto, 
-- de aquellos que tienen menos de 5000 euros de gastos.




-- 23.- Devuelve una lista con el nombre de los departamentos y el 
-- presupesto, de aquellos que tienen un presupuesto entre 100000 
-- y 200000 euros. Sin utilizar el operador BETWEEN.




-- 24.- Devuelve una lista con el nombre de los departamentos que 
-- no tienen un presupuesto entre 100000 y 200000 euros. 
-- Sin utilizar el operador BETWEEN.




-- 25.- Devuelve una lista con el nombre de los departamentos que 
-- tienen un presupuesto entre 100000 y 200000 euros. 
-- Utilizando el operador BETWEEN.




-- 26.- Devuelve una lista con el nombre de los departamentos que 
-- no tienen un presupuesto entre 100000 y 200000 euros. 
-- Utilizando el operador BETWEEN.




-- 27.- Devuelve una lista con el nombre de los departamentos, 
-- gastos y presupuesto, de quellos departamentos donde los gastos 
-- sean mayores que el presupuesto del que disponen.




-- 28.- Devuelve una lista con el nombre de los departamentos, gastos 
-- y presupuesto, de aquellos departamentos donde los gastos sean menores 
-- que el presupuesto del que disponen.




-- 29.- Devuelve una lista con el nombre de los departamentos, gastos 
-- y presupuesto, de aquellos departamentos donde los gastos sean iguales
-- al presupuesto del que disponen.




-- 30.- Lista todos los datos de los empleados cuyo segundo apellido sea NULL.




-- 31.- Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.




-- 32.- Lista todos los datos de los empleados cuyo segundo apellido sea López.




-- 33.- Lista todos los datos de los empleados cuyo segundo apellido sea 
-- Díaz o Moreno. Sin utilizar el operador IN.




-- 34.- Lista todos los datos de los empleados cuyo segundo apellido sea 
-- Díaz o Moreno. Utilizando el operador IN.




-- 35.- Lista los nombres, apellidos y nif de los empleados que trabajan 
-- en el departamento 3.




-- 36.- Lista los nombres, apellidos y nif de los empleados que trabajan en 
-- los departamentos 2, 4 o 5.

SELECT e.nombre, e.apellido1, e.apellido2, e.nif
FROM empleado e
WHERE e.codigo_departamento IN (2, 4, 5);


-- Consultas multitabla (Composición interna)
-- Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2. EMPEZAMOS AQUÍ 18/3
-- ---------------------------------------------------------------------

-- 1.- Devuelve un listado con los empleados y los datos de los 
-- departamentos donde trabaja cada uno.

select *
from empleado e inner join departamento d
on e.id_departamento=d.id;


-- 2.- Devuelve un listado con los empleados y los datos de los departamentos 
-- donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre 
-- del departamento (en orden alfabético) y en segundo lugar por los apellidos
-- y el nombre de los empleados.

select *
from empleado e inner join departamento d
on e.id_departamento=d.id
order by d.nombre, e.apellido1, e.apellido2, e.nombre asc;

-- 3.- Devuelve un listado con el identificador y el nombre del departamento, 
-- solamente de aquellos departamentos que tienen empleados.
select distinct d.id, d.nombre
from departamento d inner join empleado e
on e.id_departamento=d.id;


-- 4.- Devuelve un listado con el identificador, el nombre del departamento y 
-- el valor del presupuesto actual del que dispone, solamente de aquellos 
-- departamentos que tienen empleados. El valor del presupuesto actual lo puede
-- calcular restando al valor del presupuesto inicial (columna presupuesto) 
-- el valor de los gastos que ha generado (columna gastos).

select distinct d.id, d.nombre, (d.presupuesto - d.gastos) as presupuesto_actual
from departamento d inner join empleado e
on d.id=e.id_departamento;


-- 5.- Devuelve el nombre del departamento donde trabaja el empleado que 
-- tiene el nif 38382980M.

select d.nombre
from departamento d inner join empleado e
on e.id_departamento=d.id
where e.nif = "38382980M";

-- sql1
select d.nombre
from departamento d, empleado e
where d.id= e.id_departamento
and e.nif="38382980M";


-- 6.- Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
select d.nombre
from departamento d inner join empleado e
on e.id_departamento=d.id
where e.nombre="Pepe" and e.apellido1="Ruiz" and e.apellido2="Santana";



-- 7.- Devuelve un listado con los datos de los empleados que trabajan en 
-- el departamento de I+D. Ordena el resultado alfabéticamente.
SELECT e.nombre, e.apellido1, e.apellido2, e.nif
FROM departamento d INNER JOIN empleado e ON d.codigo = e.codigo_departamento
WHERE d.nombre = 'I+D';



-- 8.- Devuelve un listado con los datos de los empleados que trabajan en 
-- el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.

SELECT e.nombre, e.apellido1, e.apellido2, e.nif
FROM departamento d INNER JOIN empleado e ON d.codigo = e.codigo_departamento
WHERE d.nombre IN ('Sistemas', 'Contabilidad', 'I+D')
ORDER BY 2 ASC, 3 ASC, 1 ASC;


-- 9.- Devuelve una lista con el nombre de los empleados que tienen los 
-- departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
SELECT e.nombre, e.apellido1, e.apellido2, e.nif
FROM departamento d INNER JOIN empleado e ON d.codigo = e.codigo_departamento
WHERE d.presupuesto NOT BETWEEN 100000 AND 200000;



-- 10.- Devuelve un listado con el nombre de los departamentos donde existe
-- algún empleado cuyo segundo apellido sea NULL. Tenga en cuenta que no debe 
-- mostrar nombres de departamentos que estén repetidos.

SELECT d.nombre
FROM empleado e INNER JOIN departamento d ON d.codigo = e.codigo_departamento
WHERE e.apellido2 IS NULL ;



-- Consultas multitabla (Composición externa)
-- Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
-- --------------------------------------------------------------------------------


-- 1.- Devuelve un listado con todos los empleados junto con los datos 
-- de los departamentos donde trabajan. Este listado también debe incluir 
-- los empleados que no tienen ningún departamento asociado.

SELECT e.nombre, e.apellido1, e.apellido2, e.nif, d.nombre, d.presupuesto, d.gastos
FROM empleado e LEFT JOIN departamento d ON e.codigo_departamento = d.codigo;


-- 2.- Devuelve un listado donde sólo aparezcan aquellos empleados que 
-- no tienen ningún departamento asociado.

SELECT e.nombre, e.apellido1, e.apellido2, e.nif, d.nombre, d.presupuesto, d.gastos
FROM empleado e LEFT JOIN departamento d ON e.codigo_departamento = d.codigo
WHERE e.codigo_departamento IS NULL;


-- 3.- Devuelve un listado donde sólo aparezcan aquellos departamentos 
-- que no tienen ningún empleado asociado.

SELECT d.nombre
FROM empleado e RIGHT JOIN departamento d ON e.codigo_departamento = d.codigo
WHERE e.codigo IS NULL;


-- 4.- Devuelve un listado con todos los empleados junto con los datos 
-- de los departamentos donde trabajan. El listado debe incluir los 
-- empleados que no tienen ningún departamento asociado y los departamentos 
-- que no tienen ningún empleado asociado. Ordene el listado alfabéticamente 
-- por el nombre del departamento.

SELECT *
FROM empleado e RIGHT JOIN departamento d ON e.codigo_departamento = d.codigo
ORDER BY d.nombre ASC;


-- 5.- Devuelve un listado con los empleados que no tienen ningún departamento 
-- asociado y los departamentos que no tienen ningún empleado asociado. 
-- Ordene el listado alfabéticamente por el nombre del departamento.
SELECT d.nombre
FROM empleado e RIGHT JOIN departamento d ON e.codigo_departamento = d.codigo
WHERE e.codigo_departamento IS NULL
UNION 
SELECT CONCAT(e2.nombre, ' ', e2.apellido1, ' ', e2.apellido2) AS Nombre
FROM empleado e2 LEFT JOIN departamento d2 ON e2.codigo_departamento = d2.codigo
WHERE e2.codigo_departamento IS NULL
ORDER BY nombre ASC;



-- Consultas resumen
-- -----------------------------------------------------------------------------------

-- 1.- Calcula la suma del presupuesto de todos los departamentos.

SELECT SUM(d.presupuesto) AS 'Suma'
FROM departamento d;


-- 2.- Calcula la media del presupuesto de todos los departamentos.

SELECT AVG(d.presupuesto) AS 'Promedio'
FROM departamento d;


-- 3.- Calcula el valor mínimo del presupuesto de todos los departamentos.

SELECT MIN(d.presupuesto) AS 'Presupuesto mínimo'
FROM departamento d;


-- 4.- Calcula el nombre del departamento y el presupuesto que tiene 
-- asignado, del departamento con menor presupuesto.

SELECT d.nombre, MIN(d.presupuesto) AS 'Presupuesto mínimo'
FROM departamento d;


-- 5.- Calcula el valor máximo del presupuesto de todos los departamentos.
SELECT MAX(d.presupuesto) AS 'Presupuesto máximo'
FROM departamento d; 



-- 6.- Calcula el nombre del departamento y el presupuesto que tiene 
-- asignado, del departamento con mayor presupuesto.

SELECT d.nombre, MAX(d.presupuesto) AS 'Presupuesto máximo'
FROM departamento d;


-- 7.- Calcula el número total de empleados que hay en la tabla empleado.
SELECT COUNT(*) 
FROM empleado e;



-- 8.- Calcula el número de empleados que no tienen NULL en su segundo apellido.

SELECT COUNT(*) 
FROM empleado e
WHERE e.apellido2 IS NOT NULL;


-- 9.- Calcula el número de empleados que hay en cada departamento. 
-- Tienes que devolver dos columnas, una con el nombre del departamento 
-- y otra con el número de empleados que tiene asignados.
SELECT d.nombre, COUNT(*) AS 'Cantidad'
FROM empleado e INNER JOIN departamento d ON e.codigo_departamento = d.codigo
GROUP BY d.nombre;



-- 10.- Calcula el nombre de los departamentos que tienen más de 2 
-- empleados. El resultado debe tener dos columnas, una con el nombre 
-- del departamento y otra con el número de empleados que tiene asignados.
SELECT d.nombre, COUNT(*) AS 'Cantidad'
FROM empleado e INNER JOIN departamento d ON e.codigo_departamento = d.codigo
GROUP BY d.nombre
HAVING Cantidad > 2;



-- 11.- Calcula el número de empleados que trabajan en cada uno de los 
-- departamentos. El resultado de esta consulta también tiene que incluir 
-- aquellos departamentos que no tienen ningún empleado asociado.
select d.nombre, count(e.nombre) from departamento d
left join empleado e on d.id=e.id_departamento
group by d.nombre;



-- 12.- Calcula el número de empleados que trabajan en cada unos de los 
-- departamentos que tienen un presupuesto mayor a 200000 euros.

select d.nombre, count(e.nombre), d.presupuesto from departamento d
left join empleado  e on d.id=e.id_departamento
where d.presupuesto > 200000
group by d.nombre;
