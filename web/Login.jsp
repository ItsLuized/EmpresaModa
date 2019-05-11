<%-- 
    Document   : Login
    Created on : May 9, 2019, 3:39:39 AM
    Author     : Juan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Login</title>

    <!-- Bootstrap core CSS -->
    <link href="css/estilo_Login.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/style_login.css" rel="stylesheet">
  </head>

  <body class="text-center">
    <form class="form-signin" action ="iniciar" method="post">
        
      <img class="mb-4" src="../../assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">   
      <h1 class="h3 mb-3 font-weight-normal">Por favor ingrese su usuario</h1>  
  <label for="inputEmail" >Correo Electrónico</label>  
      <input type="text" name="USER" class="form-control" placeholder="Email address" required autofocus>
  <label for="inputPassword" >Contraseña</label>   
      <input type="password" name="PASS" class="form-control"  placeholder="Password" required>
      <input type="submit" value="Iniciar Sesion"/>
      <p>&copy; 2018-2019</p>
    </form>
  </body>
</html>