<%-- 
    Document   : Bodegas
    Created on : May 10, 2019, 9:50:07 PM
    Author     : Juan
--%>

<%@page import="modelos.Bodeguita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<DOCTYPE html>
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
    <link href="css/estilo.css" rel="stylesheet">
    <link href="css/starter-template.css" rel="stylesheet">
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
          <a class="nav-link" href="./actualizarGraphs">Estadísticas</a>
        </li>
      </ul>
    </div>
  </nav>
  
<h1 align="center"><strong>Bodegas&nbsp;</strong></h1>
<p>&nbsp;</p>

 <table border="2" align="center" > 
      
     <tr>
     <th>Bodega</th>
     <th>Dirección</th>
     <th>Cantidad de lotes de materia prima almacenados</th>
     </tr>
     
    <%
    Bodeguita data = new Bodeguita();
    String[][] filas =  data.getData();
    for(int i=1; i<filas.length; i++)
    {
        %>
        <tr>
        <td align = "center"><%=filas[i][0]%></td>
        <td align = "center"><%=filas[i][1]%></td>
        <td align = "center"><%=filas[i][2]%></td>
        </tr>
        <% 

    }  
%>
    </table>

    <div class ="footer">
    <p>Parfait&copy; 2018-2019 <br>
    Luis Martinez, Sebastian Giraldo, Juan Obando, Mateo Bravo</p>
    </div>
    
</body>
</html>