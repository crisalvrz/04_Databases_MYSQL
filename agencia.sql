DROP DATABASE IF EXISTS agencia;
CREATE DATABASE agencia;
USE agencia;
CREATE TABLE turista(
    id INT(100) AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (20) NOT NULL,
    apellidos VARCHAR (40) NOT NULL,
    direccion VARCHAR (40) NOT NULL,
    teléfono INT (11) NOT NULL
);

CREATE TABLE hotel(
    id INT (100) AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (30) NOT NULL,
    direccion VARCHAR (30) NOT NULL,
    ciudad VARCHAR (20) NOT NULL,
    plazas INT (250) NOT NULL,
    telefono INT (11) NOT NULL
);

CREATE TABLE reservas(
    fecha_entrada DATE,
    fecha_salida DATE,
    regimen VARCHAR (20) NOT NULL,
    id_turista INT (100) NOT NULL,
    id_hotel INT (100) NOT NULL
    
    FOREIGN KEY (id_turista) REFERENCES turista(id),
    FOREIGN KEY (id_hotel) REFERENCES hotel(id)
);
