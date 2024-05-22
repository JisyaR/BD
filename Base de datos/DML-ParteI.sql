--DML - Lenguaje de Manipulación de Datos

--Insertar datos
insert into salarios values (valor1, valor2, valor3);

insert into Persona (id_persona, clave, nombre, edad,ciudad) values(valor1, valor2, valor3, valor4, valor5);

--Insertar datos de una tabla a otra 
insert into salarios(nombre, apellido, salario) select nombre, apellido, salario from Empleados;

--Insertar datos de una tabla a otra con filtro
insert into salarios(nombre, apellido, salario) select nombre, apellido, salario from Empleados where salario > 2500.00;

--Insertar registros con un constraint default
insert into Persona (id_persona, clave, nombre, edad,ciudad) values(valor1, valor2, valor3, valor4, default);
insert into Persona values (valor1, valor2, valor3, valor4, default)

--Seleccionar todos los campos
select * from Empleados;

--Seleccionar un campo 
select nombre from Empleados;

--Borrar un registro por filtro
delete from Empleados where id_empleado = 1;

--Actualizar un registro
update Empleados set telefono = 78987678 where id = 2;

--Actualizar en cascada 
update Empleados set activo = 'SI';

--Actualizar algunos registros 
update Empleados set activo = 'NO' where id in(2,4,6,7,11,15);

--Seleccionar todos los registros con filtro
select * from Empleados where nombre = 'Marlen';
select * from Empleados where id in(2,4,1,5,10);

--Seleccionar los primeros valores 
select top 5 * from Empleados;
select top 50 percent * from Empleados;
select top 3 * from Empleados where activo = 'SI';

--Seleccionar con filtro NULL
select * from Clientes where nombre is null;
select * from Clientes where nombre is not null;

--Seleccionar valores repetidos
 select distinct pais from Clientes;
 select distinct * from Clientes where pais = 'Argentina';

 --Consultar valores nulos 
 select distinct (pais) from Clientes where compras is null;

--Ordenar de forma descendente y ascendente 
select * from Products order by Price;
select * from Products order by Price desc;
