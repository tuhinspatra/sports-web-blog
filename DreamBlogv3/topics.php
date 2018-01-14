<?php
//topics.php?q=10

header("Content-Type: text/html; charset=utf-8");
require('session.php');
require('includes/truncate.php');

if(!isset($_GET['q']))
{
	//header("home.php");
	$_GET['q']=1;
}

	$tid=$_GET['q'];
	$query5 = mysqli_query($db, "SELECT * FROM `Topics` WHERE `TopicID` = $tid");
	  $result5 = mysqli_fetch_array($query5);
	  $topic=$result5['Topic'];
	  	
            
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

    <title><?php echo $topic; ?> | Topics | DreamBlog</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/topics.css" rel="stylesheet">

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
          <a class="navbar-brand" href="#">DreamBlog</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li ><a href="topics.php" class="active">Topics</a></li>
            <li><a href="home.php" >Home</a></li>
            <li><a href="profile.php">Profile</a></li>
            <li><a href="submit_blog.php">Contribute</a></li>
            <li><a href="chat_page.php">Chat <sup>&beta;</sup></a></li>
            <li><a href="about_us.php">About Us</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->

    <div class="container">

      <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>
          <div class="jumbotron">
            <h1><?php echo 'The World of '.$topic; ?></h1>
            
            <p>Read some of the most awesome articles about <?php echo $result5['Topic']; ?> curated by people like you and around you.</p>
          </div>
          <div class="row">
<?php
 
 	$articles=0;
 	$qid = $_GET['q'];
 	$query2 = mysqli_query($db, "SELECT * FROM `PostsTopics` WHERE `TopicID` = $qid");
	  while($result2 = mysqli_fetch_array($query2))
	  {
	  	$pid=$result2['PostID'];
	  	$query3 = mysqli_query($db, "SELECT * FROM `Posts` WHERE `PostID` = $pid");
		  $result3 = mysqli_fetch_array($query3);
		  $articles++;
		  echo '<div class="col-xs-6 col-lg-4">
              <h2>'.truncate($result3['PostTitle'],60).'</h2>';
          $query4 = mysqli_query($db, "SELECT * FROM `PostDetails` WHERE `PostID` = $pid ORDER BY `Sequence` ASC");
		  $result4 = mysqli_fetch_array($query4);
		  //only 1st sequence shown...
		  	echo '<p>'.truncate($result4['PostText']).'</p>';
		  echo '<p><a class="btn btn-default" href="posts.php?q='.$pid.'" role="button">Read More &raquo;</a></p>
            </div>';

	  }
	  //TODO paginate and set topic in direct link below...
	  if($articles==0)
	  {
	  	echo '<p class="alert alert-info lead"><b>Aww...</b>Looks like we need some help in here from you. <a href="submit_blog.php"><b>Write now!</b></a></p>';
	  }

 
 
?>

         
            
            
          </div><!--/row-->
        </div><!--/.col-xs-12.col-sm-9-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
          <div class="list-group">
          <?php 
          	$query1 = mysqli_query($db, "SELECT * FROM `Topics`");
			  while($result1 = mysqli_fetch_array($query1))
			  {
			  	$active='';
			  	if($_GET['q'])
				  	if($_GET['q']==$result1['TopicID'])$active=' active';
			  	echo '<a href="topics.php?q='.$result1['TopicID'].'" class="list-group-item '.$active.'">'.$result1['Topic'].'</a>';
			  }
          ?>
           
          </div>
        </div><!--/.sidebar-offcanvas-->
      </div><!--/row-->

      <hr>

      <footer>
        <p>&copy;2017, <a href="https://twitter.com/mynameistsp">@armag</a></p>
      </footer>

    </div><!--/.container-->

    <script src="js/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
    <script src="js/topics.js"></script>
  </body>
</html>


<?

  $db->close();

?>