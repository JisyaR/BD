--Crear base de datos
create database Autobus_tur

use Autobus_tur
--Creacion de tablas
create table PASAJERO(
passaporte int primary key not null,
nombre varchar(30),
fecha_nacimiento date,
telefono varchar(30)
)
create table PAIS(
id_pais int primary key ,
nombre varchar(30)
)
create table CUIDAD(
id_ciudad int primary key ,
nombre varchar(30)
)
create table TERMINAL(
id_terminal int primary key,
nombre varchar(30)
)
create table RESERVA(
id_reserva int primary key,
precio decimal (18,2),
fecha date
)
create table EXCURSION(
id_excursion int primary key,
fecha date, 
id_autobusero int not null,
id_origen int not null,
id_destino int not null,
id_bus int not null
)
create table AUTOBUSERO(
id_autobusero int primary key,
nombre varchar(30)
)
create table TIPO_ASIENTO(
id_tipo_asiento int primary key,
nombre varchar(30)
)
create table RESERVAXSERVICIO(
id_reserva int not null,
id_servicio int not null
)
create table SERVICIO(
id_servicio int primary key,
nombre varchar(30),
precio varchar(30)
)
create table BUS(
matricula int primary key,
capacidad varchar(30),
id_modelo int not null 
)
create table MODELO(
id_modelo int primary key,
nombre varchar(30),
id_fabricante int not null
)
create table FABRICANTE(
id_fabricante int primary key ,
nombre varchar(30)
)
--Agregar las llaves foreanas tabla terminal
alter table TERMINAL add id_cuidad int not null
alter table TERMINAL add id_pais int not null
alter table TERMINAL add constraint FK_terminal foreign key (id_cuidad) references CUIDAD(id_ciudad)
alter table TERMINAL add constraint FK_terminalP foreign key (id_pais) references PAIS(id_PAIS)
--Agregar llave forania tabla modelo
alter table MODELO add constraint FK_Modelo foreign key (id_fabricante) references FABRICANTE(id_fabricante)
--agregar llave forania tabla bus 
alter table BUS add constraint FK_bus foreign key (id_modelo) references MODELO(id_modelo)
-- agregar llave foania tabla pasejero 
alter table PASAJERO add constraint FK_pasajero foreign key (id_pais) references PAIS(id_pais)
--reserva llave forania tabla reserva
alter table RESERVA add constraint FK_reservata foreign key (id_tipo_asiento) references TIPO_ASIENTO(id_tipo_asiento)
alter table RESERVA add constraint FK_reservaex foreign key (id_excursion) references EXCURSION(id_excursion)
alter table RESERVA add constraint FK_reservapa foreign key (id_pasajero) references PASAJERO(passaporte)
--Llaves foreanas EXcursion
alter table EXCURSION add constraint FK_excursionauto foreign key (id_autobusero) references AUTOBUSERO(id_autobusero)
alter table EXCURSION add constraint FK_excursionbus foreign key (id_bus) references BUS(matricula)
alter table EXCURSION add constraint FK_excursionorigen foreign key (id_origen) references TERMINAL(id_terminal)
alter table EXCURSION add constraint FK_excursiondesstino foreign key (id_destino) references TERMINAL(id_terminal)
--RESERVAXSERVICIO
alter table RESERVAXSERVICIO add primary key  (id_reserva,id_servicio)
-- agregar
insert into FABRICANTE(id_fabricante,nombre)
values(1,'China'),
(2,'USA'),
(3,'Ecotech'),
(4,'Mesii'),
(5,'Draigon')

insert into SERVICIO(id_servicio,nombre,precio)
values(1,'premium','20'),
(2,'basico','10'),
(3,'normal','5'),
(4,'Premium','20'),
(5,'Basico','10')

insert into TIPO_ASIENTO(id_tipo_asiento,nombre)
values(1,'premium'),
(2,'basico'),
(3,'nomral'),
(4,'Ultrapremium'),
(5,'MADRID')
insert into PAIS(id_pais,nombre)
values(1,'Polonia'),
(2,'El salvador'),
(3,'Alemania'),
(4,'Marruecos'),
(5,'FRANCIA')
insert into CUIDAD(id_ciudad,nombre)
VALUES (1,'San salvador'),
(2,'APOPA'),
(3,'Santa tecla'),
(4,'merliot'),
(5,'Louerdes')
