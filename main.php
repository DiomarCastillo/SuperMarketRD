<?php
$err = isset($_GET['error']) ? $_GET['error'] : null ;
	session_start();
	if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
        header("location: login.php");
		exit;
        }

	$active_facturas="";
	$active_productos="";
	$active_clientes="";
	$active_usuarios="";	
	$active_proveedores="";
	$active_compras="";
	$active_reportes="";	
	$title="Main | SuperMarketRD";
?>
<!DOCTYPE html>
<script src="js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="css/sweetalert2.min.css">	
<html lang="en">
  <head>
	<?php include("head.php");?>
<style>
.c {
    
   text-align:center;
    /* margin-top: 150px;
	margin-left: 80px; */
	

}



</style>
  </head>
  <body>
	<?php
	include("navbar.php");
	?>  
	
<div class ="c">

<img src="img/Login1.png"  alt="" width="350" height="400"/>

<H2>¡Productos de Calidad Siempre!</H2>
</div>
