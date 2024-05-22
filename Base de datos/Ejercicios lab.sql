use Excursion_Laboratorio04
-- Obt�n todos los nombres de pa�ses almacenados en la base de datos.
SELECT nombre FROM PAIS;
-- Muestra los nombres de todos los modelos de autobuses registrados.
SELECT nombre FROM MODELO;
-- Encuentra todas las excursiones que est�n programadas para salir el 2024-09-25 10:15:00.
SELECT * FROM EXCURSION WHERE fecha_salida = '2024-09-25 10:15:00';
-- Lista los precios de todos los servicios disponibles.
SELECT precio FROM SERVICIO;
-- Muestra las matr�culas de todos los autobuses registrados.
SELECT matricula FROM BUS;
-- Encuentra los pa�ses que tienen al menos una terminal asociada
SELECT PAIS.nombre FROM PAIS INNER JOIN TERMINAL ON PAIS.id = TERMINAL.id_pais WHERE TERMINAL.id_pais IS NOT NULL;
-- Recupera todas las reservas hechas por un pasajero en el 2023-07-16.
SELECT * FROM RESERVA WHERE fecha = '2023-07-16';
-- Muestra los fabricantes que tienen al menos un modelo de autob�s registrado.
SELECT FABRICANTE.nombre FROM FABRICANTE INNER JOIN MODELO ON FABRICANTE.id = MODELO.id_fabricante;
-- Recupera los nombres de todos los pasajeros y sus pa�ses de origen.
SELECT PASAJERO.nombre, PAIS.nombre FROM PASAJERO INNER JOIN PAIS ON PASAJERO.id_pais = PAIS.id;
-- Encuentra los pa�ses que no tienen ninguna terminal asociada
SELECT PAIS.nombre FROM PAIS LEFT JOIN TERMINAL ON PAIS.id = TERMINAL.id_pais WHERE TERMINAL.id IS NULL;
-- Consulta de pasajeros sin reservas
SELECT PASAJERO.nombre FROM PASAJERO LEFT JOIN RESERVA ON PASAJERO.id = RESERVA.id_pasajero WHERE RESERVA.id_pasajero IS NULL;
-- Encuentra todas las excursiones que tienen capacidad disponible para al menos un pasajero.
SELECT EXCURSION.id AS 'ID', COUNT(RESERVA.id) AS 'Reservas realizadas', BUS.capacidad AS 'Capacidad',
BUS.capacidad-COUNT(RESERVA.id) AS 'Capacidad disponible'
FROM EXCURSION INNER JOIN BUS ON EXCURSION.id_bus = BUS.id
LEFT JOIN RESERVA ON EXCURSION.id = RESERVA.id_excursion 
GROUP BY EXCURSION.id, BUS.capacidad HAVING BUS.capacidad>COUNT(RESERVA.id);
-- Muestra todas las reservas con los servicios asociados para cada reserva.
SELECT SERVICIOXRESERVA.id_reserva, SERVICIO.nombre, SERVICIO.precio FROM SERVICIOXRESERVA 
INNER JOIN SERVICIO on SERVICIOXRESERVA.id_servicio = SERVICIO.id;
-- Encuentra el autobusero que tiene asignado el mayor n�mero de excursiones.
SELECT AUTOBUSERO.nombre AS 'Nombre', COUNT(EXCURSION.id) AS Total FROM AUTOBUSERO 
INNER JOIN EXCURSION on AUTOBUSERO.id = EXCURSION.id_autobusero GROUP BY AUTOBUSERO.nombre
HAVING COUNT(EXCURSION.id) = (SELECT MAX(Total) FROM (SELECT COUNT(EXCURSION.id) AS 'Total' 
FROM EXCURSION GROUP BY EXCURSION.id_autobusero) SUB);
-- Muestra todas las reservas que incluyen pasajeros con m�s de 60 a�os de edad.
SELECT RESERVA.id AS 'ID reserva', PASAJERO.nombre, PASAJERO.fecha_nacimiento FROM RESERVA 
INNER JOIN PASAJERO ON RESERVA.id_pasajero = PASAJERO.id 
GROUP BY RESERVA.id, PASAJERO.nombre, PASAJERO.fecha_nacimiento
HAVING (YEAR(GETDATE())-YEAR(PASAJERO.fecha_nacimiento))>60;

