create database Lab3_00211723
use Lab3_00211723

CREATE TABLE LIBRO (
    codigo int primary key not null,
    titulo varchar(50),
    isbn varchar(30),
    npaginas INT,
    id_editorial int
);

CREATE TABLE EDITORIAL (
    codigo int primary key not null,
    nombre varchar(50)
);

CREATE TABLE AUTORXLIBRO (
    codigo int identity primary key not null,
    codigo_autor int,
    codigo_libro int
);



CREATE TABLE AUTORXLIBRO (
    codigo int identity primary key not null,
    codigo_autor int,
    codigo_libro int FOREIGN KEY (codigo_libro) REFERENCES LIBRO (codigo)
);

INSERT INTO LIBRO (codigo, titulo, isbn, npaginas, id_editorial)
  VALUES (1, 'Asedio y Tormenta', '010-1', 544, 002),
    (2, 'Siempre Alice', '011-2', 300, 004),
    (3, 'Corazon de Tinta', '012-3', 500, 005);

INSERT INTO EDITORIAL (codigo, nombre)
  VALUES (002, 'Hidra'),
    (004, 'Ediciones B'),
    (005, 'Scholastic Corporation');

INSERT INTO LIBRO VALUES (5, 'La Huesped', '010-4', 644, 002);

SELECT * FROM LIBRO;
SELECT titulo FROM LIBRO;

UPDATE LIBRO SET npaginas=800
  WHERE codigo=2;
DELETE FROM LIBRO WHERE codigo=2;

DROP DATABASE Lab3_00211723;