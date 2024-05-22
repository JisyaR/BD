--Restricciones - Constraints

--Crear una tabla estableciendo nulos y no nulos
create table Alumno(
	id_alumno int null, 
	nombre varchar (10) not null,
	apellido varchar(20)  not null,
	direccion varchar(100) not null,
	telefono numeric(10) null,
	correo varchar(50) null
);

--Modificar un atributo not null/null 
alter table Alumno alter column id_alumno int not null

--Crear tabla con llave primaria PK - Forma 1
create table Persona(
	id_persona int primary key,
	nombre varchar(10) not null, 
	edad int
);

--Crear tabla con llave primaria PK - Forma 2
create table Persona(
	id_persona int,
	nombre varchar(10) not null, 
	edad int,
	primary key(id_persona)
);

--Crear tabla con llave primaria PK- - Forma 3
create table Persona(
	id_persona int,
	nombre varchar(10) not null, 
	edad int,
	constraint PK_PERSONA primary key (id_persona)
);

--Agregar una regla ya creada la tabla siempre y cuando el campo para PK sea no nulo
alter table Persona add constraint PK_PERSONA primary key (id_persona);

--Borrar la llave primaria PK 
alter table Persona drop constraint PK_PERSONA;



--Crear tabla con unique - Forma 1
create table Persona(
	id_persona int not null unique,
	nombre varchar(10) not null, 
	edad int not null
);

--Crear tabla con unique - Forma 2
create table Persona(
	id_persona int not null,
	clave varchar (10),
	nombre varchar(10) not null, 
	edad int not null
	constraint UQ_IDPERSONA unique(id_persona),
	constraint UQ_CLAVEPERSONA unique(clave)
);


--Crear tabla con check - Forma 1
create table Persona(
	id_persona int not null,
	clave varchar (10),
	nombre varchar(10) not null, 
	edad int not null,
	check (edad >= 18)
);

--Crear tabla con check - Forma 2
create table Persona(
	id_persona int not null,
	clave varchar (10),
	nombre varchar(10) not null, 
	edad int not null check (edad >=18)
);

--Crear tabla con check - Forma 3
create table Persona(
	id_persona int not null,
	clave varchar (10),
	nombre varchar(10) not null, 
	edad int not null,
	constraint CK_edad check (edad >= 18)
);


--Crear tabla con valor por defecto - Forma 1
create table Persona(
	id_persona int not null,
	clave varchar (10),
	nombre varchar(10) not null, 
	edad int not null,
	ciudad varchar(50) default 'no tiene'
);

--Crear tabla con valor por defecto - Forma 2
create table Persona(
	id_persona int not null,
	clave varchar (10),
	nombre varchar(10) not null, 
	edad int not null,
	ciudad varchar(50) constraint DF_materia default 'no tiene'
);

--Agregar una regla de configuracion UNIQUE
alter table Persona add constraint UQ_PERSONA unique (id_persona);

--Borrar UNIQUE
alter table Persona drop constraint UQ_PERSONA;

--Agregar una regla de configuracion CHECK
alter table Persona add constraint CK_PERSONA check (edad >= 18);

--Borrar CHECK
alter table Persona drop constraint CK_PERSONA;

--Agregar una regla de configuracion DEFAULT
alter table Persona add constraint DF_PERSONA default 'No tiene' for ciudad;

--Borrar CHECK
alter table Persona drop constraint DF_PERSONA;


