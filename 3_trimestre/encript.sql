-- RESUMEN ------------------------------------------------------------------------

-- ENCRIPTADO -- -- aes_encrypt ---------------------------------------------------

-- 1. En CREATE TABLE columna blob; o modificarla: ALTER TABLE nombreTable MODIFY columna BLOB;
-- 2. En INSERT escribimos -- aes_encrypt('datoAEncriptar','llave');
-- 3. select cast(aes_decrypt(columna, 'llave') as char) from tabla;

-- con FOTOS para backup en DUMPFILE
-- INSERT INTO clientes VALUES ('Marcos García', 'mgarcía@gmail.com', aes_encrypt('7840704453285443','xyz123'), "cara-perfecta.png", LOAD_FILE('C:\\Documents and Settings\\Jose\\Escritorio\\cara-perfecta.png'));
-- SELECT foto INTO DUMPFILE 'C:\\cara-perfecta.png' FROM clientes where nombre = "Marcos García";

-- EXPORTAR DATOS -----------------------------------------------------------------

-- use bdd;
-- select * from tabla 
-- into outfile "nombrearchivo.txt"    -- doc donde guardamos la info exportada
-- Opciones

-- [FIELDS
-- [TERMINATED BY '\t']                -- delimitador para separar columnas
-- [[OPTIONALLY] ENCLOSED BY '']       -- caracter que entrecomilla columnas- OPTIONALLY=sólo se entrecomillarán las columnas de texto y fecha.
-- [ESCAPED BY '\\' ]                  -- caracter que escapa otros que dificulten la lectura
-- ]
-- [LINES
-- [STARTING BY '']                    -- por defecto es nada
-- [TERMINATED BY '\n']                -- por defecto es el retorno de línea
-- ]

-- IMPORTAR -----------------------------------------------------------------

-- LOAD DATA LOCAL INFILE '/path/to/result.txt'
-- INTO TABLE marcas
--    [REPLACE | IGNORE]                 -- modo en que se tratan las filas leídas que contengan el mismo valor para una clave principal o única para una fila existente en la tabla
--    INTO TABLE tbl_name
--    [FIELDS
--        [TERMINATED BY '\t']
--        [[OPTIONALLY] ENCLOSED BY '']
--        [ESCAPED BY '\\' ]
--    ]
--    [LINES
--        [STARTING BY '']
--        [TERMINATED BY '\n']
--    ]
--    [IGNORE number LINES]           -- número líneas que no se interpreten como datos a importar.
--    [(col_name,...)]                -- indica la columna a la que será asignada cada una de las columnas leídas, si el orden de las columnas en la tabla no es el mismo que en el 
                                      -- fichero de texto, o si el número de columnas es diferente en ambos.

-- ÍNDICES ------------------------------------------------------------------------

--  CREATE [UNIQUE | FULLTEXT | SPATIAL] INDEX index_name ON table_name (index_col_name…) index_type;
-- 
--    index_name: es el nombre del índice.
--    table_name: es el nombre de la tabla donde se va a crear el índice.
--    index_col_name: nombre de la columna (o columnas) que formarán el índice.
--    index_type: es el tipo del índice. Se emplea con USING [BTREE | HASH].


-- EJEMPLOS ------------------------------------------------------------------------
-- aes_encrypt

drop table if exists clientes;

create table clientes(
    nombre varchar(50),
    mail varchar(70),
    tarjetacredito blob,
    primary key (nombre)
);

insert into clientes
values ('Marcos Luis','marcosluis@gmail.com',aes_encrypt('5390700823285988','xyz123'));

insert into clientes
values ('Ganzalez Ana','gonzalesa@gmail.com',aes_encrypt('4567230823285445','xyz123'));

insert into clientes
values ('Lopez German','lopezg@yahoo.com',aes_encrypt('7840704453285443','xyz123'));

-- Si accedemos al campo tarjetacredito podemos comprobar que se encuentra cifrado.
select tarjetacredito from clientes;

-- Para descifrar la tarjeta de crédito debemos conocer la clave de cifrado: 'xyz123':
select cast(aes_decrypt(tarjetacredito, 'xyz123') as char) from clientes;

-- ejemplo 2
drop table clientes;
CREATE TABLE clientes (
nombre VARCHAR(50),
mail VARCHAR(70),
tarjetacredito BLOB,
nombrefoto varchar(20),
foto LONGBLOB,
PRIMARY KEY (nombre)
);

select * from clientes; 

INSERT INTO clientes VALUES ('Marcos García', 'mgarcía@gmail.com', aes_encrypt('7840704453285443','xyz123'), "cara-perfecta.png", LOAD_FILE('C:\\Documents and Settings\\Jose\\Escritorio\\cara-perfecta.png'));
SELECT foto INTO DUMPFILE 'C:\\cara-perfecta.png' FROM clientes where nombre = "Marcos García";
select * from clientes;
select cast(aes_decrypt(tarjetacredito, 'xyz123')as char)from clientes;


-- exportar datos -------------------------------------------------------------------------
use cine;
select * from películas 
into outfile "peliculas.txt"
fields terminated by ';'
optionally enclosed by '\"'
lines terminated by '\n';


-- índice ------------------------------------------------------------------------------------
use cine;
-- usando where
CREATE INDEX idx_titulos on películas(título) USING BTREE;
select * from películas force index(idx_titulos) where título="Ciudadano Kane";

-- usando uniq
CREATE unique INDEX idx_cine on cines (código) USING BTREE;
select * from cines force index(idx_cine) where código=3;

-- where en varias columnas
CREATE INDEX idx_peli ON películas(código, duración) USING BTREE;
select * from películas force index(idx_peli) where código="3" and duración=90;

-- index con prefijo de columna
CREATE INDEX idx_columna on películas(título(7)) using btree;
select * from películas force index(idx_columna) where título="Ciudadano Kane";

-- join
create index idx_join on cines(película) using btree;
select * from cines force index(idx_join) join películas on películas.código=cines.película where películas.código=1;

-- índice cubreindo una consulta
CREATE INDEX idx_cubrir ON peliculas (codigo, calificacion) INCLUDE (duracion);
SELECT duracion FROM peliculas FORCE INDEX (idx_cubrir) WHERE codigo=3;

show INDEX from películas;

-- guía

--  CREATE [UNIQUE | FULLTEXT | SPATIAL] INDEX index_name ON table_name (index_col_name…) index_type;
-- 
--    index_name: es el nombre del índice.
--    table_name: es el nombre de la tabla donde se va a crear el índice.
--    index_col_name: nombre de la columna (o columnas) que formarán el índice.
--    index_type: es el tipo del índice. Se emplea con USING [BTREE | HASH].
