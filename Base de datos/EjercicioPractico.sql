create database Animales;

use Animales;

create table Pais(
	codigo INT identity(1,1) PRIMARY KEY,
	nombre VARCHAR(20),
	idioma VARCHAR(20),
	moneda VARCHAR(10)
);

create table Animal (
	id int identity(1,1) PRIMARY KEY,
	nombre VARCHAR(50),
	habita VARCHAR(20),
	edad_vida_media INT,
	dieta VARCHAR(20),
	codigo INT constraint FK_AnimalPais foreign key references Pais(codigo)
);


insert into Pais (nombre, idioma ,moneda) values ('China','Mandarin', 'Yuan');  
insert into Pais (nombre, idioma, moneda) values ('Estados Unidos','Ingles' ,'Dolar');
insert into Pais (nombre, idioma, moneda) values ('Brasil','Portugues', 'Real');
insert into Pais (nombre, idioma, moneda) values ('El Salvador','Espanol', 'Dolar');
insert into Pais (nombre, idioma, moneda) values ('Mexico','Espanol', 'Peso'); 
insert into Pais (nombre, idioma, moneda) values ('Colombia','Espanol', 'Peso');
insert into Pais (nombre, idioma, moneda) values ('Francia','Frances', 'Euro');
insert into Pais (nombre, idioma, moneda) values ('Peru','Espanol', 'Sol');  
insert into Pais (nombre, idioma, moneda) values ('Rusia','Ruso' ,'Rublo'); 
insert into Pais (nombre, idioma, moneda) values ('Finlandia', 'finlandes','Euro');



insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Chacal dorado', 'jungla', 38, 'omnivoro', 1);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Dragon komodo', 'desierto', 4, 'herbivoro',1);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Elefante africano', 'desierto', 72, 'herbivoro', 1);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Bienteveo comun', 'jungla', 47, 'omnivoro', 1);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Pavo real indio', 'sabana', 29, 'carnivoro', 1);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Cangrejo', 'sabana', 12, 'herbivoro',1);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Gacela', 'jungla', 39, 'herbivoro', 2);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Potoro', 'sabana', 62, 'omnivoro', 2);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Crinifer concolor', 'desierto', 96, 'carnivoro', 2);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Halcon ferruginoso', 'sabana', 40, 'carnivoro', 2);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Piquero de cara azul', 'jungla', 45, 'omnivoro', 2);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Lugano', 'jungla', 85, 'omnivoro', 3);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Estornino pinto', 'sabana', 73, 'herbivoro', 3);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Aguila leonada', 'jungla', 74, 'herbivoro', 3);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Ardilla Richardson', 'desierto', 32, 'herbivoro',4);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Guacamaya alas verdes', 'sabana', 9, 'herbivoro', 6);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Dendrocitta vagabunda', 'sabana', 92, 'omnivoro', 6);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Coralillo', 'jungla', 81, 'carnivoro', 6);
insert into Animal (nombre, habita, edad_vida_media, dieta,codigo) values  ('Armadillo de nueve bandas', 'sabana', 55, 'omnivoro', 7);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Grulla corona negra', 'sabana', 18, 'omnivoro', 8);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Tockus leucomelas', 'sabana', 68, 'omnivoro', 9);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Lagarto de lengua azul', 'desierto', 63, 'herbivoro', 9);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Tinamou elegante crestado', 'jungla', 84, 'herbivoro', 9);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Monstruo gila', 'sabana', 1, 'carnivoro', 9);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Dragon	con volantes', 'desierto', 56, 'herbivoro', 9);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Jirafa', 'desierto', 27, 'herbivoro', null);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Oso pardo', 'jungla', 30, 'carnivoro', null);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Gallina', 'sabana', 10, 'herbivoro', null);
insert into Animal (nombre, habita, edad_vida_media, dieta, codigo) values ('Ballena', 'Oceano', 27, 'carnivoro', null);







--Actividad: 
	-- todas las columnas nuevas agregar alias
	-- si la consulta solicita nombres de animales o paises, presentarlos en mayuscula


-- Seleccionar los paises donde el idioma es espanol
select * from Pais where idioma like  '%Espanol%'
-- Seleccionar todos los registros de nombres animales que inician de la a - c 
 select * from Animal where nombre like  '[a-c]%'
-- Seleccionar todos los registros de dietas de animales que inician que tengan un patron rn_
Select nombre,dieta as registro  from Animal where dieta like '%rn%'
-- Seleccionar los nombres de los animales que son carnivoros y herbivoros
select * from Animal where dieta = 'carnivoro' or dieta = 'herbivoro'
-- Seleccionar los nombres de los animales y el nombre de pais

-- seleccionar los nombre de los paises que no tienen asignado animales
-- cantidad de animales agrupados por codigo de pais
-- cantidad de animales agrupados por dieta y condicion ser herbivoro
-- Mostar la cantidad de animales agrupados por habita  y condicion habita desierto
-- mostrar nombre del pais y cantidad de animales agrupados por nombre de pais
-- mostrar el promedio de las edades de vida media de los animales agrupados por nombre de pais
select Animal.id,Pais.codigo,Pais.nombre,avg(edad_vida_media)promedio ,Animal.nombre  from Animal inner join Pais
on Animal.id = Pais.codigo group by Animal.id,Pais.codigo,Pais.nombre,Animal.nombre order by promedio
-- Mostar la cantidad de animales agrupados por habita y que tienen una vida media menor a 10 
 select  count(id)Animales,habita from Animal where edad_vida_media < 10 group by habita