-- Cada reserva tiene una fecha en la que fue realizada, 
-- una solicitud del departamento de finanzas del consorcio requiere la ganancia del mes de agosto de 2023, 
-- pero los datos deben estar organizados por d�as. 
-- Como parte de la solicitud, se requiere que la fecha sea mostrada en un formato especial 
-- (ver imagen de vista esperada).
-- Para calcular el valor de una reserva se debe tomar en cuenta 
-- tanto el precio de la reserva como la suma de todos los servicios extras incluidos.
-- Sugerencia : Investigar sobre la instrucci�n CONVERT y su utilizaci�n en la instrucci�n SELECT.
SELECT CONVERT(varchar, fecha, 6) as "Fecha", 
RESERVA.precio + SUM(ISNULL(SERVICIO.precio, 0.00)) AS "Ganancia del d�a" 
FROM RESERVA LEFT JOIN SERVICIOXRESERVA ON RESERVA.id = SERVICIOXRESERVA.id_reserva 
LEFT JOIN SERVICIO ON SERVICIOXRESERVA.id_servicio = SERVICIO.id WHERE MONTH(Fecha) = 8 
GROUP BY fecha, RESERVA.PRECIO;


-- 18.
SELECT RESERVA.id AS 'ID reserva', RESERVA.fecha AS 'Fecha', 
TIPO_ASIENTO.id AS 'ID asiento', 
TIPO_ASIENTO.nombre AS 'nombre asiento',
RESERVA.precio + SUM(ISNULL(SERVICIO.precio, 0.00)) AS 'Total (Sin impuesto)',
CASE
	WHEN TIPO_ASIENTO.nombre = 'Normal' THEN RESERVA.precio + SUM(ISNULL(SERVICIO.precio, 0.00))+(RESERVA.precio + SUM(ISNULL(SERVICIO.precio, 0.00)))*(0.07)
	WHEN TIPO_ASIENTO.nombre = 'Premium' THEN RESERVA.precio + SUM(ISNULL(SERVICIO.precio, 0.00))+(RESERVA.precio + SUM(ISNULL(SERVICIO.precio, 0.00)))*(0.11)
	WHEN TIPO_ASIENTO.nombre = 'Vip' THEN RESERVA.precio + SUM(ISNULL(SERVICIO.precio, 0.00))+(RESERVA.precio + SUM(ISNULL(SERVICIO.precio, 0.00)))*(0.15)
	WHEN TIPO_ASIENTO.nombre = 'Lujo' THEN RESERVA.precio + SUM(ISNULL(SERVICIO.precio, 0.00))+(RESERVA.precio + SUM(ISNULL(SERVICIO.precio, 0.00)))*(0.20)
	WHEN TIPO_ASIENTO.nombre = 'Ejecutivo' THEN RESERVA.precio + SUM(ISNULL(SERVICIO.precio, 0.00))+(RESERVA.precio + SUM(ISNULL(SERVICIO.precio, 0.00)))*(0.25)
END AS 'Total (con impuesto aplicado)'
FROM RESERVA INNER JOIN TIPO_ASIENTO ON RESERVA.id_tipo_asiento = TIPO_ASIENTO.id
LEFT JOIN SERVICIOXRESERVA ON RESERVA.id = SERVICIOXRESERVA.id_reserva 
LEFT JOIN SERVICIO ON SERVICIOXRESERVA.id_servicio = SERVICIO.id
GROUP BY RESERVA.id, RESERVA.fecha, TIPO_ASIENTO.id, TIPO_ASIENTO.nombre, RESERVA.precio;