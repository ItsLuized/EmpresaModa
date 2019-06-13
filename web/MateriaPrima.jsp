<%-- 
    Document   : MateriaPrima
    Created on : May 10, 2019, 9:06:00 AM
    Author     : Juan
--%>

<%@page import="modelos.ListaEmpleados"%>
<%@page import="modelos.ProveeD"%>
<%@page import="modelos.ListaProveedor"%>
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
          <a class="nav-link" href="./actualizarGraphs">Estadísticas</a>
        </li>
      </ul>
    </div>
  </nav>

  
<h1 align="center"><strong>Materia Prima</strong></h1>
<h5 align="center">Esta pagina te ayudará a llevar registro de todas</h5>
<h5 align="center">Las materias primas que han habido.</h5>

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

<h1 align="center">Crear una Materia Prima:</h1>
    <form action="ServletRegistro" method="get">
        <table border="2" align="center">
        <tr>
            <td>Nombre:</td>
            <td><input type="text" size="20" name="Nombre"></td>
        </tr> 
        <tr>
            <td>Costo:</td>
            <td><input type="number" size="20" name="Costo"></td>
        </tr> 
        <tr>
        <td>Tipo de Materia Prima:</td>
            <td>
                <select name="ID_TipoMP">
                <%
                ListaTipoMP elDato = new ListaTipoMP();
                String[][] ID =  elDato.getData(); %>
                    <option value="1"><%=ID[1][1]%></option>
                    <option value="2"><%=ID[2][1]%></option>
                    <option value="3"><%=ID[3][1]%></option>
                    <option value="4"><%=ID[4][1]%></option>
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
                 //Me imprime los datos mientras existan filas 
                    %>
                    <option value="1"><%=Bod[1][0]%></option>   
                    <option value="2"><%=Bod[2][0]%></option>  
                    <option value="3"><%=Bod[3][0]%></option>  
                </select>
            </td>
        </tr>   
        <tr>
        <td>Proceso en el cual seria usado:</td>
            <td>
                <select name="IDProceso">
                <%
                ListaProceso elDatico = new ListaProceso();
                String[][] Pro =  elDatico.getData(); //Me imprime los datos mientras existan filas 
                    %>
                    <option value="1"><%=Pro[1][0]%></option> 
                    <option value="2"><%=Pro[2][0]%></option> 
                    <option value="3"><%=Pro[3][0]%></option> 
                    <option value="4"><%=Pro[4][0]%></option> 
                </select>
            </td>
        </tr> 
        <tr>
        <td>Proveedor que lo vende:</td>
            <td>
                <select name="IDProveedor">
                <%
                ListaProveedor Data = new ListaProveedor();
                String[][] Prov =  Data.getData();%>
                    <option value="0"><%=Prov[0][0]%></option>
                    <option value="1"><%=Prov[1][0]%></option>
                    <option value="2"><%=Prov[2][0]%></option>
                    <option value="3"><%=Prov[3][0]%></option>
                    <option value="4"><%=Prov[4][0]%></option>
                    <option value="5"><%=Prov[5][0]%></option>
                    <option value="6"><%=Prov[6][0]%></option>
                    <option value="7"><%=Prov[7][0]%></option>
                    <option value="8"><%=Prov[8][0]%></option>
                    <option value="9"><%=Prov[9][0]%></option>
                    <option value="10"><%=Prov[10][0]%></option>
                    <option value="11"><%=Prov[11][0]%></option>
                    <option value="12"><%=Prov[12][0]%></option>
                    <option value="13"><%=Prov[13][0]%></option>
                    <option value="14"><%=Prov[14][0]%></option>
                    <option value="15"><%=Prov[15][0]%></option>
                    <option value="16"><%=Prov[16][0]%></option>
                </select>
            </td>
        </tr>
        <tr>
         <tr>
        <td>Empleado que lo comprará:</td>
            <td>
                <select name="IDEmpleado">
                <%
                ListaEmpleados Emp = new ListaEmpleados();
                String[][] Emps =  Emp.getData();%>
                    <option value="0"><%=Emps[0][0]%></option> 
                    <option value="1"><%=Emps[1][0]%></option> 
                    <option value="2"><%=Emps[2][0]%></option> 
                    <option value="3"><%=Emps[3][0]%></option> 
                    <option value="4"><%=Emps[4][0]%></option> 
                    <option value="5"><%=Emps[5][0]%></option> 
                    <option value="6"><%=Emps[6][0]%></option> 
                    <option value="7"><%=Emps[7][0]%></option> 
                    <option value="8"><%=Emps[8][0]%></option>
                </select>
            </td>
        </tr>
        <td colspan="2" align="center">
        <input type="submit" value="Registrar"></td>
        </tr>
        </table>
    </form> 
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

    <div class ="footer">
    <p>Parfait&copy; 2018-2019 <br>
    Luis Martinez, Sebastian Giraldo, Juan Obando, Mateo Bravo</p>
    </div>
    
    
</form>
</body>
