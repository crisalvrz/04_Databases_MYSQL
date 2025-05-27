use jardineria;
-- 1.4.8 Subconsultas
-- 1.4.8.1 Con operadores básicos de comparación

-- 1. Devuelve el nombre del cliente con mayor límite de crédito.
select nombre_cliente from cliente
where limite_credito=(select max(limite_credito)from cliente);

-- 2. Devuelve el nombre del producto que tenga el precio de venta más caro.

select nombre from producto
where precio_venta=(select max(precio_venta) from producto);

-- 3. Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto a partir de los datos de la tabla detalle_pedido)
select nombre from producto where codigo_producto=(select codigo_producto
from detalle_pedido
group by codigo_producto
order by sum(cantidad) desc limit 1);

-- 4. Los clientes cuyo limite de credito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).

SELECT c.nombre_cliente, c.limite_credito, c.codigo_cliente,
       (SELECT SUM(p.total) 
        FROM pago p 
        WHERE p.codigo_cliente = c.codigo_cliente) AS total_pagado
FROM cliente c
WHERE c.limite_credito > 
      (SELECT SUM(p.total)
       FROM pago p
       WHERE p.codigo_cliente = c.codigo_cliente);

-- con join
select c.codigo_cliente, total.media from cliente c inner join
(select codigo_cliente, sum(total) as media
from pago group by codigo_cliente) as total
on c.codigo_cliente= total.codigo_cliente
where c.limite_credito> total.media;

-- sql 1
select c.codigo_cliente, total.media from cliente c,
(select codigo_cliente, sum(total) as media
from pago group by codigo_cliente) total
where c.codigo_cliente= total.codigo_cliente
and c.limite_credito> total.media;

-- 5. Devuelve el producto que mas unidades tiene en stock.

select * from producto where cantidad_en_stock =
(select max(cantidad_en_stock)
from producto);

-- 6. Devuelve el producto que menos unidades tiene en stock.
select * from producto where cantidad_en_stock =
(select min(cantidad_en_stock)
from producto);

-- CON ALL
select * from producto where cantidad_en_stock <= ALL
(select MIN(cantidad_en_stock)
from producto);

-- 7. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.
select concat_ws(" ", nombre, apellido1, apellido2), email, codigo_jefe
from empleado
where codigo_jefe = (select codigo_empleado
    from empleado
    where concat_ws(" ", nombre, apellido1)="Alberto Soria");

-- con join

select concat_ws(" ", nombre, apellido1, apellido2), email, codigo_jefe
from empleado join empleado2
on codigo_jefe = codigo_empleado
where concat_ws(" ", nombre, apellido1)="Alberto Soria";

    
-- 1.4.8.2 Subconsultas con ALL y ANY

-- 8. Devuelve el nombre del cliente con mayor límite de crédito.

select c.nombre_cliente from cliente c
where limite_credito = (select max(limite_credito) from cliente);

select c.nombre_cliente from cliente c
where limite_credito >=all(select limite_credito from cliente);

-- no tiene sentido hacer este siguiente
select c.nombre_cliente, cr.limite_credito
from cliente c inner join cliente cr
on c.codigo_cliente = cr.codigo_cliente
order by cr.limite_credito desc limit 1;

-- 9. Devuelve el nombre del producto que tenga el precio de venta más caro.
select p.nombre from producto p
where precio_venta >=all (select precio_venta from producto);


-- 10. Devuelve el producto que menos unidades tiene en stock.
select * from producto
where cantidad_en_stock <= all(select cantidad_en_stock from producto);

-- 1.4.8.3 Subconsultas con IN y NOT IN

-- 11. Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.
select nombre, apellido1, puesto from empleado where codigo_empleado not in(select codigo_empleado_rep_ventas
from cliente);

select em.nombre, em.apellido1, em.puesto, cl.codigo_empleado_rep_ventas
from empleados em
left join cliente cl
on em.codigo_empleado=cl.codigo_empleado_rep_ventas
where cl.codigo_empleado_rep_ventas  is null;

-- 12. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
select * from cliente where codigo_cliente not in (select codigo_cliente from pedido);

-- 13. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.

select * from cliente where codigo_cliente in (select codigo_cliente from pedido);


-- 14. Devuelve un listado de los productos que nunca han aparecido en un pedido.

select nombre from producto where codigo_producto not in (select codigo_producto from detalle_pedido);

-- 15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas
-- de ningún cliente.
select concat_ws(" ", nombre, apellido1, apellido2) as name, e.puesto, o.telefono
from empleado e inner join oficina o
on e.codigo_oficina= o.codigo_oficina
where codigo_empleado not in (
select codigo_empleado_rep_ventas from cliente);


-- 16. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes
-- de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

-- usando using y on. using es cuando las columnas tienen = nombre; on cuando tienen !=.
SELECT * FROM oficina o
WHERE o.codigo_oficina NOT IN 
        (SELECT DISTINCT o.codigo_oficina 
         FROM oficina o INNER JOIN empleado e USING(codigo_oficina)
                        INNER JOIN cliente c ON c.codigo_empleado_rep_ventas = e.codigo_empleado
                        INNER JOIN pedido pe USING(codigo_cliente)
                        INNER JOIN detalle_pedido dp USING(codigo_pedido)
                        INNER JOIN producto pr USING(codigo_producto)
         WHERE pr.gama = 'Frutales');

