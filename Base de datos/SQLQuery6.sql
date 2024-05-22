--poner en uso una base de datos
use Prueba;
--modificar
alter database Prueba modify name = Principal;
--eliminar una base de datos
drop database Principal;
--create table
 create table Alumno(
id_alumno int not null,
nombre varchar(20)null,
fechaNacimiento date,
edad numeric(3)
);

--establecer primary key
alter table Alumno add constraint PK_Alumno primary key (id_alumno);
--modificar not nul
alter table Alumno alter column id_alumno int not  null;
-- agregar un campo a un tabla ya creada
alter table Alumno add sexo char(1);
--borrar un campo de una tabla existente
alter table Alumno drop column sexo;
--detalles de una tabla 
exec sp_help Alumno;

