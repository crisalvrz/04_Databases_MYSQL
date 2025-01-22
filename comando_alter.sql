drop database if exists comando_alter;
create database if not exists comando_alter;
use comando_alter;
CREATE TABLE usuario (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (25)
);

describe usuario;
ALTER TABLE usuario MODIFY nombre VARCHAR(50) NOT NULL;
ALTER TABLE usuario CHANGE nombre nombre_usuario VARCHAR(50) NOT NULL;
ALTER TABLE usuario ADD sexo ENUM('H', 'M') NOT NULL;
ALTER TABLE usuario ADD fecha_nacimiento DATE NOT NULL;
ALTER TABLE usuario DROP fecha_nacimiento;
ALTER TABLE usuario ADD apellido1 VARCHAR(50) NOT NULL AFTER nombre_usuario;
ALTER TABLE usuario ADD apellido2 VARCHAR(50) AFTER apellido1;
ALTER TABLE usuario ADD edad int AFTER apellido2;

ALTER TABLE usuario ALTER sexo SET DEFAULT 'M';
ALTER TABLE usuario ALTER sexo DROP DEFAULT;