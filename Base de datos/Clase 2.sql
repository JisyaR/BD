create database Ejemplo
use Ejemplo

create table Materia (
id_materia int,
nombre varchar(10),
uv numeric(1),
facultad varchar(30)

)
--modificar un campo de table 
alter table Materia alter column id_materia int not null
alter table Materia add constraint PK_materia primary key(id_materia)
alter table Materia add constraint CK_materia check (uv<=4)
alter table Materia add constraint DF_materia default 'pendiente' for facultad

insert into Materia values(3,'C2',4,'')


select * from Materia

create table Hotel

use master;

create Database Hotel

use Hotel

create table Hotel(
id_Hotel int,
nombre varchar(10),
direccion varchar(20),
telefono varchar (10) null
)
create table Habitacion(
id_habitacion int,
numero int identity,
precio varchar(10),
id_hotel int
)

alter table Hotel alter column id_Hotel int not null
alter table Hotel add constraint PK_Hotel primary key (id_Hotel)
alter table Habitacion alter column id_habitacion int not null
alter table Habitacion add constraint PK_habitacion primary key (id_habitacion)
alter table Habitacion add constraint FK_hotel foreign key (id_hotel) references Hotel(id_Hotel)
alter table Habitacion add constraint CK_precio check (precio>0)

insert into Hotel values (1,'Mariguana','El cecot',default);
insert into Hotel values (2,'Bella vist','Col.Escalon',7899-5688)
insert into Hotel values (3,'El mamitas','Puerto de la libetad',7875-9852)


insert into Habitacion values (1,'5',1)
insert into Habitacion values (2,'5',2)
insert into Habitacion values (3,'5',3)
insert into Habitacion values (4,'5',2)
insert into Habitacion values (5,'5',1)
insert into Habitacion values (6,'5',3)
insert into Habitacion values (7,'5',1)
insert into Habitacion values (8,'5',1)
insert into Habitacion values (9,'5',1)
insert into Habitacion values (10,'5',1)

