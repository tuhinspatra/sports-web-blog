<?php
	//view_photo?u=10

	header("Content-Type: text/html; charset=utf-8");
	include('session.php');
	if(!isset($_GET['u']))
	{
		die('<h2>Check the link and try again.<br><a href="home.php" >Click here to return to your home now.</a></h2>');
	}
	$uid = $_GET['u'];
	$query5 = mysqli_query($db, "SELECT * FROM `Users` WHERE `UserID` = $uid");
	$result5 = mysqli_fetch_array($query5);
	$un=$result5['UserName'];
?>
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" href="assets/icon/favicon.ico">
	<title><?php  echo $un; ?> | Photo | DreamBlog</title>
	<link href="css/view_photo.css" rel="stylesheet" type="text/css">

</head>
<body>
<a target="_blank" href="#">
<?php
	$path="uploads/dp/".$uid;
	$tag='<img id="view-photo" src="'.$path;
	if(file_exists($path.".jpg"))
	{
		echo $tag.'.jpg" ';
	}
	else if(file_exists($path.".jpeg"))
	{
		echo $tag.'.jpeg" ';
	}
	else if(file_exists($path.".gif"))
	{
		echo $tag.'.gif" ';
	}
	else if(file_exists($path.".png"))
	{
		echo $tag.'.png" ';
	}
	else
	{
		echo '<img src="uploads/dp/default/default.png"';
	}
	
	echo 'alt="Your profile picture" style="width:100%;height: auto;padding-left:-40px;" />';

?>
</a>

</body>
</html>
<?

  $db->close();

?>