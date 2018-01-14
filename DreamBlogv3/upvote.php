<?php
	
	require('session.php');
	if(!isset($_POST['action']) || !isset($_POST['id']) )
	{
		die("error");
	}
	$pid = $_POST['id'];
	if($_POST['action']=='upvote')
	{
		$query1="UPDATE `Posts` SET `Upvotes` = `Upvotes` + 1 WHERE `Posts`.`PostID` = '$pid';";
			

	}
	else 
	{
		$query1="UPDATE `Posts` SET `Upvotes` = `Upvotes` - 1 WHERE `Posts`.`PostID` = '$pid';";
			
	}
	mysqli_query($db,$query1) or die("Couldn't store data in database.");

	$query1 = mysqli_query($db,"SELECT `Upvotes` FROM `Posts` WHERE `PostID` = '$pid'");  
	  $result1 = mysqli_fetch_array($query1);                       

	  echo json_encode($result1);


	
?>