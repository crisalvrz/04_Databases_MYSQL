DROP DATABASE IF EXISTS cine;
CREATE DATABASE cine;
USE cine;

CREATE TABLE Películas (   
   Código INTEGER AUTO_INCREMENT PRIMARY KEY ,   
   Título VARCHAR ( 255 ) NOT NULL ,
   Duración  int(3),   
   Calificación VARCHAR ( 255 ) );  
 
 
 CREATE TABLE Cines (   
   Código INT AUTO_INCREMENT PRIMARY KEY ,   
   Nombre VARCHAR ( 255 ) NOT NULL ,   
   Película INTEGER ,
   FOREIGN KEY ( Película ) REFERENCES Películas ( Código )   
         
 );
 

 INSERT INTO Películas ( Código , Título , Duración, Calificación ) VALUES ( DEFAULT, 'Ciudadano Kane' ,120, 'PG' );   
 INSERT INTO Películas ( Código , Título , Duración, Calificación ) VALUES ( DEFAULT , 'Cantando bajo la lluvia' ,160, 'G' );   
 INSERT INTO Películas ( Código , Título , Duración, Calificación ) VALUES ( DEFAULT , 'El mago FROM Oz' ,90, 'G' );   
 INSERT INTO Películas ( Código , Título , Duración, Calificación ) VALUES ( DEFAULT , 'The Quiet Man' ,100, NULL );   
 INSERT INTO Películas ( Código , Título , Duración, Calificación ) VALUES ( DEFAULT , 'North by Northwest' ,90, NULL );   
 INSERT INTO Películas ( Código , Título , Duración, Calificación ) VALUES ( DEFAULT , 'El último tango ON París' ,140, 'NC-17' );   
 INSERT INTO Películas ( Código , Título , Duración, Calificación ) VALUES ( DEFAULT , 'No me gusta el verano' ,120, 'PG-13' );   
 INSERT INTO Películas ( Código , Título , Duración, Calificación ) VALUES ( DEFAULT , 'Una noche ON la ópera' ,90, NULL );   
 INSERT INTO Películas ( Código , Título , Duración, Calificación ) VALUES ( DEFAULT , 'Citizen King' ,90, 'G' );   
 
 INSERT INTO Cines ( Código , Nombre , Película ) VALUES ( DEFAULT , 'Odeon' , 5 );   
 INSERT INTO Cines ( Código , Nombre , Película ) VALUES ( DEFAULT , 'Imperial' , 1 );   
 INSERT INTO Cines ( Código , Nombre , Película ) VALUES ( DEFAULT , 'Majestic' , NULL );   
 INSERT INTO Cines ( Código , Nombre , Película ) VALUES ( DEFAULT , 'Royale' , 6 );   
 INSERT INTO Cines ( Código , Nombre , Película ) VALUES ( DEFAULT , 'Paraíso' , 3 );   
 INSERT INTO Cines ( Código , Nombre , Película ) VALUES ( DEFAULT , 'Nickelodeon' , NULL ); 

-- c. Seleccione el título de todas las películas ordenadas alfabéticamente.
select * from Películas order by Título;

 
-- d. Mostrar todas las calificaciones distintas en la base de datos.
select Calificación from Películas where Calificación is not null;

 
-- e. Mostrar el título y la duración de todas las películas sin clasificación ordenado de mayor a menor duración.
select Título, Duración from Películas where Calificación is null order by Duración desc;

-- f. Seleccione todas las salas de cine que actualmente no muestran una película.
select * from Cines where Película is null;           #con null siempre IS, ojo!!

-- g. SELECT todos los datos de todas las salas de cine y, adicionalmente, 
-- los datos de la película que se está mostrando en el cine (si se está mostrando una).
select * 
from cines left join películas
on cines.película= películas.código;

-- h. Seleccionar todos los datos de todas las películas y, si esa película se proyecta en un cine, 
-- muestre los datos del cine.

 select * 
 from películas left join cines
 on películas.código= cines.película;

--  i. Muestra los títulos FROM las películas que no se muestran actualmente en ningún cine.
select Títulos from Películas
where



-- j. Agregue la película sin calificación "One, Two, Three".



-- k. Establezca la calificación de todas las películas sin calificación en "G".

       

-- l. Retire las salas de cine que proyectan películas clasificadas como "NC-17".











 