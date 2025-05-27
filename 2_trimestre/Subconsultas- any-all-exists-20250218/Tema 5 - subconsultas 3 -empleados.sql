USE empleados;

/*1. Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. 
(Sin utilizar INNER JOIN).*/
-- +1

select *
from empleado
where id_departamento = (select id
        from departamento
        where nombre = "Sistemas");
        
/*2. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene 
asignada.*/
-- +1
select nombre, presupuesto
from departamento
where presupuesto=(select max(presupuesto) from departamento);

/*3. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene 
asignada.*/
select nombre, presupuesto
from departamento
where presupuesto=(select min(presupuesto) from departamento);

/*---------------------------------------------------------------------------------------*/
-- ALL Y ANY
/*4. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene
asignada. Sin hacer uso de MAX, ORDER BY ni LIMIT.*/
-- +1 
select nombre, presupuesto
from departamento
where presupuesto>= all(select presupuesto from departamento);


/*5. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene 
asignada. Sin hacer uso de MIN, ORDER BY ni LIMIT.*/
select nombre, presupuesto
from departamento
where presupuesto<= all(select presupuesto from departamento);


/*6. Devuelve los nombres de los departamentos que tienen empleados asociados. 
(Utilizando ALL o ANY).*/
-- +1
select nombre from departamento where id = any(select id_departamento from empleado);



/*7. Devuelve los nombres de los departamentos que no tienen empleados asociados. 
(Utilizando ALL o ANY).*/

select d.nombre
from departamento d
where d.id <> all(select e.id_departamento from empleado e where e.id_departamento is not null);
                    
select d.nombre
from departamento d
where not d.id = any(select e.id_departamento from empleado e where e.id_departamento is not null);
                    
/*----------------------------------------------------------------------------------------*/                    
 -- IN Y NOT IN 
  
/*8. Devuelve los nombres de los departamentos que tienen empleados asociados. 
(Utilizando IN o NOT IN).*/
-- +1
select nombre from departamento where id in(select id_departamento from empleado);


/*9. Devuelve los nombres de los departamentos que no tienen empleados asociados. 
(Utilizando IN o NOT IN).*/


select nombre from departamento where id not in(select id from empleado where id_departamento is not null);

/*10. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando 
EXISTS o NOT EXISTS).*/

select nombre from departamento
where exists (select id_departamento from empleado where departamento.id=empleado.id_departamento);

/*negación*/
-- +1
select nombre from departamento
where not exists (select id_departamento from empleado where departamento.id=empleado.id_departamento);