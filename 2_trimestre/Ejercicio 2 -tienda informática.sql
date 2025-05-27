-- Consultas multitabla (Composición interna)
-- Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.
use tienda;
-- -------------------------------------------------------------------------
-- 1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de
-- la base de datos.
select producto.nombre, precio, fabricante.nombre from producto join fabricante
on producto.codigo_fabricante= fabricante.codigo;

-- sql1
select producto.nombre, precio, fabricante.nombre from porducto, fabricante
where producto.codigo_fabricante= fabricante.codigo;

-- 2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de
-- la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
select producto.nombre, precio, fabricante.nombre from producto join fabricante
on producto.codigo_fabricante= fabricante.codigo order by fabricante.nombre asc;

-- sql1
select producto.nombre, precio, fabricante.nombre from porducto, fabricante
where producto.codigo_fabricante= fabricante.codigo order by fabricante.nombre asc;

-- 3. Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del
-- fabricante, de todos los productos de la base de datos.
select producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre from producto join fabricante
on producto.codigo_fabricante= fabricante.codigo;

-- sql1
select producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre from producto, fabricante
where producto.codigo_fabricante= fabricante.codigo;

-- 4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
select producto.nombre, precio, fabricante.nombre from producto inner join fabricante 
order by precio asc limit 1;

-- 5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
select producto.nombre, precio, fabricante.nombre from producto inner join fabricante 
order by precio desc limit 1;

-- 6. Devuelve una lista de todos los productos del fabricante Lenovo.
select producto.codigo, producto.nombre
from producto inner join fabricante
on producto.codigo_fabricante= fabricante.codigo
where fabricante.nombre like "Lenovo";

-- 7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
select producto.*
from producto inner join fabricante
on producto.codigo_fabricante= fabricante.codigo
where fabricante.nombre like "Crucial"&& precio>200;

-- 8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin
-- utilizar el operador IN.
select producto.*
from producto inner join fabricante
on producto.codigo_fabricante= fabricante.codigo
where fabricante.nombre = "Asus" 
or fabricante.nombre ="Hewlett-Packard" 
or fabricante.nombre ="Seagate";

-- sql1
select producto.*
from producto, fabricante
where producto.codigo_fabricante= fabricante.codigo
and (fabricante.nombre = "Asus"
or fabricante.nombre ="Hewlett-Packard" 
or fabricante.nombre ="Seagate");

-- 9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando
-- el operador IN.
select *
from producto join fabricante
on producto.codigo_fabricante= fabricante.codigo
where fabricante.nombre in ("Asus", "Hewlett-Packard","Seagate");

-- 10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre
-- termine por la vocal e.
select p.nombre, p.precio, f.nombre
from producto p inner join fabricante f
on p.codigo_fabricante = f.codigo
where f.nombre like '%e';

-- 11. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga
-- el carácter w en su nombre.
select p.nombre, p.precio, f.nombre
from producto p inner join fabricante f
on p.codigo_fabricante = f.codigo
where f.nombre like '%w%';

-- 12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos
-- que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden
-- descendente) y en segundo lugar por el nombre (en orden ascendente)
select p.nombre, p.precio, f.nombre
from producto p inner join fabricante f
on p.codigo_fabricante = f.codigo
where p.precio>=180 order by precio desc, p.nombre asc;

-- 13. Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen
-- productos asociados en la base de datos.
select distinct f.codigo, f.nombre
from fabricante f join producto p
on f.codigo = p.codigo_fabricante;

select distinct f.codigo, f.nombre
from fabricante f left join producto p
on f.codigo = p.codigo_fabricante
where p.codigo is not null;

select distinct f.codigo, f.nombre
from fabricante f right join producto p
on p.codigo_fabricante=f.codigo;

-- Consultas multitabla (Composición externa)
-- Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN
-- --------------------------------------------------------------------------------------------
-- 1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que
-- tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos
-- asociados.
select *
from fabricante f left join producto p
on  f.codigo = p.codigo_fabricante;

-- 2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
select *
from fabricante f left join producto p
on  f.codigo = p.codigo_fabricante
where p.codigo is null;

-- 3. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
-- En este caso no, ya que perdería la integridad referencial. Aunque por seguridad debemos saber si nos deja o no (no).
-- Productos click derecho> foreign keys -- ahí vemos que la hay.

-- Consultas resumen
-- ---------------------------------------------------------
-- 1. Calcula el número total de productos que hay en la tabla productos.
select count(*) from producto;

-- 2. Calcula el número total de fabricantes que hay en la tabla fabricante.
select count(codigo) from fabricante;

-- 3. Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.
select count(distinct(codigo_fabricante)) from producto;

-- 4. Calcula la media del precio de todos los productos.
select avg(precio) from producto;


-- 5. Calcula el precio más barato de todos los productos.
select precio from producto order by precio asc limit 1;


-- 6. Calcula el precio más caro de todos los productos.
select precio from producto order by precio desc limit 1;
select max(precio) from producto;

-- 7. Lista el nombre y el precio del producto más barato.
select nombre, precio from producto order by precio asc limit 1;

-- 8. Lista el nombre y el precio del producto más caro.
select nombre, precio from producto order by precio desc limit 1;


-- 9. Calcula la suma de los precios de todos los productos.
select sum(precio) from producto;


-- 10. Calcula el número de productos que tiene el fabricante Asus.
select count(p.nombre), f.nombre from producto p inner join fabricante f
where f.nombre like "Asus";


