
use tienda;
-- 1.1.7 Subconsultas (En la cláusula WHERE)
-- 1.1.7.1 Con operadores básicos de comparación
-- 1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
-- +1
select * from producto p
where p.codigo_fabricante=(select codigo 
from fabricante f
where f.nombre like "Lenovo");


-- 2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante
-- Lenovo. (Sin utilizar INNER JOIN).
-- +1
select * 
from producto 
where precio=(
    select max(precio) 
    from producto
    where codigo_fabricante=(select codigo 
        from fabricante 
        where nombre like "Lenovo")
);

-- 3. Lista el nombre del producto más caro del fabricante Lenovo.
-- +1
select nombre, precio
from producto 
where precio=(
    select max(precio) 
    from producto
    where codigo_fabricante=(select codigo 
        from fabricante 
        where nombre like "Lenovo"))
and codigo_fabricante=(select codigo from fabricante where nombre like "Lenovo");


-- 4. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
-- +1

select nombre, precio
from producto 
where precio=(
    select min(precio) 
    from producto
    where codigo_fabricante=(select codigo 
        from fabricante 
        where nombre like "Hewlett-Packard"))
and codigo_fabricante=(select codigo from fabricante where nombre like "Hewlett-Packard");


-- 5. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más
-- caro del fabricante Lenovo. 
-- +1 ojo es cod_fabricante

select * 
from producto 
where precio>=(
    select max(precio) 
    from producto
    where codigo_fabricante=(select codigo 
        from fabricante 
        where nombre like "Lenovo")
);


-- 6. Lista todos los productos del fabricante Asus que tienen un precio superior 
-- al precio medio de todos sus productos.
-- +1

select nombre, precio
from producto 
where precio>(
    select avg(precio) 
    from producto
    where codigo_fabricante=(select codigo 
        from fabricante 
        where nombre like "Asus"))
and codigo_fabricante=(select codigo from fabricante where nombre like "Asus");


-- 1.1.7.2 Subconsultas con ALL y ANY
-- -----------------------------------------------------------------------------------
-- 8. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
-- +1
select nombre, precio from producto where precio>= ALL (select precio from producto);

-- 9. Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni
-- LIMIT.
-- +1
select nombre, precio from producto where precio<= ALL (select precio from producto);

-- 10. Devuelve los nombres de los fabricantes que tienen productos asociados. 
-- (Utilizando ALL o ANY).
-- +1

select nombre from fabricante where codigo= any(select codigo_fabricante from producto);


-- 11. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
-- +1
select nombre from fabricante where codigo not in (select codigo_fabricante from producto);

select nombre from fabricante where codigo!= all(select codigo_fabricante from producto);



-- 1.1.7.3 Subconsultas con IN y NOT IN
-- 12. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).

select nombre from fabricante
where codigo in (select codigo_fabricante from producto);


-- 13. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
-- +1

select nombre from fabricante
where codigo not in (select codigo_fabricante from producto);

-- 1.1.7.4 Subconsultas con EXISTS y NOT EXISTS
-- 14. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT
-- EXISTS).

select nombre from fabricante where exists(select 
    p.codigo_fabricante from producto p where 
    p.codigo_fabricante=fabricante.codigo);

-- 15. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT
-- EXISTS).
-- +1
select nombre from fabricante where not exists(select p.codigo_fabricante from producto p where p.codigo_fabricante=fabricante.codigo);


-- Ejercicios. Realización de querys SQL
-- 10
-- 1.1.7.5 Subconsultas correlacionadas
-- 16. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
-- es como crear una tabla temporal con la que se opera... hay que usar alias.

-- +1 pero me costó
select f.nombre, maxpr.nombre, maxpr.mxprecio from fabricante f join 
(select nombre, max(precio) as mxprecio, codigo_fabricante from producto p group by codigo_fabricante)as maxpr on maxpr.codigo_fabricante=f.codigo;


select f.nombre as fabricante, pm.nombre as producto, pm.preciomax from fabricante f 
inner join (select nombre, max(precio) as preciomax, codigo_fabricante from producto p group by codigo_fabricante) as pm 
on pm.codigo_fabricante= f.codigo;

-- Nota: having es un filtro posterior a group by
-- Opcion de Pilar
select f3.nombre, tabla1.nombre, tabla1.precio                      -- 3. sacamos lo que queremos de cada tabla
from fabricante f3
join (select p.codigo_fabricante, p.nombre, p.precio 
    from producto p -- 1.queremos los datos del que  tiene el precio máximo (consultamos p2)
    where p.precio=( select max(p2.precio)
        from producto p2
        where p2.codigo_fabricante= p.codigo_fabricante)) as tabla1  -- 2. para cada fabricante cogemos el más caro, filtramos p2
on f3.codigo= tabla1.codigo_fabricante
order by tabla1.precio desc;

-- opcion 2 de Miguel Angel
select f.nombre, p.nombre, p.precio
from fabricante f
join producto p
on f.codigo= p.codigo_fabricante
where p.precio=(select max(p2.precio)
                from producto p2
                where p2.codigo_fabricante= f.codigo)
order by p.precio desc;

-- 17. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los
-- productos de su mismo fabricante.
-- me costó

select nombre, precio, tabla2.media from producto
join
    (select avg(precio) as media, codigo_fabricante
    from producto
    group by codigo_fabricante) as tabla2
on producto.codigo_fabricante= tabla2.codigo_fabricante
where precio>=tabla2.media;


-- 18. Lista el nombre del producto más caro del fabricante Lenovo.

select p.nombre, precio
from producto p
join fabricante f
on p.codigo_fabricante=f.codigo
where f.nombre="Lenovo"
and p.precio= (select max(p2.precio) as pmaximo
            from producto p2
            join fabricante f2
            on p2.codigo_fabricante= f2.codigo
            where f2.nombre like "Lenovo");


-- 1.1.8 Subconsultas (En la cláusula HAVING)

-- 7. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos
-- que el fabricante Lenovo.


select count(producto.nombre) as n, fabricante.nombre 
from fabricante join producto 
on fabricante.codigo= producto.codigo_fabricante
group by fabricante.codigo
having n=
    (select count(producto.codigo) as nproductos from producto join fabricante
    on producto.codigo_fabricante= fabricante.codigo
    where fabricante.nombre like "Lenovo");
