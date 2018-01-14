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
            <li ><a href="topics.php">Topics</a></li>
            <li><a href="home.php" class="active">Home</a></li>
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
          <div class="row" id="to-pad">
              <?php 

              if(!isset($_SESSION['oauth_provider'])){

                #generate posts
                $ContentsFound=-1;
                if(!$query = mysqli_query($db, "SELECT TopicID FROM `TopicFollowers` WHERE `UserID` =$login_session"))printf("%s",mysqli_error($db));
                while($row = mysqli_fetch_array($query))
                {
                  $tid=$row[0];

                  if($query2 = mysqli_query($db, "SELECT * FROM `PostsTopics` as A, `Posts` as B WHERE `TopicID` = $tid AND A.PostID=B.PostID ORDER BY `PostDate` DESC"))
                  {

                    while($res = mysqli_fetch_array($query2))
                    {
                      $pid=$res[0];
                      $query3 = mysqli_query($db, "SELECT * FROM `Posts` WHERE `PostID` = $pid");
                      $result = mysqli_fetch_array($query3);
                      if($result['TemporaryDraft']==0)
                      {
                        if($ContentsFound > 9)
                        {
                          $ContentsFound=-1;
                          echo '<nav>
                                    <ul class="pager">
                                      <li><a href="#">Previous</a></li>
                                      <li><a href="#">Next</a></li>
                                    </ul>
                                  </nav>';
                        }
                        $ContentsFound++;
                        echo '<div class="blog-post">';
                        //TODO Paginate if more than 10 contents. Also show 5 lines of the head only for each post with show more button and open in new page.
                        $oid=$result['OwnerID'];
                        $query5 = mysqli_query($db, "SELECT * FROM `Users` WHERE `UserID` = $oid");
                        $result5 = mysqli_fetch_array($query5);

                        echo '<a href="posts.php?q='.$pid.'"><h2 class="blog-post-title">'.$result['PostTitle'].'</h2></a><p class="blog-post-meta">'.$result['PostDate'].' by <a href="profile.php?q='.$result5['UserName'].'">'.$result5['UserName'].'</a> </p>';


                        echo '<span class="label label-info"><span class="glyphicon glyphicon-tags" id="tags"></span>&nbsp;';
                        
                          $query8 = mysqli_query($db, "SELECT * FROM `PostsTopics` WHERE `PostID` = $pid");
                      while($result8 = mysqli_fetch_array($query8))
                      {
                        $tid=$result8['TopicID'];
                        $query9 = mysqli_query($db, "SELECT * FROM `Topics` WHERE `TopicID` = $tid");
                        $result9 = mysqli_fetch_array($query9); 
                        echo '<a href="topics.php?q='.$tid.'">'.$result9['Topic'].'</a> ';
                      }

                        echo '</span><div>';
                        $uv=$result['Upvotes'];
                        echo '<span class="btn-group">
                            &nbsp;<span class="badge"> '.$uv.' </span>
                            <span class="btn btn-default upvote-action" data-post-id="'.$pid.'">
                              <span class="glyphicon glyphicon-thumbs-up"></span>
                            </span>
                            <span class="btn btn-default downvote-action" data-post-id="'.$pid.'">
                              <span class="glyphicon glyphicon-thumbs-down"></span>
                            </span>
                            </span>';
                          
                         echo '</div>';
                        $query4 = mysqli_query($db, "SELECT * FROM `PostDetails` WHERE `PostID` = $pid ORDER BY `Sequence` ASC");
                        echo '<div class="post-details-wrapper">';
                        $result1 = mysqli_fetch_array($query4);
                        echo '<p class="post-details-para">'.truncate($result1['PostText'],1000).'</p>';
                        echo '<a class="pull-right" href="posts.php?q='.$pid.'" ><input type="button" class="btn" value="Read More"/></a>';
                        echo '<br>';
                        echo '<br>';
                        echo '</div>';
                        echo '</div>';
                      }
                    }
                  }


                }
                if($ContentsFound==-1)
                {
                  echo "<br/>Looks like we have no articles for you.<br/>Try following new topics or be the first of your friends to write a blog on your favourite topic.";
                }


              }
              else
              {
                echo 'TODO: Content for Facebook / Google / OAuth based login is pending. We are sorry.';
                if($_SESSION['oauth_provider']==='facebook')
                {
                  echo '<div
                          class="fb-like"
                          data-share="true"
                          data-width="450"
                          data-show-faces="true">
                        </div>';

                }
                else if($_SESSION['oauth_provider']==='google')
                {
                  //echo 'share with google';
                }
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
    <script src="js/home.js"></script>
    <script src="js/upvote.js"></script>
  </body>
</html>


<?php

  $db->close();

?>