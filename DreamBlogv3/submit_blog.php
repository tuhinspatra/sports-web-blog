<?php


//ToDo
//submit_blog.php?pid=PostID check if user is owner of post otherwise other person may edit!
//submit_blog.php?topic=String  then put the topic in the search box as included
	header("Content-Type: text/html; charset=utf-8");

	require('config.php');
	session_start();
	if(!isset($_SESSION['login_user'])){

		header("location:index.php");
	}
	$error='';
	if (isset($_POST['submit'])) {
		if (empty($_POST['editor_content']))
		{
			$error = "content is blank";
		}
		else if(empty($_POST['title']))
		{
			$error = "Title is blank";
		}
		else if(empty($_POST['topic']))
		{
			$error = "Topic is blank.";	
		}
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
			$query1="INSERT INTO `PostDetails` (`PostDetailID`, `PostID`, `Sequence`, `PostText`) VALUES (NULL, '$pid', '1', '$content');";
			mysqli_query($db,$query1) or die("Couldn't store data in database.");

			$query9 = mysqli_query($db, "SELECT * FROM `Topics` WHERE `Topic` LIKE '$topic'");
			$result9 = mysqli_fetch_array($query9);	
			$tid = $result9['TopicID'];

			$query1="INSERT INTO `PostsTopics` (`PostsTopicsID`, `PostID`, `TopicID`) VALUES (NULL, '$pid', '$tid');";
			mysqli_query($db,$query1) or die("Couldn't store data in database.");
			header("location: posts.php?q=".$pid);

			
		}
	}

	
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="js/jquery.min.js"></script>
	<link rel="icon" href="assets/icon/favicon.ico">
	<title>
		Publish | DreamBlog
	</title>
	 <link href="css/bootstrap.min.css" rel="stylesheet">
	 <!-- Custom styles for this template -->
    <link href="css/submit_blog.css" rel="stylesheet">
    <!-- Include external CSS. -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.css">
 
    <!-- Include Editor style. -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.7.0/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.7.0/css/froala_style.min.css" rel="stylesheet" type="text/css" />

</head>
<body>
<div class="site-wrapper">
<div id="page">
	<div class="head-wrapper">
		<div class="full-head">
            <div class="inner">
              <h3 class="masthead-brand text-primary page-header">DreamBlog</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li ><a href="topics.php" >Topics</a></li>
                  <li><a href="home.php" >Home</a></li>
                  <li><a href="profile.php">Profile</a></li>
                  <li><a href="submit_blog.php" class="active">Contribute</a></li>
                  <li><a href="chat_page.php">Chat <sup>&beta;</sup></a></li>
                  <li><a href="about_us.php">About Us</a></li>
                </ul>
              </nav>
            </div>
        </div>
    </div>
	<div id="outer-container">

		<div id="above-editor">
		<form accept-charset="utf-8" action="" method="POST">
			<label class="sr-only">Title </label>
			<div id="text-title">
				<input type="text" placeholder="Enter a suitable title" id="inputTitle" name="title">
			</div>
			<div id="text-topic">
			<label class="sr-only">Topic(s)</label>
			</div>
			<!-- if topic doesn't exist then ask user if to create a new topic-->
			<span class="glyphicon glyphicon-search"></span>
			<input type="text" placeholder="Topic eg. Racing, Adventure..." id="inputTopic" name="topic">
		  
		</div> <!-- above-editor -->
		<div id="editor-outer" >
			<textarea name="editor_content" id="myEditor"></textarea>
		  
	  	</div> <!-- editor-outer -->

		<?php 
        if($error!='')
          echo '<span class=" form-control alert alert-info">'.$error.'</span>'; 

        ?>
		<label class="checktext text-info">
			<input type="checkbox" name="draft" class="checkbox btn" value="no"> 
			<span id="checkbox-text" class="pull-right">Save this as a temporary draft. Don't publish it now.</span>
		</label>
		<!-- TODO if checked then use js to change value "Publish" to "Save as Draft" below.-->
		
		<input type="submit" class="btn btn-warning btn-lg" id="submit" name="submit" value="Publish">
		</form>
	</div> <!-- outer-container -->
</div> <!-- /page -->
</div>
	<script src="js/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    
    <!-- Include external JS libs. -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/mode/xml/xml.min.js"></script>
 
    <!-- Include Editor JS files. -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.7.0/js/froala_editor.pkgd.min.js"></script>
 
    <!-- Initialize the editor. -->
    <script> $(function() {
      $('#myEditor').froalaEditor({
        // Set the file upload URL.
        imageUploadURL: '/DreamBlogv3/upload_image.php',
 
        imageUploadParams: {
          id: 'my_editor'
        }
      })
    }); 
    $('#myEditor').on('froalaEditor.image.error', function (e, editor, error, response) {
  // Do something here.

  	var $popup = editor.popups.get('image.insert');
	var $layer = $popup.find('.fr-image-progress-bar-layer');
	$layer.find('h3').text('something bad happened');

});
    
    </script>

</body>
</html>

<?php
 //CONNECTION ALREADY CLOSED TO DB
?>
