-- resumen: ------------------------------------------------------------------------
-- AUTOCOMMIIT

-- autocommit=0 no guarda, hay que hacer commit y savepoints
-- autocommit=1 guarda cada paso, aunque hagamos rollback lo guardó así que na

-- ------------------------------------------------------------------------
-- si hacemos una TRANSACCIÓN:

-- rollback me la deshace a pesar de estar en commit 1 porque es una transaccion, estas acaban con un commit o un rollback siempre.
-- por ello para guardar transacciones usamos savepoints.

-- ------------------------------------------------------------------------
-- Los PROCEDIMIENTOS son funciones(), pueden englobar transacciones. 
-- Empiezan con create procedure nombre(); begin; y finalizan con end;.


-- -----EJEMPLOS -------------------------------------------------------------------------

select @@autocommit;
set autocommit = 0; -- autocommit en 1 es on; 0 es off; 

DROP DATABASE   if exists testTransac;
create database testTransac;
use testTransac;
create table cliente (
id int unsigned primary key,
nombre char(20)
);

start transaction;
insert into cliente values (1, Daniel);

select * from cliente;

insert into cliente values
    (15, 'Pepa');
    
commit; -- lo deja definitivo, si está el autocommit a 1 ya lo es asi que no tiene sentido
rollback; -- va hacia atrás, tiene que estar autocommit a 0


-- -----savepoint  -----------------------------------

start transaction;
delete from cliente;
insert into cliente values (1, 'Pepe');
savepoint SP1; -- delimitamos el punto, y seguimos
insert into cliente values (15, 'Pepa');

rollback to SP1; -- retrocedemos, por lo que pepa no saldrá
select * from cliente;

-- ---------------------------------autocommit 0------------------------------------------------------------------------
-- 9 de mayo, lo del día anterior no le funcionaba
-- use testTransac;
-- delete from cliente;
-- commit;
select * from cliente;

-- en este punto quedamos con la tabla vacía, como al principio
-- efectos de autocommit y rollback
set @@autocommit= 0;
select @@autocommit;

insert into cliente values (1, 'Pepe');
insert into cliente values (15, 'Pepa');

rollback; -- vacío porque al tener autocommit a 0, al hacer rollback vuelve a la situación actual
select * from cliente;

-- efectos autocommit a 0 y commit

insert into cliente values (1, 'Pepe');
insert into cliente values (15, 'Pepa');

commit; -- valida y guarda
select * from cliente;


-- --------------------------------autocommit 1---------------------------------------------------------
use testTransac;
delete from cliente;
commit;
select * from cliente;

-- en este punto quedamos con la tabla vacía, como al principio
-- efectos de autocommit 1 y rollback
set @@autocommit= 1;
select @@autocommit;

insert into cliente values (1, 'Pepe');
insert into cliente values (15, 'Pepa');

rollback; -- los registros se insertan, al estar a 1 los select que hagamos se fueron insertando; roll no sirve pa na
select * from cliente;

-- efectos autocommit a 1 y commit

insert into cliente values (1, 'Pepe'); -- error, ya existen
insert into cliente values (15, 'Pepa');
select * from cliente;

-- con transaccion ---------------------------------------------------------------------------------------
delete from cliente;

start transaction;
insert into cliente values (6, 'Pepe2');
insert into cliente values (16, 'Pepa2');
select * from cliente;
rollback; -- me lo deshace a pesar de estar en 1 porque es una transaccion, estas acaban con un commit o un rollback.
select * from cliente;

insert into cliente values (6, 'Pepe2');
insert into cliente values (16, 'Pepa2');

rollback; -- transacción finaliza con commit o rollback // se puede usar begin y end
select * from cliente;


-- --13/5/25-----------------------------------------------------------------------------------------

-- con savepoint; pg20 ej1
use jardineria;
select * from pedido;
set @@autocommit=0;
start transaction;
insert into pedido values (200, "2025-05-13", "2025-05-20", "2025-05-20", "Pendiente", "na", 1);
savepoint SP1;
update producto set cantidad_en_stock= cantidad_en_stock -1 where codigo_producto=11679 ;
savepoint SP2;
insert into pago values (1, "PayPal", "ak-std-000991", "2025-05-13", 2030);
select * from pago;

rollback;
rollback to savepoint SP1;
rollback to savepoint SP2;

commit;

select * from pago;

-- ---------- 15/05/25 -------
-- ejercio 2 control de stock con procedimientos
use jardinería;
select * from producto ;
delimiter $$ -- así utilizamos ; dentro del procedimiento y no se confunde
drop procedure if exists transaccion$$
create procedure transaccion()
begin
DECLARE EXIT HANDLER FOR SQLSTATE '42000'
    BEGIN
        SELECT 'Stock insuficiente' AS error_message;
    END;
start transaction; -- comenzar la transacción; escoger los 3 datos nosotros; miramos nº unidades de un producto y probamos lo correcto y lo incorrecto.

IF (select cantidad_en_stock
    from producto
    where codigo_producto= 'AR-001')>100 THEN -- Verificar si hay suficiente stock

update producto set cantidad_en_stock= cantidad_en_stock -40 where codigo_producto= 'AR-001'; -- Reducir el stock en el almacén de origen

update producto set cantidad_en_stock= cantidad_en_stock +40 where codigo_producto= '11679'; -- Aumentar el stock en el almacén de destino

commit; -- Confirmar la transacción
ELSE
    rollback; -- Si no hay suficiente stock, cancelar la operación/transacción
    CALL raise_error;
END IF;
END$$
CALL transaccion()$$

