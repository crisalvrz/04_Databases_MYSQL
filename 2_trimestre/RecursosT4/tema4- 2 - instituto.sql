DROP DATABASE IF EXISTS instituto;
CREATE DATABASE instituto; 
USE instituto;

CREATE TABLE alumno (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(100) NOT NULL, 
apellido1 VARCHAR(100) NOT NULL,
apellido2 VARCHAR(100), 
fecha_nacimiento DATE NOT NULL, 
es_repetidor ENUM('sí', 'no') NOT NULL, 
teléfono VARCHAR(9)
);

INSERT INTO alumno VALUES(1, 'María', 'Sánchez', 'Pérez', '1990/12/01', 'no', NULL);
INSERT INTO alumno VALUES(2, 'Juan', 'Sáez', 'Vega', '1998/04/02', 'no', 618253876);
INSERT INTO alumno VALUES(3, 'Pepe', 'Ramírez', 'Gea', '1988/01/03', 'no', NULL);
INSERT INTO alumno VALUES(4, 'Lucía', 'Sánchez', 'Ortega', '1993/06/13', 'sí',
678516294);
INSERT INTO alumno VALUES(5, 'Paco', 'Martínez', 'López', '1995/11/24', 'no', 692735409);
INSERT INTO alumno VALUES(6, 'Irene', 'Gutiérrez', 'Sánchez', '1991/03/28', 'sí',
NULL);
INSERT INTO alumno VALUES(7, 'Cristina', 'Fernández', 'Ramírez', '1996/09/17', 'no ', 628349590);
INSERT INTO alumno VALUES(8, 'Antonio', 'Carretero', 'Ortega', '1994/05/20', 'sí', 612345633);
INSERT INTO alumno VALUES(9, 'Manuel', 'Domínguez', 'Hernández', '1999/07/08', 'no ', NULL);
INSERT INTO alumno VALUES(10, 'Daniel', 'Moreno', 'Ruiz', '1998/02/03', 'no', NULL);
select * from alumno;


-- Realice las siguientes consultas teniendo en cuenta la base de datos instituto.
--        1. Devuelve los datos del alumno cuyo id es igual a 1.


--        2. Devuelve los datos del alumno cuyo teléfono es igual a 692735409.


--        3. Devuelve un listado de todos los alumnos que son repetidores.


--        4. Devuelve un listado de todos los alumnos que no son repetidores.
        

--        5. Devuelve el listado de los alumnos que han nacido antes del 1 de enero de 1993.


--       6. Devuelve el listado de los alumnos que han nacido después del 1 de enero de 1994.


--        7. Devuelve el listado de los alumnos que han nacido después del 1 de enero de 1994 y no son repetidores.


--        8. Devuelve el listado de todos los alumnos que nacieron en 1998.


--        9. Devuelve el listado de todos los alumnos que no nacieron en 1998.



-- Devuelve los datos de los alumnos que hayan nacido entre el 1 de enero de 1998 y el 31 de mayo de 1998.



-- 1. Devuelve un listado con dos columnas, donde aparezca en la primera columna el nombre de los alumnos y 
-- en la segunda, el nombre con todos los caracteres invertidos.


-- 2. Devuelve un listado con dos columnas, donde aparezca en la primera columna el nombre y los apellidos 
-- de los alumnos y en la segunda, el nombre y los apellidos con todos los caracteres invertidos.


-- 3. Devuelve un listado con dos columnas, donde aparezca en la primera columna el nombre y los apellidos 
-- de los alumnos en mayúscula y en la segunda, el nombre y los apellidos con todos los caracteres invertidos 
-- en minúscula.



-- 4. Devuelve un listado con tres columnas, donde aparezca en la primera columna el nombre y los apellidos
-- de los alumnos, en la segunda, el número de caracteres que tiene en total el nombre y los apellidos y en 
-- la tercera el número de bytes que ocupa en total.


-- 5. Devuelve un listado con dos columnas, donde aparezca en la primera columna el nombre y los dos apellidos 
-- de los alumnos. En la segunda columna se mostrará una dirección de correo electrónico que vamos a calcular 
-- para cada alumno. La dirección de correo estará formada por el nombre y el primer apellido, separados por el 
-- carácter . y seguidos por el dominio @safapi.org. Tenga en cuenta que la dirección de correo electrónico 
-- debe estar en minúscula. Utilice un alias apropiado para cada columna.



-- 6. Devuelve un listado con tres columnas, donde aparezca en la primera columna el nombre y los dos apellidos
-- de los alumnos. En la segunda columna se mostrará una dirección de correo electrónico que vamos a calcular 
-- para cada alumno. La dirección de correo estará formada por el nombre y el primer apellido, separados por el 
-- carácter . y seguidos por el dominio @safapi.org. Tenga en cuenta que la dirección de correo electrónico debe
-- estar en minúscula. La tercera columna será una contraseña que vamos a generar formada por los caracteres 
-- invertidos del segundo apellido, seguidos de los cuatro caracteres del año de la fecha de nacimiento. Utilice 
-- un alias apropiado para cada columna.



-- Ejercicios:
-- 1. Devuelva un listado con cuatro columnas, donde aparezca en la primera columna la fecha de nacimiento
-- completa de los alumnos, en la segunda columna el día, en la tercera el mes y en la cuarta el año. 
-- Utilice las funciones DAY, MONTH y YEAR.
     

-- 2. Devuelva un listado con tres columnas, donde aparezca en la primera columna la fecha de nacimiento 
-- de los alumnos, en la segunda el nombre del día de la semana de la fecha de nacimiento y en la tercera 
-- el nombre del mes de la fecha de nacimiento.
--  • Resuelva la consulta utilizando las funciones DAYNAME y MONTHNAME.
--  • Resuelva la consulta utilizando la función DATE_FORMAT.
--

  
-- 3. Devuelva un listado con dos columnas, donde aparezca en la primera columna la fecha de nacimiento 
-- de los alumnos y en la segunda columna el número de días que han pasado desde la fecha actual hasta 
-- la fecha de nacimiento. Utilice las funciones DATEDIFF y NOW. 
-- Consulte la documentación oficial de MySQL para DATEDIFF.



-- 4. Devuelva un listado con dos columnas, donde aparezca en la primera columna la fecha de nacimiento 
-- de los alumnos y en la segunda columna la edad de cada alumno/a. La edad (aproximada) la podemos calcular
-- realizando las siguientes operaciones:
--    • Calcula el número de días que han pasado desde la fecha actual hasta la fecha de nacimiento. 
-- Utilice las funciones DATEDIFF y NOW.
--  Divida entre 365.25 el resultado que ha obtenido en el paso anterior. (El 0.25 es para compensar los años bisiestos que han podido existir entre la fecha de nacimiento y la fecha actual).
--  • Trunca las cifras decimales del número obtenido.