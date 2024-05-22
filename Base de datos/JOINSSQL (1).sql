create database EmpresaXYZ;

use EmpresaXY;

create table Pais(
	id_pais int primary key identity,
	nombre varchar(30)
);


create table Cliente(
	id_cliente int primary key,
	nombre varchar(25),
	apellido varchar(25),
	telefono varchar(8) constraint DF_cliente default 'no tiene',
	edad numeric(3),
	id_pais int,
	constraint FK_ClientePais foreign key (id_pais) references Pais(id_pais) on delete cascade,
	constraint CK_cliente check(edad >=18)
);

create table Orden(
	id_orden int,
	fecha date not null, 
	producto varchar(30) not null,
	precio decimal(18,2),
	descripcion varchar(50) constraint DF_orden default 'pendiente',
	id_cliente int not null,
	num_orden int identity(100,1),
	constraint PK_orden primary key (id_orden),
	constraint CK_orden check (precio > 0),
	constraint FK_ordenCliente foreign key (id_cliente) references Cliente(id_cliente) on delete cascade
);

--Insertar datos 
insert into Pais values('El Salvador');
insert into Pais values('Colombia');
insert into Pais values('Peru');
insert into Pais values('Estados Unidos');
insert into Pais values('Mexico');
insert into Pais values('Costa Rica');
insert into Pais values('Francia');
insert into Pais values('Alemania');

insert into Cliente values (1, 'Daniel', 'Mejia',default, 20,1);
insert into Cliente values (2, 'Luis', 'Melgar','75789584', 20,1);
insert into Cliente values (3, 'Carla', 'Campos',default, 19, 2);
insert into Cliente values (4, 'Gerardo', 'Mendoza',default, 21, 3);
insert into Cliente values (5, 'Luis', 'Carranza','75757684', 50, 4);
insert into Cliente values (6, 'Pedro', 'Rivas','65235698', 30, 5);
insert into Cliente values (7, 'Juan', 'Diaz',default, 30, 1);
insert into Cliente values (8, 'Maria', 'Rivas','65237898', 30, 2);
insert into Cliente values (9, 'Felix', 'Varela','65895674', 35, 3);
insert into Cliente values (10, 'Marina', 'Silva','65893512', 35, 4);
insert into Cliente values (11, 'Karina', 'Parada','22891022', 51, null);


insert into Orden values (1,'2024-04-29','Laptop',500.2, default,1);
insert into Orden values (2,'2024-04-30','Celular', 306.3, default, 1);
insert into Orden values (3,'2024-02-05','Ipad', 250.50, default, 2);
insert into Orden values (4,'2024-01-05','Ipad', 250.50, default, 5);
insert into Orden values (5,'2024-01-05','SmartWatch', 305, default, 3);
insert into Orden values (6,'2024-04-30','Case',20, default,1);



-- Alias 
--Alias a columnas utilizando as
select id_cliente as id from cliente;
--Alias a tablas sin as
select id_cliente as id from Cliente  c where c.id_cliente = 2;

-- JOINS SQL
--INNER JOIN
select  c.id_cliente, o.id_cliente, c.nombre from cliente c inner join orden o on c.id_cliente = o.id_cliente;
select  c.id_cliente, p.nombre from cliente c inner join pais p on c.id_pais = p.id_pais;

-- LEFT JOIN
select  c.id_cliente, p.nombre as pais, c.nombre from cliente c left join pais p on c.id_pais = p.id_pais where p.id_pais is null;
select  c.id_cliente, p.nombre as pais, c.nombre from cliente c left join pais p on c.id_pais = p.id_pais;

-- RIGHT JOIN
select  c.id_cliente, p.nombre from cliente c right join pais p on c.id_pais = p.id_pais where c.id_pais is null;
select  c.id_cliente, p.nombre from cliente c right join pais p on c.id_pais = p.id_pais;
select orden.id_orden, cliente.id_cliente,cliente.nombre from cliente right join orden on cliente.id_cliente = orden.id_cliente;

-- FULL OUTER JOIN
select  c.id_cliente, c.nombre, p.nombre as pais from cliente c full outer join pais p on c.id_pais = p.id_pais;
select  c.id_cliente, c.nombre, p.nombre as pais from cliente c full outer join pais p on c.id_pais = p.id_pais where c.id_pais is null or p.id_pais is null;




