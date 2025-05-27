USE ventas;

/*1. Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. 
(Sin utilizar INNER JOIN).*/
-- +1
select * from pedido where id_cliente = (select id from cliente where concat(nombre, apellido1, apellido2) like "AdelaSalasDíaz");

select * from pedido where id_cliente = (select id from cliente where concat_ws(" ",nombre,apellido1,apellido2) like "Adela Salas Díaz");

/*2. Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega.
(Sin utilizar INNER JOIN)*/
-- +1
select * from pedido where id_comercial=(select id from comercial 
where concat(nombre, apellido1, apellido2)="DanielSáezVega");

select count(id) from pedido where id_comercial=(select id from comercial where concat_ws(" ", nombre, apellido1, apellido2) like
"Daniel Sáez Vega");

/*3. Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. 
(Sin utilizar INNER JOIN)*/
select * from cliente where id=
(select id_cliente from pedido where total=
    (select max(total) from pedido where year(fecha)=2019));
    
select *  from cliente where id=
(select id_cliente from pedido where year(fecha)=2019
order by total limit 1);

/*4. Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente 
Pepe Ruiz Santana.*/
-- +1

select min(total), fecha from pedido
where id_cliente=
    (select id  
    from cliente
    where concat(nombre, apellido1, apellido2)=("PepeRuizSantana"));

/*5. Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes
que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio 
de los pedidos realizados durante ese mismo año.*/
-- +1

select * from cliente c inner join pedido p 
on c.id=p.id_cliente
where total >= (select avg(total) from pedido where year(fecha)=2017)
and year(fecha)=2017;



/*----------------------------------------------------------------------------------------*/
/*6. Devuelve el pedido más caro que existe en la tabla pedido si hacer uso de MAX, 
ORDER BY ni LIMIT.*/
-- +1
select * from pedido
where total>= all(select total from pedido);

/*7. Devuelve un listado de los clientes que no han realizado ningún pedido. 
(Utilizando ANY o ALL). <> es distinto de */
select * from cliente where id<>all(select id_cliente from pedido);
select * from cliente where not id = any(select id_cliente from pedido);

/*8. Devuelve un listado de los comerciales que no han realizado ningún pedido. 
(Utilizando ANY o ALL).*/
-- me costó
select * from comercial where not id = any(select id_comercial from pedido);
select * from comercial where  id <> all(select id_comercial from pedido);


/*9. Devuelve un listado de los clientes que no han realizado ningún pedido. 
(Utilizando IN o NOT IN).*/
select * from cliente where id not in(select id_cliente from pedido);

/*10. Devuelve un listado de los comerciales que no han realizado ningún pedido. 
(Utilizando IN o NOT IN).*/
-- +1
select * from comercial where id not in(select id_comercial from pedido);
