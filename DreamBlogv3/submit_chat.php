<?php 



	#  //submit_page.php?msg=hello&gid=5

	header("Content-Type: script/javascript; charset=utf-8");
	
	require('session.php');

	if(!isset($_GET['gid']))
		die("3");
	if(!isset($_GET['msg']))
		die("4");
	$msg = '';
	$msg = $_GET['msg'];
	$gid = $_GET['gid'];

	if($msg == '')
		die("8");
	if( iconv_strlen($msg) > 100 )
		die("5");

	$un = $user_check;

	$query5 = mysqli_query($db, "SELECT * FROM `Users` WHERE `UserName` = '$un'");
	$result5 = mysqli_fetch_array($query5);
	$uid = $result5['UserID'];

	$query2 = mysqli_query($db, "SELECT COUNT(*) FROM `ChatGroups` WHERE `ChatGroupID` = $gid AND `ChatGroupUserID` = $uid");
	$result2 = mysqli_fetch_array($query2);
	if(($result2[0])<1)
		die("6"); //user not in group 
	

	$query = mysqli_query($db, "INSERT INTO `ChatMessages` (`ChatMessageID`, `ChatMessageTime`, `ChatSenderID`, `ChatGroupID`, `ChatText`) VALUES (NULL, CURRENT_TIMESTAMP, $uid , $gid , '$msg')");
	if(!mysqli_query($query))
	{
		die("7");
	}

?>