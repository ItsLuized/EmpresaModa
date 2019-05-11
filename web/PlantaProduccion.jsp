<%-- 
    Document   : PlantaProduccion
    Created on : May 10, 2019, 12:39:04 PM
    Author     : Juan
--%>
<%@page import="Conn.ConeccionMySQL"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
   <form class="form-signin" action ="iniciar" method="post">
 
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
            <a class="nav-link" href="">Datos Personales</a>
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
            <a class="nav-link" href="">Bodegas</a>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="">Prendas</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="">Comprar Inventario</a>
          </li>
        </ul>
      </div>
    </nav>

    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h1 style="text-align: center;"><strong>PLANTA DE PRODUCCIÓN</strong></h1>
    <p>&nbsp;</p>
    <p>&nbsp;</p>

    <table border="2" align="center" > 
      
     <tr>
     <th>NIT Planta</th>
     <th>Direccion</th>
     <th>Proceso</th>
     </tr>
    
    <%
    
    PreparedStatement ps = null; 
    try
      {
       ConeccionMySQL connMySQL = new ConeccionMySQL();
       Connection conn = connMySQL.setConeccion();
       ps = conn.prepareStatement("SELECT Pdp.NIT_Planta,Pdp.DireccionPlanta,Pdpro.DescripcionProceso "
               + "                FROM Planta_de_produccion Pdp INNER JOIN Proceso_de_Produccion Pdpro "
               + "                ON Pdp.ID_Planta=Pdpro.ID_Planta" );
              
		ResultSet rs = ps.executeQuery();
        while (rs.next()) 
        {
        %>
           <tbody>
            <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
           </tr>  
          <tbody>
         <%
        }
        %>
        </table>
        <%
        rs.close();
        ps.close();
        conn.close();
        }        
      catch (Exception e)
            {
	      System.err.println("ERRORo: " + e.getMessage());
	    }
            finally 
            {
           
	    }
     
    %>



     <p>&nbsp;</p>
     <p>&nbsp;</p>
     <p>&nbsp;</p>

    <table style="height: 94px; margin-left: auto; margin-right: auto;" width="713">
    <tbody>
    <tr>
    <td style="width: 355px;"><strong>Nit</strong></td>
    <td align = "center"><textarea cols="25" name="Nit" rows="1"></textarea></td>
    <td style="width: 357px;">&nbsp;</td>
    </tr>
    <tr>
    <td style="width: 355px;"><strong>Direcci&oacute;n:</strong></td>
    <td align = "center"><textarea cols="25" name="Direccion" rows="1"></textarea></td>
    <td style="width: 357px;">&nbsp;</td>
    </tr>
    <tr>
    <td style="width: 355px;"><strong>Procesos</strong></td>
    <td align = "center"><textarea cols="25" name="Procesos" rows="2"></textarea></td>
    <td style="width: 357px;">&nbsp;</td>
    </tr>
    </tbody>
    </table>
            <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
        <script src="../../assets/js/vendor/popper.min.js"></script>
        <script src="../../dist/js/bootstrap.min.js"></script>
        
    </form>
    </body>
    </html>