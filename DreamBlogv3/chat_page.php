<?php 
	#This page generates the most recent posts from the topics followed by a user.



  header("Content-Type: text/html; charset=utf-8");
	require('session.php');
	$gid = -1;
	if(isset($_GET['q']))
	{
		$gid = $_GET['q'];
	}

	$un = $user_check;

	$query5 = mysqli_query($db, "SELECT * FROM `Users` WHERE `UserName` = '$un'");
	  $result5 = mysqli_fetch_array($query5);
	  $uid = $result5['UserID'];

?>


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="author" content="armag">
    <link rel="icon" href="assets/icon/favicon.ico">

    <title>Chat | DreamBlog</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/chat_page.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-fixed-top navbar-inverse">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="../DreamBlogv3">DreamBlog</a>
      </div>
      <div id="navbar" class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
          <li><a href="topics.php">Topics</a></li>
          <li><a href="home.php" class="active">Home</a></li>
          <li><a href="profile.php">Profile</a></li>
          <li><a href="submit_blog.php">Contribute</a></li>
        </ul>
      </div><!-- /.nav-collapse -->
    </div><!-- /.container -->
  </nav><!-- /.navbar -->

    <div class="container">

    <!-- ***********   CHAT BOX  ************************************ -->

    <?php

    if($gid===-1)  // ask user to select group
    {

    	echo ' <h3> Select a user or group from your earlier chats. ( Click on the Chat ID to start talking instantly. )</h3>


      <div id="users-table">
    	<div class="col-md-10">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>#</th>
                <th>Chat ID</th>
                <th>User(s)</th>
              </tr>
            </thead>
            <tbody>';


            $query = mysqli_query($db, "SELECT * FROM `ChatGroups` WHERE `ChatGroupUserID` = $uid");
            $i=0;
			while($result = mysqli_fetch_array($query))
			{
				$i++;
				$gid = $result['ChatGroupID'];
				echo '<tr>
                <td>'.$i.'</td>
                <td><a href="chat_page.php?q='.$gid.'">'.$gid.'</a></td>
                <td>';
        $query9 = mysqli_query($db, "SELECT * FROM `ChatGroups` WHERE `ChatGroupID` = $gid");
        while($result9 = mysqli_fetch_array($query9))
        {
              $guid = $result9['ChatGroupUserID'];
              if($guid != $uid)
              {
                $query6 = mysqli_query($db, "SELECT * FROM `Users` WHERE `UserID` = $guid");
                $result6 = mysqli_fetch_array($query6);

                echo $result6['UserName'].' ';
              }

        }

	     echo '  </td>
            </tr>';
			}

        echo    '</tbody>
          </table>
        </div>
      </div>';
    }

    else   // $gid known say 5
    {

    	echo '
      <h2  class="label label-warning lead"> Chat Group ID: <span id="gid">'.$gid.'</span></h2>    
        <div class="col-sm-3 col-sm-offset-4 frame">
          <ul id="show"></ul>
          
        </div>        
        <div id="error" class="alert alert-danger"></div>

		    <div class="lower-box" id="sending-box">
		    		<input name="msg" id="msg" type="text" placeholder="Enter is send." required>
		    		<button name="submit" type="submit" class="btn btn-info" id="send"> Send </button>
		    </div>';

    }


    ?>




	    
	<!-- ********** / CHAT BOX ************************************  -->

	</div><!-- /.container -->

    <footer class="blog-footer">
      <p>Created for <a href="https://academics.mnnit.ac.in/webt14.html">WDC Project</a>, by <a href="https://twitter.com/mynameistsp">armag</a>.</p>
      <p>
        <a href="#">Back to top</a>
      </p>
    </footer>


    <script src="js/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
    <script src="js/chat_page.js"></script>
</body>
</html>



<?php

  $db->close();

?>