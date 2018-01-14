<?php

  header("Content-Type: text/html; charset=utf-8");
  require('session.php');
  require('includes/humanTiming.php');
  

  if(!isset($_GET['q']))
  {
  		header("location:home.php");
  	
  }
  $pid=$_GET['q'];
  $query = mysqli_query($db, "SELECT * FROM `Posts` WHERE `PostID` = $pid");
  if(mysqli_num_rows($query)!=1)
  {
  	header("location:home.php");
  }


  $result = mysqli_fetch_array($query);
  $pt=$result['PostTitle'];

  $oid=$result['OwnerID'];
  $query2 = mysqli_query($db, "SELECT * FROM `Users` WHERE `UserID` = $oid");
  $result2 = mysqli_fetch_array($query2);
  $oname=$result2['UserName'];

  $isowner=false;
  $istemp=false;
  if($result['TemporaryDraft']==1)
  {
  	if($oname!==$_SESSION['login_user'])//ToDO prompt user "post is not available, browse your interests to find more."
  	{
  		header("location:home.php");

  	}
  	$istemp=true;
  	//user is owner
  }
  if($oname===$_SESSION['login_user'])
  {
  	$isowner=true;
  }

  

?>



<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="assets/icon/favicon.ico">

    <title><?php echo $pt; ?> | DreamBlog</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/posts.css" rel="stylesheet">

  </head>

  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><b>DreamBlog</b></a>
          <a class="navbar-brand" href="home.php">&nbsp;&nbsp;Home</a>
          <span class="navbar-brand"> | </span>
          <a class="navbar-brand" href="profile.php">Profile</a>
          <span class="navbar-brand"> | </span>
          <a class="navbar-brand" href="submit_blog.php">Contribute</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <div class="navbar-right">
          <h4 class="lead text-primary">
	          <?php echo $pt; ?>
	      </h4>
          </div>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">

      <?php 
      	if($istemp)
	      echo '<a href="submit_blog.php?pid='.$pid.'" ><div class="panel panel-danger"><div class="panel-heading"><h3 class="panel-title"> This post is saved as a draft.</h3></div><div class="panel-body"> Only you can see this. Click here to start editing this post now.</div></div></a>'; 

      ?> 
        <h1><?php echo $pt; ?></h1>
        <p><?php 
        if($isowner)
        {
        	echo '<span class="pull-right"><a href="submit_blog.php?pid='.$pid.'" class="btn btn-info"><span class="glyphicon glyphicon-edit"></span> Open in editor</a></span>';
        }


        $sec=strtotime($result['PostDate']);
        if((time()-$sec) < 6000000)
        {
        	echo '<span class="label label-success">Last edited '.humanTiming($sec).' ago</span>';
        }
        else if((time()-$sec)<300000000)
        	echo '<span class="label label-default">Last edited'.humanTiming($sec).' ago</span>';
        else
        	echo '<span class="label label-warning">This post has been archived. You may ignore any technical details or facts referring to the modern period (if they appear in this document) as it predates the current period.</span>';
        ?>

       
        <span class="label label-info"><span class="glyphicon glyphicon-tags" id="tags"></span>&nbsp;
        <?php
        	$query8 = mysqli_query($db, "SELECT * FROM `PostsTopics` WHERE `PostID` = $pid");
			while($result8 = mysqli_fetch_array($query8))
			{
				$tid=$result8['TopicID'];
				$query9 = mysqli_query($db, "SELECT * FROM `Topics` WHERE `TopicID` = $tid");
				$result9 = mysqli_fetch_array($query9);	
				echo '<a href="topics.php?q='.$tid.'">'.$result9['Topic'].'</a> ';
			}

        ?>
        </span>
   

        <div>
        <?php
        $uv=$result['Upvotes'];
        if($uv>0)
        {
        	$suf='';
        	if($uv>1000000000 )
        	{
        		$suf='m+';
        		$uv=999;
        	}
        	if($uv>1000000 )
        	{
        		$uv=floor($uv/1000000);
        		$suf='m';
        	}

        	else if($uv>1000)
        	{
        		$uv=floor($uv/1000);
        		$suf='k';
        	}
        	echo '<span class="btn-group">
        		<span class="btn btn-success">
	        		<span class="glyphicon glyphicon-thumbs-up"></span>&nbsp;<span class="badge">+'.$uv.$suf.'</span>
	        	</span>
	        	<span class="btn btn-default">
	        		<span class="glyphicon glyphicon-thumbs-down"></span>
	        	</span>
	        	</span>';
        }
        else if($uv<0)
        {
        	$suf='';
        	if($uv<1000000000 )
        	{
        		$suf='m+';
        		$uv=999;
        	}
        	if($uv<1000000 )
        	{
        		$uv=floor($uv/1000000);
        		$suf='m';
        	}

        	else if($uv<1000)
        	{
        		$uv=floor($uv/1000);
        		$suf='k';
        	}
        	echo '<span class="btn-group">
        		
        		<span class="btn btn-default">
	        		<span class="glyphicon glyphicon-thumbs-up"></span>
	        	</span>
	        	<span class="btn btn-warning">
	        		<span class="glyphicon glyphicon-thumbs-down"></span>&nbsp;<span class="badge">-'.$uv.$suf.'</span>
	        	</span>
	        	</span>';
        }
        else 
        {
        	echo '<span class="btn-group">
        		
        		<span class="btn btn-default">
	        		<span class="glyphicon glyphicon-thumbs-up"></span>&nbsp;<span class="badge">0</span>
	        	</span>
	        	<span class="btn btn-default">
	        		<span class="glyphicon glyphicon-thumbs-down"></span>
	        	</span>
	        	</span>';
        }
        
         ?>
         	
         </div>
         </p>
        <p><a class="btn btn-default btn-lg pull-right" href="<?php echo 'profile.php?q='.$oname; ?>" role="button"> <span class="glyphicon glyphicon-user"><span> <?php echo $oname; ?></a> </p>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
      <div class="col-md-8">
      	<?php 

      		$query1 = mysqli_query($db, "SELECT * FROM `PostDetails` WHERE `PostID` = $pid ORDER BY `Sequence` ASC");
			while($result1 = mysqli_fetch_array($query1))
			{
				echo '<p>'.$result1['PostText'].'</p>';
			}


      	 ?>
        
      </div>
      </div>

      <hr>

      <footer>
        <p>&copy;2017, <a href="https://twitter.com/mynameistsp">@armag</a></p>
      </footer>
    </div> <!-- /container -->
    
    <script src="js/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
<?

  $db->close();

?>