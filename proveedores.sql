DROP DATABASE IF EXISTS proveedores;
CREATE DATABASE proveedores;
USE proveedores;

CREATE TABLE categoria (
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (100) NOT NULL
    
);

CREATE TABLE pieza (
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (100) NOT NULL,
    color VARCHAR (50) NOT NULL,
    precio DECIMAL  (7,2) NOT NULL,
    codigo_categoria INT UNSIGNED NOT NULL,
    FOREIGN KEY (codigo_categoria) REFERENCES categoria (Codigo)
    ON DELETE RESTRICT #con esto no deja borrar lo que tenga datos
    ON UPDATE RESTRICT
    );
    
INSERT INTO categoria VALUES (1, 'categoria A');
INSERT INTO categoria VALUES (2, 'categoria B');
INSERT INTO categoria VALUES (3, 'categoria C');

INSERT INTO pieza VALUES (1, 'pieza 1', 'Blanco', 25.90, 1);
INSERT INTO pieza VALUES (2, 'pieza 2', 'Verde', 32.75, 1);
INSERT INTO pieza VALUES (3, 'pieza 3', 'Rojo', 12.00, 2);
INSERT INTO pieza VALUES (4, 'pieza 4', 'Azul', 24.50, 2);
    
#SELECT * FROM pieza;
#delete from categoria where codigo=3;
#update categoria set codigo =5 where codigo =1;
