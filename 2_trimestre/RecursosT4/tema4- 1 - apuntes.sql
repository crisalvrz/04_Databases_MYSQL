DROP DATABASE IF EXISTS tema4;
create database tema4;
use tema4;
CREATE TABLE clientes(
    dni     VARCHAR(8)   NOT NULL,
    nombre    VARCHAR(60)  NOT NULL,
    apellido1 VARCHAR(60)  NOT NULL,
    apellido2 VARCHAR(60)  NOT NULL,
    domicilio VARCHAR(60)  DEFAULT "CALLE " ,
    telefono   VARCHAR(9),
    provincia  VARCHAR(60),
    saldo int
	) ;

-- Ejercicio: inserta el siguiente registro, sin indicar los campos: 
-- "11111111","Pedro","Gutiérrez", "Crespo",DEFAULT,NULL,"Asturias",2000



/*Ejercicio: inserta el siguiente registro,  indicando los campos:
"2222222","María","Gutiérrez", "Crespo","Asturias",35000*/



/* Actualiza la provincia de Asturias a Principado de Asturias*/


/* Incrementa el saldo de todos los clientes 100 euros más*/

