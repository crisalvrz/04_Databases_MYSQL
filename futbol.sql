DROP DATABASE IF EXISTS futbol;
CREATE DATABASE futbol;
USE futbol;

CREATE TABLE equipos (
id_equipo INT(2) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
estadio VARCHAR(50) NOT NULL,
aforo INT(6) NOT NULL,
anyo_fundacion INT(4) UNSIGNED NOT NULL,
ciudad VARCHAR(50) NOT NULL
);

CREATE TABLE jugadores (
id_jugador INT(3) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50)NOT NULL,
fecha_nac DATE NOT NULL,
demarcacion VARCHAR(50) NOT NULL,
internacional INT(3) NOT NULL,
id_equipo INT(2) UNSIGNED NOT NULL,

FOREIGN KEY (id_equipo) REFERENCES equipos (id_equipo) 
);



CREATE TABLE partidos(
    id_equipo_casa INT(2) UNSIGNED PRIMARY KEY,
    id_equipo_fuera INT(2) UNSIGNED,
    fecha DATE NOT NULL,
    goles_casa INT(2) NOT NULL,
    goles_fuera INT(2) NOT NULL,
    observaciones VARCHAR(200) NOT NULL,
    
    FOREIGN KEY (id_equipo_casa) REFERENCES equipos (id_equipo),
    FOREIGN KEY (id_equipo_casa) REFERENCES equipos (id_equipo)
);

CREATE TABLE goles(

    id_equipo_casa INT(2) UNSIGNED NOT NULL PRIMARY KEY,
    id_equipo_fuera INT(2) UNSIGNED NOT NULL,
    minuto INT(2) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    id_jugador INT(3) UNSIGNED NOT NULL,

    FOREIGN KEY (id_equipo_casa) REFERENCES equipos (id_equipo),
    FOREIGN KEY (id_equipo_fuera) REFERENCES equipos (id_equipo),
    FOREIGN KEY (id_jugador) REFERENCES jugadores (id_jugador)
);

describe goles;
ALTER TABLE partidos ADD inicio_partido TIME NOT NULL AFTER fecha;
ALTER TABLE equipos CHANGE anyo_fundacion fundacion int(4) NOT NULL;
ALTER TABLE equipos ADD anagrama VARCHAR(20) AFTER ciudad; #esto seria con blop
ALTER TABLE jugadores ADD FOREIGN KEY (id_equipo) REFERENCES equipos (id_equipo);

ALTER TABLE jugadores add constraint fk_jugadores_equipos
foreign key (id_equipo) references equipos(id_equipo);
describe jugadores;

ALTER TABLE goles ADD FOREIGN KEY (id_equipo_casa) REFERENCES equipos (id_equipo);
ALTER TABLE goles ADD FOREIGN KEY (id_equipo_fuera) REFERENCES equipos (id_equipo);
ALTER TABLE goles ADD FOREIGN KEY (id_jugador) REFERENCES jugadores (id_jugador);

SELECT * FROM equipos;
SELECT * FROM equipos, jugadores WHERE equipos.id_equipo = jugadores.id_equipo;

ALTER TABLE jugadores
ADD UNIQUE [INDEX | KEY] [indice] (id_jugador);