-- todo con on
SELECT * FROM oficina o
WHERE o.codigo_oficina NOT IN 
    (SELECT DISTINCT o2.codigo_oficina 
     FROM oficina o2
     INNER JOIN empleado e ON o2.codigo_oficina = e.codigo_oficina
     INNER JOIN cliente c ON c.codigo_empleado_rep_ventas = e.codigo_empleado
     INNER JOIN pedido pe ON c.codigo_cliente = pe.codigo_cliente
     INNER JOIN detalle_pedido dp ON pe.codigo_pedido = dp.codigo_pedido
     INNER JOIN producto pr ON dp.codigo_producto = pr.codigo_producto
     WHERE pr.gama = 'Frutales');

-- en clase, sin join:
select oficina.* from oficina
where codigo_oficina not in
    (select codigo_oficina
    from empleado
    where codigo_empleado in
        (select codigo_empleado_rep_ventas
        from cliente
        where codigo_cliente in( select codigo_cliente
        from pedido
        where codigo_pedido in
            (select detalle_pedido.codigo_pedido from detalle_pedido 
            where detalle_pedido.codigo_producto in
                (select detalle_pedido.codigo_producto
                from detalle_pedido
                where detalle_pedido.codigo_producto in 
                    (select producto.codigo_producto
                    from producto
                    where gama = 'Frutales'))))));



-- 17. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
-- +1

SELECT c.nombre_cliente
FROM cliente c 
WHERE c.codigo_cliente IN (SELECT p.codigo_cliente 
                           FROM pedido p)  AND 
      c.codigo_cliente NOT IN (SELECT p.codigo_cliente
                               FROM pago p);

-- 1.4.8.4 Subconsultas con EXISTS y NOT EXISTS
-- 18. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
SELECT *
FROM cliente c
WHERE NOT EXISTS (SELECT *
                  FROM pago p
                  WHERE c.codigo_cliente = p.codigo_cliente);


-- 19. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.

select * from cliente c
where exists (select * from pago p where c.codigo_cliente= p.codigo_cliente);

-- 20. Devuelve un listado de los productos que nunca han aparecido en un pedido.
select * from producto pr
where not exists (select * from detalle_pedido dp
    where dp.codigo_producto= pr.codigo_producto);


-- 21. Devuelve un listado de los productos que han aparecido en un pedido alguna vez.
select * from producto pr
where exists (select * from detalle_pedido dp
    where dp.codigo_producto= pr.codigo_producto);


-- 1.4.8.5 Subconsultas correlacionadas
-- 1.4.9 Consultas variadas
-- 1. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. 
-- Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.

select c.nombre_cliente, tpedido.totalpedidos
from cliente c  left join (select 
    codigo_cliente, count(codigo_pedido) as totalpedidos from pedido 
    group by codigo_cliente) as tpedido
    on c.codigo_cliente=tpedido.codigo_cliente
    ;

-- 2. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. 
-- Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.

select c.nombre_cliente, tpagado.totalpagado
from cliente c left join (select 
    codigo_cliente, sum(total) as totalpagado from pago group by codigo_cliente)
    as tpagado
    on tpagado.codigo_cliente=c.codigo_cliente;


-- 3. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de
-- menor a mayor.

select c.nombre_cliente from cliente c inner join (select
    codigo_cliente, fecha_pedido from pedido
    where year(fecha_pedido) like 2008 group by codigo_cliente) as fpedidos
    on c.codigo_cliente=fpedidos.codigo_cliente order by nombre_cliente asc;


-- 4. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el 
-- número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan 
-- realizado ningún pago.
select c.nombre_cliente, e.nombre as nombre_empleado, e.apellido1 as apellido_empleado, o.telefono as telefono_oficina 
from cliente c 
join empleado e on c.codigo_empleado_rep_ventas= e.codigo_empleado 
join oficina o on e.codigo_oficina=o.codigo_oficina 
where c.codigo_cliente not in (select p.codigo_cliente from pago p); 

-- 5. Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas 
-- y la ciudad donde está su oficina.
select nombre_cliente, rep.n, rep.ap from cliente join (select e.nombre as n, e.apellido1 as ap from empleado e where codigo_empleado=(select 
codigo_empleado_rep_ventas 
from cliente where codigo_empleado_rep_ventas= e.codigo_empleado))as rep 
on codigo_empleado_rep_ventas= rep.codigo_empleado;


-- 6. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
select e.nombre_empleado, e.apellido1, e.apellido2, e.puesto, t.teloficina from empleado e join (select o.codigo_oficina, o.telefono as teloficina
    from oficina o having o.codigo_oficina=e.codigo_oficina)as t
on t.codigo_oficina=e.codigo_oficina
where e.codigo_empleado not in(select codigo_empleado_rep_ventas from cliente);
-- 6 ta mal ay

-- 7. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.

select o.ciudad, emp.nemp from oficina o join (select count(e.codigo_empleado) as nemp, e.codigo_oficina from empleado e group by codigo_oficina) as emp
on o.codigo_oficina=emp.codigo_oficina;