<%-- 
    Document   : MateriaPrima
    Created on : May 10, 2019, 9:06:00 AM
    Author     : Juan
--%>

<%@page import="modelos.MP"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<IDOCTYPE html>
<html>

<title>Materia Prima</title>

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
          <a class="nav-link" href="./DatosEmpleado.jsp">Datos Personal</a>
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
          <a class="nav-link" href="./Estadisticas.jsp">Estadísticas</a>
        </li>
      </ul>
    </div>
  </nav>

  
<p>&nbsp;</p>
<p>&nbsp;</p>
<h1 align="center"><strong>Materia Prima&nbsp;</strong></h1>


 <table border="2" align="center" > 
      
     <tr>
     <th>Nombre de la Materia Prima</th>
     <th>Tipo de Materia Prima</th>
     <th>Ubicación actual</th>
     <th>Proveedor que vende esta Materia Prima</th>
     </tr>
     
    <%
    MP data = new MP();
    String[][] filas =  data.getData();
    for(int i=1; i<filas.length; i++)
    {
        %>
        <tr>
        <td><%=filas[i][0]%></td>
        <td><%=filas[i][1]%></td>
        <td><%=filas[i][2]%></td>
        <td><%=filas[i][3]%></td>
        </tr>
        <% 

    }  
%>
    </table>



<!--
<div>
<p align = "center">&nbsp;<strong>Nombre</strong></p>
<p align = "center"><textarea cols="60" name="Nombre" rows="1"></textarea></p>
<p align = "center">&nbsp;<strong>Tipo de Materia Prima</strong></p>
<p align = "center"><textarea cols="60" name="Tipo MP" rows="1"></textarea></p>
<p align = "center">&nbsp;<strong>Ubicación del Lote</strong></p>
<p align = "center"><textarea cols="60" name="Ubicacion" rows="1"></textarea></p>
<p align = "center">&nbsp;<strong>Proovedor</strong></p>
<p align = "center"><textarea cols="60" name="Proveedor" rows="1"></textarea></p>
</div>
-->
</body>
