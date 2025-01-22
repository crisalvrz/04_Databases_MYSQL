#pub- posible de examen:::

DROP DATABASE IF EXISTS pubs;
CREATE DATABASE pubs;
USE pubs;


CREATE TABLE pub (
cod_pub INT(20),
nombre VARCHAR(30) NOT NULL,
licencia_fiscal VARCHAR(30) NOT NULL,
domicilio VARCHAR(30),
fecha_apertura DATE NOT NULL,
horario VARCHAR(20) NOT NULL,
cod_localidad INT(20) NOT NULL

);

CREATE TABLE titular (
dni_titular CHAR(9),
nombre VARCHAR(20) NOT NULL,
domicilio VARCHAR(30),
cod_pub INT(20) NOT NULL
);

CREATE TABLE empleado (
dni_empleado INT(9),
nombre VARCHAR(20) NOT NULL,
domicilio VARCHAR(30)

);

CREATE TABLE existencias (
cod_articulo INT(13) NOT NULL,
nombre VARCHAR(20) NOT NULL,
cantidad INT(200) NOT NULL,
precio DECIMAL(7, 4) NOT NULL,
cod_pub INT(20) NOT NULL

);

CREATE TABLE localidad (
cod_localidad INT(20) NOT NULL,
nombre VARCHAR(20)
);

CREATE TABLE pub_empleado (
cod_pub INT(20) NOT NULL,
dni_empleado INT(9) NOT NULL,
funcion VARCHAR(20) NOT NULL
);

#faltan muchos alter aquí del ej.
alter table pub modify horario enum ('HOR1','HOR2','HOR3');
alter table pub_empleado modify funcion enum ('camarero','seguridad','limpieza');
#alter table existencias modify precio decimal(7,2) not null check(precio>0);
alter table pub add primary key (cod_pub);
alter table localidad add primary key (cod_localidad);
alter table titular add primary key (dni_titular);
alter table empleado add primary key (dni_empleado);
alter table existencias add primary key (cod_articulo);
alter table pub_empleado add primary key (cod_pub,dni_empleado,funcion);
alter table pub add foreign key (cod_localidad) references localidad(cod_localidad) on delete restrict on update restrict;
alter table titular add foreign key (cod_pub) references pub(cod_pub) on delete restrict on update restrict;
alter table existencias add foreign key (cod_pub) references pub(cod_pub) on delete restrict on update restrict;
alter table pub_empleado add foreign key (cod_pub) references pub(cod_pub) on delete restrict on update restrict;
alter table pub_empleado add foreign key (dni_empleado) references empleado(dni_empleado) on delete cascade on update cascade;

alter table pub add constraint fk_pub_localidad
    foreign key (cod_localidad) references localidad (cod_localidad)
    on delete restrict
    on update restrict;
    
alter table titular add constraint fk_titular_pub
    FOREIGN KEY (cod_pub) references pub (cod_pub)
    on delete restrict
    on update restrict;

alter table existencias add constraint fk_existencias_pub
    FOREIGN KEY (cod_pub) references pub (cod_pub)
    on delete restrict
    on update restrict;
    
alter table pub_empleado add constraint fk_pubemple_pu
    FOREIGN KEY (cod_pub) references pub (cod_pub)
    on delete restrict
    on update restrict;
    
alter table pub_empleado add constraint fk_oubemple_empleado
    FOREIGN KEY (dni_empleado) references empleado (dni_empleado)
    on delete restrict
    on update restrict;

alter table pub drop horario;
alter table pub add horario_apertura TIME NOT NULL after fecha_apertura;
alter table pub add horario_cierre TIME NOT NULL after horario_apertura;

alter table pub change nombre nombre_pub VARCHAR(30) NOT NULL;
alter table titular change nombre nombre_titular VARCHAR(30) NOT NULL;
alter table existencias change nombre nombre_articulo VARCHAR(30) NOT NULL;
alter table localidad change nombre nombre_localidad VARCHAR(30) NOT NULL;


