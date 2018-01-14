<?php 


	#  refresh_chat.php?gid=5&mid=10 //mid gives the last ChatMessageID checked so next time load only the next chat...

	header("Content-Type: script/javascript; charset=utf-8");

	require('session.php');
  require('includes/humanTiming.php');


	if(!isset($_GET['gid']))
		die("10");

	$gid = $_GET['gid'];
	if(!(is_numeric($gid)&& $gid > 0 && $gid == round($gid, 0))) //$gid is a numeric string not a number...$_GET[] contains strings without quotes...
		die("13");

	$query12 = mysqli_query($db, "SELECT COUNT(*) FROM `ChatGroups` WHERE `ChatGroupID` = $gid");
	$result12 = mysqli_fetch_array($query12);
	if(($result12[0])<1)	 {
	 	die("12");
	 }

	$un = $user_check;

	$query5 = mysqli_query($db, "SELECT * FROM `Users` WHERE `UserName` = '$un'");
	  $result5 = mysqli_fetch_array($query5);
	  $uid = $result5['UserID'];

	  $query2 = mysqli_query($db, "SELECT COUNT(*) FROM `ChatGroups` WHERE `ChatGroupID` = $gid AND `ChatGroupUserID` = $uid");
	$result2 = mysqli_fetch_array($query2);
	if(($result2[0])<1)
		die("11"); //user not in group

	$mid = 0;
	if(isset($_GET['mid']))
	{
		$mid = $_GET['mid'];
		if(!(is_numeric($gid)&& $gid > 0 && $gid == round($gid, 0)))
			$mid = 0;
		
	} 

	$query6 = mysqli_query($db, "SELECT * FROM (SELECT *  FROM `ChatMessages` WHERE `ChatMessageID` > $mid AND `ChatGroupID` = $gid ORDER BY `ChatMessageTime` DESC LIMIT 50 ) sub ORDER BY `ChatMessageTime` ASC");


	$arr = [];

	 
	while($result6 = mysqli_fetch_array($query6))
		$arr[] = $result6 ;


	echo json_encode($arr);



  //$db->close();

?>