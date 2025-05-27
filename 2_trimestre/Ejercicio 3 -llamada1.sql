use empleados;
select * from empleado;
select * from departamento;

# si selecciono todo hace el producto cartesiano (7*13=91 cruces) así que seleccionamos
select * from empleado, departamento;

#esto está en sintaxis sql1 y lo siguiente en sql2, contenido ha de ser el mismo con inner join...
select * from empleado, departamento 
where empleado.id_departamento=departamento.id;

select * from empleado inner join departamento
on empleado.id_departamento = departamento.id;

select * from empleado left join departamento #completa con null y selecciona los mismos, todos los registros de la tabla izq.
on empleado.id_departamento = departamento.id;

select * from empleado right join departamento #completa con null y selecciona todos los registros de la tabla der.
on empleado.id_departamento = departamento.id;

select * from empleado cross join departamento; #todos con todos

select * from departamento join empleado


