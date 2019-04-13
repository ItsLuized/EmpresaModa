CREATE DATABASE EmpresaModa;

USE EmpresaModa;

CREATE TABLE Cargo(
ID_Cargo INTEGER(5) NOT NULL,
NombreCargo VARCHAR(50) NOT NULL,
DescripcionCargo VARCHAR(300) NOT NULL,
PRIMARY KEY(ID_Cargo)
);

CREATE TABLE Empleado(
ID_Empleado INTEGER(5) NOT NULL,
NombreEmpleado VARCHAR(50) NOT NULL,
ApellidoEmpleado VARCHAR(50) NOT NULL,
DireccionEmpleado VARCHAR(300) NOT NULL,
ID_Empresa INTEGER(5) ,
ID_Cargo INTEGER(5),
PRIMARY KEY(ID_Empleado),
FOREIGN KEY(ID_Empresa) REFERENCES Empresa(ID_Empresa),
FOREIGN KEY(ID_Cargo) REFERENCES Cargo(ID_Cargo)
);

CREATE TABLE Empresa(
ID_Empresa INTEGER(5) NOT NULL,
NombreEmpresa VARCHAR(50) NOT NULL,
NIT_Empresa VARCHAR(50) NOT NULL,
DireccionEmpresa VARCHAR(40),
Telefono INTEGER(5) NOT NULL,
EmailEmpresa VARCHAR(70) NOT NULL,
PRIMARY KEY(ID_Empresa)
);

CREATE TABLE Proveedor(
ID_Proveedor  INTEGER(5) NOT NULL,
NombreProveedor VARCHAR(60) NOT NULL,
DireccionProveedor VARCHAR(40) NOT NULL,
EmailProveedor VARCHAR(70) NOT NULL,
ID_Empresa  INTEGER(5) NOT NULL,
PRIMARY KEY(ID_Proveedor),
FOREIGN KEY(ID_Empresa) REFERENCES Empresa(ID_Empresa)
);

CREATE TABLE Planta_de_Produccion(
ID_Planta INTEGER(5) NOT NULL,
NIT_Planta VARCHAR(100) NOT NULL,
DireccionPlanta VARCHAR(40) NOT NULL,
ID_Empresa INTEGER(5),
PRIMARY KEY(ID_Planta),
FOREIGN KEY(ID_Empresa) REFERENCES Empresa(ID_Empresa)
);

CREATE TABLE Bodega(
ID_Bodega  INTEGER(5) NOT NULL,
DireccionBodega VARCHAR(40) NOT NULL,
DescripcionBodega VARCHAR(40) NOT NULL,
PRIMARY KEY(ID_Bodega)
);

CREATE TABLE Tipo_Materia_Prima(
ID_Tipo_MP INTEGER(5) NOT NULL,
NombreTipoMP VARCHAR(40) NOT NULL,
DescripcionMP VARCHAR(40) NOT NULL,
PRIMARY KEY(ID_Tipo_MP)
);

CREATE TABLE Proceso_de_Produccion(
ID_Proceso INTEGER(5) NOT NULL,
Fecha DATE NOT NULL,
DescripcionProceso VARCHAR(40) NOT NULL,
ID_Planta INTEGER(5),
PRIMARY KEY(ID_Proceso),
FOREIGN KEY(ID_Planta) REFERENCES Planta_de_Produccion(ID_Planta)
);

CREATE TABLE Lote_Materia_Prima(
ID_Lote_MP INTEGER(5) NOT NULL,
NombreLoteMP VARCHAR(40) NOT NULL,
Precio INTEGER(20) NOT NULL,
ID_Tipo_MP INTEGER(5),
ID_Bodega INTEGER(5),
ID_Proceso INTEGER(5),
PRIMARY KEY(ID_Lote_MP),
FOREIGN KEY(ID_Tipo_MP) REFERENCES Tipo_Materia_Prima(ID_Tipo_MP),
FOREIGN KEY (ID_Bodega) REFERENCES Bodega(ID_Bodega),
FOREIGN KEY (ID_Proceso) REFERENCES Proceso_de_Produccion(ID_Proceso)
);

CREATE TABLE Compra(
ID_Proveedor INTEGER(5) NOT NULL,
ID_Lote_MP INTEGER(5) NOT NULL,
ID_Empleado INTEGER(5) NOT NULL,
Fecha_de_Compra DATE NOT NULL,
PRIMARY KEY(ID_Proveedor,ID_Lote_MP,ID_Empleado),
FOREIGN KEY(ID_Proveedor) REFERENCES Proveedor(ID_Proveedor),
FOREIGN KEY(ID_Lote_MP) REFERENCES Lote_Materia_Prima(ID_Lote_MP),
FOREIGN KEY(ID_Empleado) REFERENCES Empleado(ID_Empleado)
);

CREATE TABLE Tipo_de_Prenda(
ID_Tipo_Prenda INTEGER(5) NOT NULL,
NombreTipoPrenda VARCHAR(40) NOT NULL,
DescripcionTipoPrenda VARCHAR(40) NOT NULL,
PRIMARY KEY(ID_Tipo_Prenda)
);

CREATE TABLE Lote_Prenda(
ID_Lote_Prenda INTEGER(5) NOT NULL,
NombreLotePrenda VARCHAR(40) NOT NULL,
DescripcionLotePrenda VARCHAR(40) NOT NULL,
ID_Tipo_Prenda INTEGER(5),
ID_Proceso INTEGER(5),
FOREIGN KEY(ID_Tipo_Prenda) REFERENCES Tipo_de_Prenda(ID_Tipo_Prenda),
FOREIGN KEY(ID_Proceso) REFERENCES Proceso_de_Produccion(ID_Proceso)
);
