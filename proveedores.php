<?php
    $err = isset($_GET['error']) ? $_GET['error'] : null ; 
	session_start();
	if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
        header("location: login.php");
		exit;
		}
		
		$rol= $_SESSION['cargo'];
		if($rol=="cajero"){
		header('Location: http://localhost/SuperMarketRD/facturas.php?error=3');
 }

	
	/* Connect To Database*/
	require_once ("config/db.php");//Contiene las variables de configuracion para conectar a la base de datos
	require_once ("config/conexion.php");//Contiene funcion que conecta a la base de datos
	
	$active_facturas="";
	$active_productos="";
	$active_clientes="";
    $active_usuarios="";	
    $active_proveedores="active";
    $active_compras="";
    $active_reportes="";
	$title="Proveedores | SuperMarketRD";
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <?php include("head.php");?>
  </head>
  <body>
	<?php
	include("navbar.php");
	?>
	
    <div class="container">
	<div class="panel panel-info">
		<div class="panel-heading">
		    <div class="btn-group pull-right">
				<button type='button' class="btn btn-info" data-toggle="modal" data-target="#nuevoProveedor"><span class="glyphicon glyphicon-plus" ></span> Nuevo Proveedor</button>
			</div>
			<h4><i class='glyphicon glyphicon-search'></i> Buscar Proveedores</h4>
		</div>
		<div class="panel-body">
			<?php
				include("modal/registro_proveedores.php");
				include("modal/editar_proveedores.php");
			?>
			<form class="form-horizontal" role="form" id="datos_cotizacion">
				
						<div class="form-group row">
							<label for="q" class="col-md-2 control-label">Proveedor</label>
							<div class="col-md-5">
								<input type="text" class="form-control" id="q" placeholder="Nombre del proveedor" onkeyup='load(1);'>
							</div>
							<div class="col-md-3">
								<button type="button" class="btn btn-default" onclick='load(1);'>
									<span class="glyphicon glyphicon-search" ></span> Buscar</button>
								<span id="loader"></span>
							</div>
							
						</div>
			</form>
				<div id="resultados"></div><!-- Carga los datos ajax -->
				<div class='outer_div'></div><!-- Carga los datos ajax -->		
  </div>
</div>
		 
	</div>
	<hr>
	<?php
	include("footer.php");
	?>
	<script type="text/javascript" src="js/proveedores.js"></script>
  </body>
</html>
