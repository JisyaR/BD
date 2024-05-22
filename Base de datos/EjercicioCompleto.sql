create database EmpresaXY;

use EmpresaXY;

create table Cliente(
	id_cliente int primary key,
	nombre varchar(25),
	apellido varchar(25),
	telefono varchar(8) constraint DF_cliente default 'no tiene',
	edad numeric(3),
	constraint CK_cliente check(edad >=18)
);

create table Orden(
	id_orden int,
	fecha date not null, 
	producto varchar(30) not null,
	precio decimal(18,2),
	descripcion varchar(50) constraint DF_orden default 'pendiente',
	id_cliente int not null,
	constraint PK_orden primary key (id_orden),
	constraint CK_orden check (precio > 0),
	constraint FK_ordenCliente foreign key (id_cliente) references Cliente(id_cliente) on delete cascade
);
-- Extra
--Ver el valor donde inicia el valor de identity 
select IDENT_SEED('orden');
--Ver el incremento configurado en identity
select IDENT_INCR('orden');

--Activar la opcion de agregar un valor 
set identity_insert Orden ON;

--Agregar identity a tabla ya creada 
alter table Orden add num_orden int identity(100,1);

--Insertar datos 
insert into Cliente values (1, 'Daniel', 'Mejia',default, 20);
insert into Cliente values (2, 'Luis', 'Melgar','75789584', 20);
insert into Cliente values (3, 'Carla', 'Campos',default, 19);
insert into Cliente values (4, 'Gerardo', 'Mendoza',default, 21);
insert into Cliente values (5, 'Luis', 'Carranza','75757684', 50);
insert into Cliente values (6, 'Pedro', 'Rivas','65235698', 30);
insert into Cliente values (7, 'Juan', 'Diaz',default, 30);
insert into Cliente values (8, 'Maria', 'Rivas','65237898', 30);
insert into Cliente values (9, 'Felix', 'Varela','65895674', 35);
insert into Cliente values (10, 'Marina', 'Silva','65893512', 35);

insert into Orden values (1,'2024-04-29','Laptop',500.2, default,1);
insert into Orden values (2,'2024-04-30','Celular', 306.3, default, 1);
insert into Orden values (3,'2024-02-05','Ipad', 250.50, default, 2);
insert into Orden values (4,'2024-01-05','Ipad', 250.50, default, 5);
insert into Orden values (5,'2024-01-05','SmartWatch', 305, default, 3);

--Borrar combinando clausula where y operadores in
delete from cliente where id_cliente in (4,10)
-- Actualizar  combinar where, in, operadores comparativos
update Cliente set telefono = 'no tiene' where id_cliente in(4,10);
-- Seleccionar todos los campos sin condicion
select * from orden;
-- Seleccion algunos campos sin condicion
select nombre, apellido from Cliente;
--NULL/NOT NULL
select id_cliente, apellido, telefono from cliente where telefono is null; ;
--Order by 
select * from orden order by precio desc;
-- Distinct 
select distinct edad from cliente;
-- Between 
select nombre, apellido,edad from cliente where edad >=30 and edad <=50
select nombre, apellido, edad from cliente where edad between 30 and 50 order by nombre;
 --TOP
select top 5 * from cliente where edad between 20 and 30;
-- Like 
select * from cliente where nombre like 'c%';
select * from cliente where nombre like '%n';
select * from cliente where nombre not like '%n';
select * from cliente where nombre like '%ar%';
select * from cliente where nombre like 'D_n_%';
select * from cliente where nombre like '[a-f]%'
select * from cliente where nombre like '[^a-c]%';






