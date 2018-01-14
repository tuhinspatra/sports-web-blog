
<?php


/*
*	$_SESSION['login_user'] returns `UserName` from `Users` table eg. 'tuhin' not 10	
*
*
*/


	//used by profile.php

	#This page verifies the session, if there is no session it will redirect to login page.

	require('config.php');
	session_start();
	$user_check = $_SESSION['login_user'];
	$ses_sql = mysqli_query($db, "select * from Users where UserName = '$user_check'");
	$row = mysqli_fetch_array($ses_sql);
	$login_session = $row['UserID'];
	if(!isset($_SESSION['login_user'])){
		header("location:login.php");
	}
	
?>
