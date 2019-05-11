<%-- 
    Document   : CompraInventario
    Created on : May 10, 2019, 10:04:39 PM
    Author     : Juan
--%>

<!doctype html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Compra Inventario</title>

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
          <a class="nav-link" href="./DatosEmpleado">Datos Personales</a>
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
          <a class="nav-link" href="./CompraInventario">Comprar Inventario</a>
        </li>
      </ul>
      </div>
    </nav>
    
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h1 style="text-align: center;"><strong>COMPRA DE INVENTARIO</strong></h1>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <select name="OS">
    <option selected="selected" value="0">Escoge el proovedor</option>
    <option value="1">Proovedor 1</option>
    <option value="2">Proovedor 2</option>
    </select>
<select name="OS">
    <option selected="selected" value="0">Escoge la materia prima</option>
    <option value="1">Materia Prima 1</option>
    <option value="2">Materia Prima 2</option>
    </select>
    <p align = "center" >&nbsp;<strong>Ingresa la cantidad deseada</strong></p>
    <p align = "center" ><textarea cols="60" name="text" rows="1"></textarea></p>
     <select name="OS">
    <option selected="selected" value="0">Procesos de produccion</option>
    <option value="1">P. Produccion 1</option>
    <option value="2">P.Produccion 2</option>
    </select>
     <select name="OS">
    <option selected="selected" value="0">Tipo de Prenda</option>
    <option value="1">Prenda 1</option>
    <option value="2">Prenda 2</option>
    </select>
<button name="button">Query</button>
    
            <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
        <script src="../../assets/js/vendor/popper.min.js"></script>
        <script src="../../dist/js/bootstrap.min.js"></script>
    </body>
    </html>