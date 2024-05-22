USE Excursion_Laboratorio04;
--EJERCICIO 2
Select nombre from MODELO
--EJERCICIO 6
select l.nombre from PAIS as l inner join TERMINAL as e ON l.id = e.id_pais
--EJERCICIO 12
SELECT t.id AS id_excursion,(SELECT COUNT(*) FROM RESERVA j WHERE j.id_excursion = t.id) AS reservaRE, b.capacidad AS capacidad,
 b.capacidad - (SELECT COUNT(*) FROM RESERVA j WHERE j.id_excursion = t.id) AS capacidadis FROM EXCURSION t INNER JOIN BUS b ON t.id_bus = b.id


