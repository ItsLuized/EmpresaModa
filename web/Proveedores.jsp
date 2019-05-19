<%-- 
    Document   : Proveedores
    Created on : May 10, 2019, 9:26:28 AM
    Author     : Juan
--%>

<%@page import="modelos.ProveeD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<IDOCTYPE html>
<html>

<title>Proveedores</title>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Starter Template for Bootstrap</title>
    <!-- Bootstrap core CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Custom styles for this template -->
    <link href="css/starter-template.css" rel="stylesheet">
    <link href="css/estilo.css" rel="stylesheet">
  </head>

<body> 
  
  <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="#">Parfait</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

  <div class="collapse navbar-collapse" id="navbarsExampleDefault">
      <ul class="navbar-nav mr-auto">
          <a class="nav-link" href="./HomePage.jsp">Homepage</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="./DatosEmpleado">Datos Personales</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="./Proveedores.jsp">Proveedores</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="./MateriaPrima.jsp">Materia Prima</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="./PlantaProduccion.jsp">Plantas de Produccion</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="./Bodegas.jsp">Bodegas</a>
        </li>
          <li class="nav-item">
          <a class="nav-link" href="./Prendas.jsp">Prendas</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="./CompraInventario">Comprar Inventario</a>
        </li>
      </ul>
    </div>
  </nav>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

  <table border="2" align="center" > 
      
     <tr>
     <th>Nombre del Proveedor</th>
     <th>Dirección</th>
     <th>E-mail</th>
     <th>Nombre de la Materia prima que vende</th>
     <th>Costo</th>
     <th>Tipo de Materia Prima</th>
     </tr>
     
    <%
    ProveeD data = new ProveeD();
    String[][] filas =  data.getData();
    for(int i=1; i<filas.length; i++)
    {
        %>
        <tr>
        <td><%=filas[i][0]%></td>
        <td><%=filas[i][1]%></td>
        <td><%=filas[i][2]%></td>
        <td><%=filas[i][3]%></td>
        <td><%=filas[i][4]%></td>
        <td><%=filas[i][5]%></td>
        </tr>
        <% 

    }  
%>
    </table>



<p>&nbsp;</p>
<p align = "center"><button> Ordenar Por Nombre </button></p>
<p align = "center"><button> Ordenar Por Materia Prima </button></p>
<p align = "center"><button> Ordenar Por Costo</button></p>
<p align = "center">&nbsp;<strong>Nombre</strong></p>
<p align = "center"><textarea cols="25" name="text" rows="1"></textarea></p>
<p align = "center">&nbsp;<strong>Direcci&oacute;n</strong></p>
<p align = "center"><textarea cols="25" name="text" rows="1"></textarea></p>
<p align = "center">&nbsp;<strong>Email</strong></p>
<p align = "center"><textarea cols="25" name="text" rows="1"></textarea></p>
<p align = "center">&nbsp;<strong>Materia Prima</strong></p>
<p align = "center"><textarea cols="25" name="text" rows="1"></textarea></p>
<p align = "center">&nbsp;<strong>Costo</strong></p>
<p align = "center"><textarea cols="25" name="text" rows="1"></textarea></p>
</body>
</html>