use Chinook

select * from Album
select * from Album where Title like '%r'
select * from Album where Title like '%j%'
select * from Album where Title like '%[a-f]'
select * from Album where Title like '%[^a-f]'

use Hotel
select * from Habitacion
select * from Hotel

insert into Habitacion(id_habitacion,numero,precio,id_hotel)values
(9,'50',5),
('8','100',8),
('5','70',5),
('4','80',6)


update Habitacion set precio = 10 where numero in(3,2)
select * from Hotel where nombre like '%ma%'
select * from Habitacion where precio between 50 and 100 order by precio
select distinct precio from Habitacion
set identity_insert Hotel on
alter table Hotel add id_Hotel int identity




