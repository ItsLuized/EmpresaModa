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
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link href="css/style_login.css" rel="stylesheet">
  </head>

  <body class="text-center">
    <form class="form-signin"  action="LOG" method="post">
        
      <img class="mb-4" src="images/parfait.png" alt="Pairfait logo" width="200" height="75">  
      
      <h1 class="h3 mb-3 font-weight-normal">Por favor ingrese su usuario</h1> 
      
      <label for="inputEmail" >Correo Electrónico</label>  
      <input type="text" name="user" class="form-control" placeholder="Correo Electrónico" required autofocus>
      <br> 
      <label for="inputPassword" >Contraseña</label> 
      <br> 
      <input type="password" name="pass" class="form-control"  placeholder="Contraseña" required>
      <br> 
      <input type="submit" value="Iniciar Sesion"/>
    </form> 
      
    <div class ="footer">
        <p>Parfait&copy; 2018-2019 <br>
        Luis Martinez, Sebastian Giraldo, Juan Obando, Mateo Bravo</p>
     </div>
  </body>
</html>