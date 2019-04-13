/*Lote materia prima 
Que el nombre del lote este entre la A-L 
Que haya sdo comprado por el empleado llamado Dylan
Que esten ordenados por */

SELECT LMP.NombreLoteMP AS 'Nombre del Lote' , Co.Fecha_de_Compra AS 'Fecha de Compra',
LMP.Precio AS 'Precio del Lote',
(CASE
        WHEN LMP.Precio = 
        (SELECT MAX(Precio)
        FROM Lote_Materia_Prima)
            THEN 'Es el lote más costoso.'
        WHEN LMP.Precio > 
        (SELECT AVG(Precio)
        FROM Lote_Materia_Prima) THEN 'Es un lote costoso, pero no el más caro.'
        ELSE 'Es un lote barato en comparacion al promedio.'
    END) AS 'Dato de precio',
     CONCAT(E.NombreEmpleado,' ', E.ApellidoEmpleado) AS 'Nombre del Empleado' ,
     Ca.NombreCargo AS 'Cargo'
FROM Lote_Materia_Prima LMP
INNER JOIN Compra Co 
ON LMP.ID_Lote_MP = Co.ID_Lote_MP
INNER JOIN Empleado E 
ON Co.ID_Empleado = E.ID_Empleado
INNER JOIN Cargo Ca 
ON Ca.ID_Cargo = E.ID_Cargo
WHERE (LMP.NombreLoteMP BETWEEN 'A%' AND 'L%') 
AND E.NombreEmpleado =
(SELECT E.NombreEmpleado 
FROM Empleado E
WHERE E.NombreEmpleado LIKE 'Dylan')
ORDER BY LMP.Precio DESC;

/*Un querry para ver el proceso de producción ocurre
en que plantas de produccion
y que muestre cuanta materia prima utiliza,
el tipo y cuantas prendas produce y el tipo*/

SELECT Co.Fecha_de_Compra AS 'Fecha de Compra', LMP.NombreLoteMP AS 'Nombre del Lote',
PP.Fecha AS 'Fecha de Procesamiento', PP.DescripcionProceso AS 'Descripcion del proceso',
TP.NombreTipoPrenda AS 'Tipo de Prenda', LP.NombreLotePrenda AS 'Lote de Prenda', TMP.NombreTipoMP 'Tipo de material'
FROM Compra Co 
INNER JOIN Lote_Materia_Prima LMP 
ON Co.ID_Lote_MP = LMP.ID_Lote_MP
INNER JOIN Tipo_Materia_Prima TMP 
ON TMP.ID_Tipo_MP = LMP.ID_Tipo_MP
INNER JOIN Proceso_de_Produccion PP 
ON PP.ID_Proceso =LMP.ID_Proceso
INNER JOIN Lote_Prenda LP 
ON LP.ID_Proceso = PP.ID_Proceso
INNER JOIN Tipo_de_Prenda TP
ON TP.ID_Tipo_Prenda = LP.ID_Tipo_Prenda
GROUP BY LMP.NombreLoteMP;


