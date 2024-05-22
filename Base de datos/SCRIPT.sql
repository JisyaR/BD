drop database Prueba;
use Ejemplo;

create database Ejemplo;

create table Materia(
	id_materia int,
	nombre varchar(10) not null,
	uv numeric(1), 
	facultad varchar(30) default 'pendiente',
	constraint PK_materia primary key(id_materia),
	constraint CK_materia check (uv <= 4)
);

--Modificar un campo de una tabla 
alter table Materia alter column id_materia int not null;
alter table Materia add constraint PK_materia primary key(id_materia);
alter table Materia add constraint CK_materia check (uv <= 4);
alter table Materia add constraint DF_materia default 'pendiente' for facultad;

insert into Materia(id_materia, nombre, uv) values( 4, 'F1', 4);
insert into Materia values (1,'C2', 4, 'FIA');
select * from Materia;
drop table Materia;


