/*Lote materia prima 
Que el nombre del lote este entre la A-L.
Que haya sido comprado por el empleado llamado Dylan.
Si el precio del lote es el precio máximo de todos los lotes
Muestra mensaje de "Es el lote más costoso."
Si el precio es mayor al promedio muetra "Es un lote costoso, pero no 
                                        el más caro."
Si es menor al promedio muestra "Es un lote barato en comparación al promedio."
Que esten ordenados por Precio*/

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

/* Buscar los lotes de producción que fueron comprados después del 3 de cada mes, organizado por mes.
Se debe ver el nombre del lote, el mes en el que se compró y la información del proceso en el que fue utilizado */

SELECT MesCompra 'Mes de Compra', NombreLote 'Nombre del lote', FechaProceso 'Fecha de procesamiento', DescripcionProceso 'Descripción del proceso',
      TipoPrenda 'Tipo de la prenda', LotePrenda 'Lote de prenda', TipoMaterial 'Tipo de material'
    FROM (
        SELECT
          CASE  WHEN MONTH(Co.Fecha_de_Compra) = 1 THEN 'Enero'
                WHEN MONTH(Co.Fecha_de_Compra) = 2 THEN 'Febrero'
                WHEN MONTH(Co.Fecha_de_Compra) = 3 THEN 'Marzo'
                WHEN MONTH(Co.Fecha_de_Compra) = 4 THEN 'Abril'
                WHEN MONTH(Co.Fecha_de_Compra) = 5 THEN 'Mayo'
                WHEN MONTH(Co.Fecha_de_Compra) = 6 THEN 'Junio'
                WHEN MONTH(Co.Fecha_de_Compra) = 7 THEN 'Julio'
                WHEN MONTH(Co.Fecha_de_Compra) = 8 THEN 'Agosto'
                WHEN MONTH(Co.Fecha_de_Compra) = 9 THEN 'Septiembre'
                WHEN MONTH(Co.Fecha_de_Compra) = 10 THEN 'Octubre'
                WHEN MONTH(Co.Fecha_de_Compra) = 11 THEN 'Noviembre'
                WHEN MONTH(Co.Fecha_de_Compra) = 12 THEN 'Diciembre'
                END  AS MesCompra,
          LMP.NombreLoteMP AS NombreLote,
        PP.Fecha AS FechaProceso, PP.DescripcionProceso AS DescripcionProceso,
        TP.NombreTipoPrenda AS TipoPrenda, LP.NombreLotePrenda AS LotePrenda, TMP.NombreTipoMP TipoMaterial
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
        WHERE DAY(Co.Fecha_de_Compra) > 3
        GROUP BY LMP.ID_Lote_MP)Tabla0
ORDER BY MesCompra;


