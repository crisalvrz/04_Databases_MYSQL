DROP DATABASE IF EXISTS proveedores;
CREATE DATABASE proveedores;
USE proveedores;

CREATE TABLE categoria (
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);
CREATE TABLE pieza (
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
color VARCHAR(50) NOT NULL,
precio DECIMAL(7,2) NOT NULL,
codigo_categoria INT UNSIGNED,
FOREIGN KEY (codigo_categoria) REFERENCES categoria(codigo)
ON DELETE SET NULL
ON UPDATE SET NULL
);
INSERT INTO categoria VALUES (1, 'Categoria A');
INSERT INTO categoria VALUES (2, 'Categoria B');
INSERT INTO categoria VALUES (3, 'Categoria C');
INSERT INTO pieza VALUES (1, 'Pieza 1', 'Blanco', 25.90, 1);
INSERT INTO pieza VALUES (2, 'Pieza 2', 'Verde', 32.75, 1);
INSERT INTO pieza VALUES (3, 'Pieza 3', 'Rojo', 12.00, 2);
INSERT INTO pieza VALUES (4, 'Pieza 4', 'Azul', 24.50, 2);

#delete from categoria where codigo=1;
#select * from pieza;
#update categoria set codigo =5 where codigo =1; 