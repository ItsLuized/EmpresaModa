<%-- 
    Document   : HomePage
    Created on : May 10, 2019, 7:59:43 AM
    Author     : Juan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>HomePage</title>

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
          <a class="nav-link" href="./DatosEmpleado.jsp">Datos Personales</a>
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
          <a class="nav-link" href="./Estadisticas">Estadísticas</a>
        </li>
      </ul>
      </div>
    </nav>
     

   <p>&nbsp;</p>
<p>&nbsp;</p>

    <main role="main" class="container">

      <div class="starter-template">
       
         
      </div>
        
        <div>
            <h1 style="text-align: center;">BIENVENIDO</h1>
            <p>&nbsp;</p>
            <h2>Senior Comprador: Encontrarás el acceso a la información de la empresa y podrás realizar ingresos de compras. </h2>
           <p>&nbsp;</p>
            <h2>Nuestra historia</h2>
            <p id="historia">
                La historia comienza con nuestro fundador y líder Julián Jimenez, junto a 
                César Betancourt y Carlos Martinez.
            </p>
            <p id="quienesSomos">
                 Las colecciones de Parfait abarcan diferentes estilos, desde la sofisticación de su línea de Personal Tailoring (sastrería a medida), a otras líneas más relajadas y casual. Todas ellas ponen el acento en prendas y materiales de gran calidad, con un corte elegante y cómodo.

                Parfait nace como firma de moda masculina en 1985 y seis años después se integra en el Grupo Julián Jimenez. En 1995 lanza la línea de mujer con el propósito de aportar a la moda femenina los valores de la marca. En 2003 empieza a comercializar sus primeras colecciones para niños.

            </p>
            
            <div style ="display: flex; justify-content: center">
            <img src="images/julian.jpg" alt="Julian Jimenez, actual CEO de la compañía" height="500" width="500" align="center">
            </div>
           <p>
               
               Parfait comenzó a mediados de los 80 como una marca independiente que diseñaba y vendía ropa en Barcelona destinada al armario masculino. A principios de los 90, Grupo Julián Jimenez se hace con el control parcial de la compañía e introduce una línea de ropa femenina. Con el tiempo, la etiqueta paso a pertenecer íntegramente al conglomerado gallego y se fue extendiendo a la moda infantil atreviéndose, también, con la ropa de hogar. 

            Firme en su posicionamiento y constante en su medido crecimiento –cuenta con casi 600 tiendas en 53 países–, Parfait tiene claro cuáles son los códigos que quiere transmitir con sus prendas. Por ello, para sus campañas y acciones comunicativas se vale de referentes diversos y estilosos como la belleza clásica de Poppy Delevingne o la ubicuidad de las bloggers e influencers  Hanneli Mustaparta o Leandra Medine Cohen, alias Man Repeller.

            Todo en Parfait está cuidado al detalle, desde las prendas a la decoración y la arquitectura de todos sus espacios, empezando por su sede, ubicada en Barcelona, y acabando, como no, en sus tiendas.  "Nuestra guía son los deseos de los clientes. En la realización de cada diseño hay aportaciones de un equipo muy amplio: diseñador, comprador, comerciales de países, personal de tienda, patronistas, coordinación de tienda…", explicaban desde la marca
           </p>
            
        </div>

    </main><!-- /.container -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../assets/js/vendor/popper.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
  </body>
</html>