use test;
create table fechas(
id int auto_increment primary key,
fecha date
);
insert into fechas values (default, curdate());

select * from fechas ;
UPDATE fechas SET fecha=fecha+1
WHERE fecha=curDATE();

