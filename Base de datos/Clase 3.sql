create database BDVentas
use BDVentas
create table Cliente(
id_cliente int primary key,
nombre varchar(20),
apellido varchar(20)not null,
edad numeric(2),
telefono varchar (8)not null constraint DF_cliente default 'Nada',
constraint CK_cliente check (edad >=18),
);

insert into Cliente values (1,'Mario','Cardona',18,default);

select *from Cliente
create table orden(
id_orden int,
precio decimal(18,2),
fecha date,
constraint PK_orden primary key(id_orden)
constraint FK_orden foreign key (id_ciente) references 
)
alter table orden add constraint FK_ordenCliente foreign key(id_cliente) references Cliente(id_cliente)
alter table orden add id_cliente int
insert into orden values (1,20.99,'2024-04-29',1)

drop table Cliente
SELECT *from orden
delete from Cliente where id_cliente = 1;

use Hotel

alter table Habitacion add constraint CK_precio check (precio >=0)
alter table Habitacion alter column numero int not null
