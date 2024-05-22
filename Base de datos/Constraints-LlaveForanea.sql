-- Llave Foranea  

--Crear tabla con PK
create table Cliente(
	id_cliente int, 
	nombre varchar(20) not null,
	apellido varchar(30) not null,
	edad int not null,
	telefono varchar(8) not null,
	constraint PK_Cliente primary key (id_cliente)
);

--Crear tabla con FK - forma 1
create table Orden(
	id_orden int not null,
	articulo varchar(50) not null, 
	id_cliente int constraint FK_OrdenCliente key references Cliente(id_cliente)
);

--Crear tabla con FK - forma 2 
create table orden (
    id int not null primary key,
    numero_orden int not null,
    id_cliente int foreign key references Cliente(id_cliente)
);


--Agregar una regla FK cuando ya está creada la tabla
alter table Orden add constraint FK_OrdenCliente foreign key (id_orden) references Clientes(id_cliente);

--Borrar una FK
alter table Orden drop constraint FK_OrdenCliente;

--Habilitar on cascade para poder realizar acciones en cascada actualizaciones o borrados desde la tabla de PK
create table Orden(
	id_orden int not null,
	articulo varchar(50) not null, 
	id_cliente int
	constraint FK_OrdenCliente foreign key references Cliente(id_cliente) on delete cascade
);
