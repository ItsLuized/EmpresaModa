<%-- 
    Document   : DatosEmpleado
    Created on : May 10, 2019, 10:05:54 PM
    Author     : Juan
--%>
<%@page import="modelos.Log"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Inicio</title>

    <!-- Bootstrap core CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Custom styles for this template -->
    <link href="starter-template.css" rel="stylesheet">
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
          <a class="nav-link" href="./DatosEmpleado">Datos Personal</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="./Proveedores.jsp">Proveedores</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="./MateriaPrima.jsp">Materia Prima</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="./Proveedores.jsp">Plantas de Produccion</a>
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

      <p>&n&nbsp;</p>
      <p>&n&nbsp;</p>
    <h1 align="center"><strong>Datos de los Empleados&nbsp;</strong></h1>
    <p>&nbsp;</p>

    <table border="2" align="center" > 

        <tr>
        <th>Nombre</th>
        <th>Apellido</th>
        <th>Direccion de Residencia</th>
        </tr>

        <%
            Log data = new Log();
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
      
    
      
<!--     
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h1 style="text-align: center;"><strong>EMPLEADO</strong></h1>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <table style="height: 94px; margin-left: auto; margin-right: auto;" width="713">
    <tbody>
    <tr>
    <td style="width: 355px;"><strong>Nombre</strong></td>
    <td align = "center"><textarea cols="25" name="Nombre" rows="1"></textarea></td>
    </tr>
    <tr>
    <td style="width: 355px;"><strong>Direcci&oacute;n</strong></td>
    <td align = "center"><textarea cols="25" name="Direccion" rows="1"></textarea></td>
    </tr>
    <tr>
    <td style="width: 355px;"><strong>Cargo</strong></td>
    <td align = "center"><textarea cols="25" name="Cargo" rows="1"></textarea></td>
    </tr>
    </tbody>
    </table>

-->
            <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
        <script src="../../assets/js/vendor/popper.min.js"></script>
        <script src="../../dist/js/bootstrap.min.js"></script>
</body>
</html>