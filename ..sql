USE Taller8_0000170224;

--1. Nombres y apellidos, fecha de nacimiento y nacionalidad. TODOS

SELECT CONCAT(Nombres, ' ', Apellidos) Nombre, CONCAT(FechaNacimiento)'Fecha de Nacimiento', nacionalidad
FROM Persona LEFT OUTER JOIN Nacionalidad
ON Persona.idNacionalidad = Nacionalidad.idNacionalidad;


--1.2 Nombres y apellidos, Fecha de nacimiento, nacionalidad. Nombre empieza con G y apellido incluye O

SELECT CONCAT(Nombres, ' ', Apellidos) Nombre, CONCAT(FechaNacimiento)'Fecha de Nacimiento', nacionalidad
FROM Persona LEFT OUTER JOIN Nacionalidad
ON Persona.idNacionalidad = Nacionalidad.idNacionalidad
WHERE Persona.Nombres LIKE 'G%'
AND Persona.Apellidos LIKE '%o%';

--1.3 Nombres y apellidos, fecha de nacimiento y nacionalidad. TODOS-Ordenado por Nombre

SELECT CONCAT(Nombres, ' ', Apellidos) Nombre, CONCAT(FechaNacimiento)'Fecha de Nacimiento', nacionalidad
FROM Persona LEFT OUTER JOIN Nacionalidad
ON Persona.idNacionalidad = Nacionalidad.idNacionalidad
ORDER BY Nombres;


--1.4.Nombres y apellidos, fecha de nacimiento y nacionalidad. TODOS-Ordenado por Nacionalidad

SELECT CONCAT(Nombres, ' ', Apellidos) Nombre, CONCAT(FechaNacimiento)'Fecha de Nacimiento', nacionalidad
FROM Persona LEFT OUTER JOIN Nacionalidad
ON Persona.idNacionalidad = Nacionalidad.idNacionalidad
ORDER BY Nacionalidad.Nacionalidad;

--2. Nombres y apellidos, nacionalidad, Campo

SELECT CONCAT(Nombres, Apellidos) Nombre, Nacionalidad, Campo
FROM Nacionalidad N NATURAL JOIN Persona Pna
NATURAL JOIN Premiado Piado
NATURAL JOIN Premio Pmio NATURAL JOIN Campo C;

--3.Nombres y apellidos, Fecha de Nacimiento. Persona más Joven en recibir el nóbel

SELECT CONCAT(Nombres, ' ', Apellidos) Nombre, MAX(FechaNacimiento)
FROM Premiado NATURAL JOIN Persona;


--4.Lista de países con premios Nóbel Recibidos

SELECT Nacionalidad, COUNT(idPremio)
  FROM Nacionalidad N NATURAL JOIN Persona Pna
  LEFT OUTER JOIN Premiado Piado ON Pna.idPersona = Piado.idPersona
  GROUP BY (N.idNacionalidad);

--5.Nombre y apellidos, categoría de premio; Personas que nacieron en Agosto

SELECT CONCAT(Nombres,' ',Apellidos), Campo
  FROM Persona NATURAL JOIN Premiado
  NATURAL JOIN Premio
  NATURAL JOIN Campo
  WHERE Persona.FechaNacimiento LIKE '%-08-%';

-- 6. Nombres y apellidos y nacionalidad de las personas que nunca hayan recibido un premio nóbel

SELECT CONCAT(Nombres,' ',Apellidos)Nombre, Nacionalidad
FROM Nacionalidad N NATURAL JOIN Persona Pna
LEFT OUTER JOIN Premiado Piado ON Pna.idPersona = Piado.idPersona
WHERE idPremio IS NULL;

-- 7. Promedio de edad por país

SELECT Nacionalidad, AVG(YEAR(CURRENT_DATE) - YEAR(FechaNacimiento)) Edad_Promedio
FROM Persona P NATURAL JOIN Nacionalidad
GROUP BY idNacionalidad;

-- 8. Nombres y Apellidos, nacionalidad. Personas nacidas entre 1950 - 1975

SELECT CONCAT(Nombres,' ',Apellidos)Nombre, Nacionalidad
FROM Persona NATURAL JOIN Nacionalidad
WHERE YEAR(FechaNacimiento) BETWEEN 1950 AND 1975;

-- 9. Actualizar los datos de Juan Carlos Pérez. Nombre: Juan; FechaNacimiento: 1975-04-10
UPDATE Persona SET Nombres = 'Juan', FechaNacimiento = '1975-04-10'
WHERE Nombres LIKE 'Juan Carlos' AND Apellidos LIKE '%Pérez%';

-- 10.Consulta que elimine a los Chinos

DELETE FROM Premiado
WHERE idPersona = (SELECT idPersona FROM Persona NATURAL JOIN Nacionalidad WHERE Nacionalidad LIKE 'China');
DELETE FROM Persona
WHERE idNacionalidad = (SELECT idNacionalidad FROM Nacionalidad WHERE Nacionalidad LIKE 'China');
