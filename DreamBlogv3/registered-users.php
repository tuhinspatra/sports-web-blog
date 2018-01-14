<?php
	require_once('config.php');

	//generate names of users
	if(isset($_POST['user_name']))
	{
		$unm = $_POST['user_name'];
		if(!$query = mysqli_query($db, "SELECT COUNT(*) FROM `Users` WHERE `UserName` LIKE '$unm'"))printf("%s",mysqli_error($db));
		if((mysqli_fetch_array($query))[0] == 1)
		{
			echo('taken');
		}
		else
		{
			echo('available');
		}
	}
	else
		die("empty_string");