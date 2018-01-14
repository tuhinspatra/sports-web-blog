<?php


	header("Content-Type: text/html; charset=utf-8");
  	require('session.php');
	if (empty($_POST['content']) || (empty($_POST['title']))|| (empty($_POST['topic'])) )
		$error = "Some fields are blank.";
	else
	{
		$content = $_POST['editor_content'];
  		$title = $_POST['title'];
		$topic = $_POST['topic'];
		$uname = $_SESSION['login_user'];
		$query9 = mysqli_query($db, "SELECT * FROM `Users` WHERE `UserName` LIKE '$uname'");
		$result9 = mysqli_fetch_array($query9);	
		$uid = $result9['UserID'];
		echo $uid;

		// get the uid
		$query1="INSERT INTO `Posts` (`PostID`, `PostTitle`, `PostDate`, `Deleted`, `OwnerID`, `Upvotes`, `TemporaryDraft`) VALUES (NULL, '$title', CURRENT_TIMESTAMP, '0', '$uid', '0', '0');";
		mysqli_query($db,$query1) or die("Couldn't store data in database.");
		$pid = mysqli_insert_id($db);
		$query1="INSERT INTO `PostDetails` (`PostDetailID`, `PostID`, `Sequence`, `PostText`) VALUES (NULL, '$pid', '1', 'world');";
		mysqli_query($db,$query1) or die("Couldn't store data in database.");

		$query9 = mysqli_query($db, "SELECT * FROM `Topics` WHERE `Topic` LIKE '$topic'");
		$result9 = mysqli_fetch_array($query9);	
		$tid = $result9['TopicID'];

		$query1="INSERT INTO `PostsTopics` (`PostsTopicsID`, `PostID`, `TopicID`) VALUES (NULL, '$pid', '$tid');";
		mysqli_query($db,$query1) or die("Couldn't store data in database.");
		header("location: posts.php?q=".$pid);

		mysqli_close($db);
	}
?>