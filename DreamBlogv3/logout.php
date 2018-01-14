<?php
	session_start();
	if(session_destroy()) // Destroying All Sessions
	{
		header("Location: index.php"); // Redirecting To Home Page
	}
	else 
	{
		echo 'Error logging out. <a href="logout.php">Try again</a> after some time.';
	}
?>