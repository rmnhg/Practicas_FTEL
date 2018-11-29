<?php
   include("config.php");
   session_start();
   
   if($_SERVER["REQUEST_METHOD"] == "POST") {
      // username and password sent from form 
      
      $myusername = mysqli_real_escape_string($db,$_POST['username']);
      $mypassword = mysqli_real_escape_string($db,$_POST['password']); 
      
      $sql = "SELECT nombre FROM usuario WHERE nombre='$myusername' and clave='$mypassword'";
select nombre from usuario where nombre="ramonhg00" and clave="1234567890";
      $result = mysqli_query($db,$sql);
      $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
      $active = $row['active'];
      
      $count = mysqli_num_rows($result);
      
      // If result matched $myusername and $mypassword, table row must be 1 row
		
      if($count == 1) {
         session_register("myusername");
         $_SESSION['login_user'] = $myusername;
         
         header("location: welcome.php");
      }else {
         $error = "Your Login Name or Password is invalid";
      }
   }
?>
<html> <!--Abro la etiqueta principal-->
	<head> <!--Cabecera de la página-->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Página de RHG</title>
		<link rel="icon" type="image/x-icon" href="favicon.ico"> <!--Le pongo la bandera de España como icono de la página-->
		<script type="text/javascript" src="RHG.js"></script> <!--Necesario para la calculadora-->
		<link rel="stylesheet" type="text/css" href="RHG.css"> <!--Mi propio diseño-->
	</head> <!--Cierro la cabecera de la página-->
	<body> <!--Cuerpo de la página-->
		<h1>Login</h1>
		<form action = "" method = "post">
			<label>Nombre :</label><input type="text" name="username" class="box"/><br/><br/>
			<label>Clave  :</label><input type="password" name="password" class="box"/><br/><br/>
			<input type="submit" value="Iniciar sesión"/><br/>
		</form>
		<p id="error" class="error"><?php echo $error; ?></p>
		<p>
			<!--button onclick="login()">
				Iniciar sesión
			</button-->
			<button onclick="signup()">
				Registrarse
			</button>
			<button onclick="lostpassword()">
				¿Has perdido la contraseña?
			</button>
		</p>
	</body>
</html>