-- 11. Calcula la media del precio de todos los productos del fabricante Asus.
select avg(p.precio) from producto p inner join fabricante f
on p.codigo_fabricante= f.codigo
where f.nombre like "Asus";


-- 12. Calcula el precio más barato de todos los productos del fabricante Asus.
select precio from producto p inner join fabricante f
on p.codigo_fabricante= f.codigo
where f.nombre like "Asus"
order by p.precio asc limit 1;


-- 13. Calcula el precio más caro de todos los productos del fabricante Asus.

select precio from producto p inner join fabricante f
on p.codigo_fabricante= f.codigo
where f.nombre like "Asus"
order by p.precio desc limit 1;

-- 14. Calcula la suma de todos los productos del fabricante Asus.
select sum(p.precio) from producto p inner join fabricante f
on p.codigo_fabricante= f.codigo
where f.nombre like "Asus";


-- 15. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante
-- Crucial.
select max(precio), min(precio), avg(precio) as "media", count(p.codigo)
from fabricante f inner join producto p
on f.codigo= p.codigo_fabricante
where f.nombre="Crucial";


-- 16. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe
-- incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el
-- nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente
-- por el número de productos.




-- 17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes.
-- El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
select f.nombre, max(p.precio), min(p.precio), avg(p.precio) as precio_medio, f.codigo
from producto p inner join fabricante f
on p.codigo_fabricante= f.codigo; 
-- revisar


-- 18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes
-- que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el
-- código del fabricante es suficiente.

select max(p.precio), min(p.precio), avg(p.precio) as precio_medio, f.codigo
from producto p inner join fabricante f
on p.codigo_fabricante= f.codigo
group by f.nombre
having precio_medio>=200;
-- no se usa where precio> porque nos dice que es precio medio, y lo calculamos nosotros.


-- 19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el
-- número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario
-- mostrar el nombre del fabricante.
select f.nombre, max(p.precio), min(p.precio), avg(p.precio) as precio_medio
from producto p inner join fabricante f
on p.codigo_fabricante= f.codigo
group by f.nombre
having precio_medio>=200;



-- Ejercicios. Realización de querys SQL
-- ---------------------------------------------------------------------------------
-- 20. Calcula el número de productos que tienen un precio mayor o igual a 180€.
select count(p.codigo)
from producto p where precio>=180;


-- 21. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
select count(p.codigo), f.nombre
from producto p join fabricante f
on f.codigo=p.codigo
where p.precio>= 180
group by f.nombre;

-- filtro al resultado de la agrupación 
select f.nombre, count(p.codigo) as nproductos
from fabricante f inner join producto p
on f.codigo= p.codigo_fabricante
where p.precio >= 180
group by f.nombre
having nproductos >=2;

-- 22. Lista el precio medio los productos de cada fabricante, mostrando solamente el código del fabricante.
select codigo_fabricante,avg(precio)
from  producto p inner join fabricante f
on f.codigo= p.codigo_fabricante
group by f.nombre;

-- 23. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
select avg(precio), f.nombre
from producto p inner join fabricante f
on f.codigo=p.codigo_fabricante
group by f.nombre;

-- 24. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
select f.nombre, avg(p.precio)
from fabricante f inner join producto p
on f.codigo=p.codigo_fabricante
group by f.nombre
having avg(p.precio)>= 150;

-- 25. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
select f.nombre, count(p.codigo) as total_productos
from fabricante f inner join producto p
on f.codigo=p.codigo_fabricante
group by f.nombre
having count(p.codigo)>=2;

-- 26. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con
-- un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen
-- productos que cumplan la condición.
-- Ejemplo del resultado esperado:
-- nombre total
-- Lenovo 2
-- Asus 1
-- Crucial 1
select distinct f.nombre, count(p.codigo) as nproductos, precio
from producto p inner join fabricante f
on f.codigo=p.codigo_fabricante
where p.precio>=220
group by f.nombre;


-- 27. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con
-- un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si
-- hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el
-- listado con un valor igual a 0 en el número de productos.
-- Ejemplo del resultado esperado:
-- nombre total
-- Lenovo 2
-- Crucial 1
-- Asus 1
-- Huawei 0
-- Samsung 0
-- Gigabyte 0
-- Hewlett-Packard 0
-- Xiaomi 0
-- Seagate 0

-- A) 1º >220 y luego left join (con el and en el on)
select distinct f.nombre, count(p.codigo) as nproductos, precio
from producto p right join fabricante f
on f.codigo=p.codigo_fabricante and p.precio>=220
group by f.nombre
order by nproductos desc;

-- B) 1º left join luego where (con el on y where separados)
select distinct f.nombre, precio
from producto p right join fabricante f
on f.codigo=p.codigo_fabricante
where p.precio>=220;

-- Finalmente la solución: con group by
select distinct f.nombre, count(p.codigo) as nproductos, precio
from producto p right join fabricante f
on f.codigo=p.codigo_fabricante and p.precio>=220
group by f.nombre
order by nproductos desc;


-- 28. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos
-- es superior a 1000 €.
select f.nombre, sum(precio)
from producto p right join fabricante f
on f.codigo=p.codigo_fabricante
group by p.codigo_fabricante
having sum(precio)>1000;


-- 29. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe
-- tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar
-- vordenado alfabéticamente de menor a mayor por el nombre del fabricante.
select p.nombre, max(precio), f.nombre
from producto p right join fabricante f
on f.codigo=p.codigo_fabricante
group by f.nombre
order by f.nombre asc;



