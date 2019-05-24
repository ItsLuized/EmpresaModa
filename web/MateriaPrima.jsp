<%-- 
    Document   : MateriaPrima
    Created on : May 10, 2019, 9:06:00 AM
    Author     : Juan
--%>

<%@page import="modelos.ListaBodega"%>
<%@page import="modelos.ListaTipoMP"%>
<%@page import="modelos.ListaProceso"%>
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
          <a class="nav-link" href="./Estadisticas.jsp">Estadísticas</a>
        </li>
      </ul>
    </div>
  </nav>

  
<h1 align="center"><strong>Materia Prima&nbsp;</strong></h1>
<p>&nbsp;</p>

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
        <td align = "center"><%=filas[i][0]%></td>
        <td align = "center"><%=filas[i][1]%></td>
        <td align = "center"><%=filas[i][2]%></td>
        <td align = "center"><%=filas[i][3]%></td>
        </tr>
        <% 

    }  
%>
    </table>


    
 <p>&nbsp;</p>

 
  <form action="ServletRegistro" method="get">
            <table border="2" align="center">
            <tr>
                <td>ID:</td>
                <td><input type="number" size="20" name="ID_LoteMP"></td>
            </tr> 
            <tr>
                <td>Nombre:</td>
                <td><input type="text" size="20" name="Nombre"></td>
            </tr> 
            <tr>
                <td>Costo:</td>
                <td><input type="number" size="20" name="Costo"></td>
            </tr> 
            <tr>
            <td>ID del Tipo de Materia Prima:</td>
                <td>
                    <select name="ID_TipoMP">
                    <%
                    ListaTipoMP elDato = new ListaTipoMP();
                    String[][] ID =  elDato.getData();
                    for(int i=1; i<ID.length; i++)
                    { //Me imprime los datos mientras existan filas 
                        %>
                        <option value="1"><%=ID[i][0]%></option>     
                        <%      

                    }  
                %>
                    </select>
                </td>
            </tr>   
            <tr>
            <td>Bodega en donde almacenar:</td>
                <td>
                    <select name="ID_Bodega">
                    <%
                    ListaBodega elDatu = new ListaBodega();
                    String[][] Bod =  elDatu.getData();
                    for(int i=1; i<Bod.length; i++)
                    { //Me imprime los datos mientras existan filas 
                        %>
                        <option value="1"><%=Bod[i][0]%></option>     
                        <%      

                    }  
                %>
                    </select>
                </td>
            </tr>   
            <tr>
            <td>Proceso en el cual seria usado:</td>
                <td>
                    <select name="ID_Proceso">
                    <%
                    ListaProceso elDatico = new ListaProceso();
                    String[][] Pro =  elDatico.getData();
                    for(int i=1; i<Pro.length; i++)
                    { //Me imprime los datos mientras existan filas 
                        %>
                        <option value="1"><%=Pro[i][0]%></option>     
                        <%      

                    }  
                %>
                    </select>
                </td>
            </tr> 
            <tr>
            <td colspan="2" align="center"><input type="submit" value="Registrar"></td>
            </tr>
            </table>
        </form>
       
           <p style="text-align: center;"><strong>Para la inserción de datos es importante que tenga encuenta la siguiente información:</strong></p>
           <p style="text-align: left;">&nbsp;</p>
            <p style="text-align: center;"><strong>Los números de Tipo de Materia corresponden a lo siguiente:</strong></p>
            <p style="text-align: center;">&nbsp;</p>

    <table border="2" align="center" > 
            <tr>
                <th>ID</th>
                <th>Tipo de Materia</th>
            </tr>
            <tr>
            <%
                ListaTipoMP datas = new ListaTipoMP();
                String[][] filos =  datas.getData();
                for(int i=1; i<filos.length; i++)
                { //Me imprime los datos mientras existan filas 
                    %>
                    <tr>
                    <td><%=filos[i][0]%></td>
                    <td><%=filos[i][1]%></td>
                    </tr>
                    <%      

                }  
            %>
            </tr> 
</table>
    
    <p style="text-align: center;"><strong>Los números de Proceso corresponden a lo siguiente</strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
      
    
     <table border="2" align="center" > 
            <tr>
                <th>ID</th>
                <th>Tipo de Materia</th>
            </tr>
            <tr>
            <%
                 ListaProceso elDaticos = new ListaProceso();
                    String[][] Prot =  elDaticos.getData();
                    for(int i=1; i<Prot.length; i++)
                { //Me imprime los datos mientras existan filas 
                    %>
                    <tr>
                    <td><%=filas[i][0]%></td>
                    <td><%=filas[i][1]%></td>
                    </tr>
                    <%      

                }  
            %>
            </tr> 
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
