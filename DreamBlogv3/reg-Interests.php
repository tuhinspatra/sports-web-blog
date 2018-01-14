<?php
	require_once('config.php');

	//generate names of users
	if(isset($_GET['interest']))
	{
		$interest = $_GET['interest'].'%';
		if(!$query6 = mysqli_query($db, "SELECT * FROM `Topics` WHERE `Topic` LIKE '$interest'"))printf("%s",mysqli_error($db));
		$arr = [];
		while($result6 = mysqli_fetch_array($query6))
			$arr[] = $result6 ;

		echo json_encode($arr);
	}
	else
		die("empty_string");

