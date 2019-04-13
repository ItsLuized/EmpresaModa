-- DATOS DE EMPRESA

INSERT INTO Empresa(ID_Empresa,NombreEmpresa,NIT_Empresa,DireccionEmpresa,Telefono,EmailEmpresa)
VALUES
(1,'EdnaModa','111.222.333-4','Cra 20B No.188 A22',4568787,'ednamoda@hotmail.com');

-- DATOS CARGO

INSERT INTO Cargo(ID_Cargo,NombreCargo,DescripcionCargo)
VALUES
(1,'Diseñador','Diseña nuevas prendas'),
(0,'Comprador Senior','Se encarga de cerrar contratos'),
(2,'Comprador Junior','En proceso de aprendizaje');

-- DATOS EMPLEADO

INSERT INTO Empleado(ID_Empleado,NombreEmpleado,ApellidoEmpleado,DireccionEmpleado,ID_Empresa,ID_Cargo)
VALUES 
(0,'Juan','Pérez','Cra 13 #177',1,1),
(1,'Dylan','Navarro','Cra 13 #180',1,0),
(2,'Omar','Gómez','Cra 7 #160',1,0),
(3,'Cristian','Botero','Cra 9 #116',1,2),
(4,'Pedro Pablo','Restrepo','Cra 13 #188',1,0),
(5,'Rodrigo', 'Prieto','Cra 2 #154',1,2),
(6,'Rodrigo', 'Peña','Cra 4 #137',1,0),
(7,'Carlos', 'Villalobos','Cra 7 #197',1,2),
(8,'Juan Carlos', 'Zuleta','Cra 9 #100',1,0);

-- DATOS PROVEEDOR

INSERT INTO Proveedor(ID_Proveedor,NombreProveedor,DireccionProveedor,EmailProveedor,ID_Empresa)
VALUES
(0,'Algodon S.A.','Cra.57 #13','textiles@hotmail.com',1),
(1,'Telas','Cra.57 #13','telass@hotmail.com',1),
(2,'Hermosa Seda','Cra.39 #13','HermosaSeda@hotmail.com',1),
(3,'Linda Seda S.A.S.','Cra.20B #13','LindaSeda@hotmail.com',1),
(4,'Cuero Bogotano','Cra.7 #157','CueroBogotano@hotmail.com',1),
(5,'Botones Colombiano','Cra.9 #54','BotonesColombianos@hotmail.com',1),
(6,'Cuero Costeño','Cra.8 #188','CueroCosteño@hotmail.com',1),
(7,'Algodon Caleño','Cra.7 #160','TextCaleño@hotmail.com',1),
(8,'Buttons!.','Cra.7 #160','button@hotmail.com',1),
(9,'S.E.D.A','Cra.7 #160','SEDA@hotmail.com',1),
(10,'BOTONES','Cra.7 #161','BOT@hotmail.com',1),
(11,'BOTONISIMO','Cra.8 #177','botonisimo@hotmail.com',1),
(12,'Algodonisimo','Cra.7 #170','Algodonisimo@hotmail.com',1),
(13,'Gran Algodon','Cra.8 #185','GranA@hotmail.com',1),
(14,'Cuero Extranjero','Cra.9 #160','CE@hotmail.com',1),
(15,'Cuerisimo','Cra.8 #177','cuerisimo@hotmail.com',1),
(16,'Sedita','Cra.8 #178','sedita@hotmail.com',1);

-- DATOS PLANTA Produccion

INSERT INTO Planta_de_Produccion(ID_Planta,NIT_Planta,DireccionPlanta,ID_Empresa)
VALUES
(1,'222.333.444-5','Cra 7 #200',1),
(2,'333.444.555-6','Cra 7 #188',1),
(3,'444.555.666-7','Cra 7 #180',1);

-- DATOS BODEGA
INSERT INTO Bodega(ID_Bodega,DireccionBodega,DescripcionBodega)
VALUES
(1,'Cra 7 #155','Bodega 1'),
(2,'Cra 7 #155','Bodega 2'),
(3,'Cra 7 #155','Bodega 3');

