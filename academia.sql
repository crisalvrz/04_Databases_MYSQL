DROP DATABASE IF EXISTS academia;
CREATE DATABASE academia;
USE academia;

CREATE TABLE alumnos (
dni CHAR(9) NOT NULL PRIMARY KEY,
nombre VARCHAR(20) NOT NULL,
apellido1 VARCHAR (20) NOT NULL,
direccion VARCHAR (20) NOT NULL,
sexo enum ('H', 'M'),
fechaNac DATE NOT NULL
);


CREATE TABLE profesores(
dni CHAR(9) NOT NULL primary key,
nombre VARCHAR(30) NOT NULL,
apellidos1 VARCHAR(30) NOT NULL,
apellido2 VARCHAR(30) NOT NULL,
direccion VARCHAR(20) NOT NULL,
titulo VARCHAR(20) NOT NULL,
sueldo decimal(7,2) NOT NULL
);

CREATE TABLE cursos (
nombreCurso VARCHAR (200) NOT NULL,
codigoCurso INT NOT NULL auto_increment PRIMARY KEY,
dni_profesor CHAR (9) NOT NULL,
maxAlumnos TINYINT UNSIGNED NOT NULL,
fechaIni DATE NOT NULL,
fechaFin DATE NOT NULL,
numhoras TINYINT UNSIGNED NOT NULL,
FOREIGN KEY (dni_profesor) REFERENCES profesores(dni)
);

CREATE TABLE manuales (
referencia VARCHAR(20) NOT NULL,
titulo VARCHAR(50) NOT NULL,
autor VARCHAR(50) NOT NULL,
fechaPub DATE NOT NULL,
precio decimal unsigned NOT NULL
);


CREATE TABLE oposiciones (
cod_oposicion INT(20) NOT NULL PRIMARY KEY,
nombre VARCHAR(20) NOT NULL ,
fecExamen DATE NOT NULL ,
organismo VARCHAR (20) NOT NULL,
plazas INT NOT NULL,
categoria enum ('a', 'b', 'c', 'd', 'e', 'f') NOT NULL
);

CREATE TABLE matriculas (
dniAlumno CHAR(9) not null, 
codCurso INT NOT NULL auto_increment, 
pruebaA INT NOT NULL check (pruebaA>=0) and (pruebaA<= 50), 
pruebaB INT NOT NULL check (pruebaB>=0) and (pruebaB<= 50),
tipo VARCHAR(20) NOT NULL, 
inscripcion DATE NOT NULL,

PRIMARY KEY (dniAlumno, codCurso),

FOREIGN KEY (dniAlumno) REFERENCES alumnos (dni),
FOREIGN KEY (codCurso) REFERENCES cursos (codigoCurso)
);


CREATE TABLE curso_oposicion (
codCurso INT NOT NULL auto_increment, 
codOposicion INT(20) NOT NULL,
PRIMARY KEY (codCurso, codOposicion),
FOREIGN KEY (codCurso) REFERENCES cursos (codigoCurso),
FOREIGN KEY (codOposicion) REFERENCES oposiciones (cod_oposicion)
);

#describe curso_manual;

CREATE TABLE curso_manual (
codCurso INT NOT NULL,
referencia_manual VARCHAR(20) NOT NULL,
PRIMARY KEY (codCurso, referencia_manual),
FOREIGN KEY (codCurso) REFERENCES cursos (codigoCurso),
FOREIGN KEY (referencia_manual) REFERENCES manuales (referencia)
);

CREATE TABLE curso_alumno (
codCurso int not null auto_increment,
alumno_dni char(9) not null,

PRIMARY KEY (codCurso, alumno_dni),
FOREIGN KEY (codCurso) REFERENCES cursos (codigoCurso),
FOREIGN KEY (alumno_dni) REFERENCES alumnos (dni)
);
