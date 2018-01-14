<?php
	# Information about mysql database configuration.
	
	 


	define('DB_SERVER','localhost');
	define('DB_USERNAME', 'root');
	define('DB_PASSWORD','');
	define('DB_DATABASE','SportsBlog');
	$db = mysqli_connect(DB_SERVER,DB_USERNAME,DB_PASSWORD,DB_DATABASE) or die("Connection failed: ".mysqli_connect_error());
	 $db->set_charset("utf-8");

	 $query3 = mysqli_query($db, "SET NAMES 'utf8'");
	mysqli_query($db,$query3);


?>