-- DATOS TIPO DE MATERIA PRIMA
INSERT INTO Tipo_Materia_Prima(ID_Tipo_MP,NombreTipoMP,DescripcionMP)
VALUES
(1,'Seda','Material 1'),
(2,'Algodon','Material 2'),
(3,'Cuero', 'Material 3'),
(4,'Botones', 'Materia 4');

-- DATOS PROCESO DE PRODUCCION
INSERT INTO Proceso_de_Produccion(ID_Proceso,Fecha,DescripcionProceso,ID_Planta)
VALUES
(1,'2019-06-10','Proceso para hacer medias',2),
(2,'2019-06-11','Proceso para hacer pantalones',1),
(3,'2019-06-12','Proceso para hacer camisetas',1),
(4,'2019-06-13','Proceso para hacer shorts',3);

-- DATOS LOTE MATERIA PRIMA

INSERT INTO Lote_Materia_Prima(ID_Lote_MP,NombreLoteMP,Precio,ID_Tipo_MP,ID_Bodega,ID_Proceso)
VALUES
(1,'Ponge',12000,1,1,1),
(2,'Bourrette',1355,1,2,3),
(3,'Shantung',18400,1,1,3),
(4,'Gusano',2050,1,3,1),
(5,'Egipcio',7286,2,1,1),
(6,'Chino',17489,2,2,3),
(7,'Japones',6793,2,1,4),
(8,'Chileno',49078,2,3,3),
(9,'Vaca',3211,3,1,2),
(10,'Cerdo',18872,3,2,2),
(11,'Chivo',12000,3,1,4),
(12,'Cordero',32400,3,3,2),
(13,'Poliester',52300,4,1,2),
(14,'Metal',9780,4,2,2),
(15,'Madera',87600,4,1,3),
(16,'Plastico',23100,4,3,4);

INSERT INTO Compra(ID_Proveedor,ID_Lote_MP,ID_Empleado,Fecha_de_Compra)
VALUES 
(1,1,3,'2019-05-23'),
(3,2,1,'2019-05-30'),
(3,3,4,'2019-05-13'),
(16,4,7,'2019-05-22'),
(0,5,2,'2019-04-21'),
(7,6,2,'2019-04-23'),
(12,7,1,'2019-04-23'),
(13,8,5,'2019-05-01'),
(4,9,6,'2019-02-12'),
(6,10,8,'2019-03-23'),
(14,11,3,'2019-01-13'),
(15,12,5,'2019-04-03'),
(5,13,4,'2019-06-03'),
(8,14,1,'2019-01-03'),
(10,15,1,'2019-03-23'),
(11,16,2,'2019-03-23');

-- DATOS TIPO DE PRENDA
INSERT INTO Tipo_de_Prenda(ID_Tipo_Prenda,NombreTipoPrenda,DescripcionTipoPrenda)
VALUES
(1,'Medias','Medias variadas'),
(2,'Pantalones','Pantalones variadas'),
(3,'Camisetas','Camisetas variadas'),
(4,'Shorts','Shorts variados');



-- DATOS LOTE PRENDA
INSERT INTO Lote_Prenda(ID_Lote_Prenda,NombreLotePrenda,DescripcionLotePrenda,ID_Tipo_Prenda,ID_Proceso)
VALUES
(1,'Media de Red','Forma romboidal',1,1),
(2,'Media Cubana','Refuerzo en la planta',1,1),
(3,'Media Calada','Dibujos de Calas',1,1),
(4,'Media de Verano','Para Calor',1,1),
(5,'Vaquero','Del Oeste',2,2),
(6,'Skinny','Para Flacos',2,2),
(7,'BotaCampana','Ochentero',2,2),
(8,'Basica','Para eventos casuales',3,3),
(9,'Polo','Elegancia',3,3),
(10,'Cuello V','Deportista',3,3),
(11,'Grafica','Diversion',3,3),
(12,'Raglan','Informal',3,3),
(13,'Bermuda','Clasico',4,4),
(14,'Falda','Elegante',4,4);
