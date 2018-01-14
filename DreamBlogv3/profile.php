<?php

  header("Content-Type: text/html; charset=utf-8");


  # After successful login
  require('session.php');
  require('includes/truncate.php');
  require('includes/humanTiming.php');

  $un='';
  if(isset($_GET['q']))
      $un = $_GET['q'];
  else
    $un=$user_check;
  $query5 = mysqli_query($db, "SELECT * FROM `Users` WHERE `UserName` = '$un'");
  $result5 = mysqli_fetch_array($query5);
  $uid=$result5['UserID'];
  $isowner=false;
  if($un===$user_check)
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
    <title>Profile | DreamBlog</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/profile.css" rel="stylesheet">

  </head>

  <body>
    <div class="container">
      <div class="header clearfix">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" ><a href="topics.php">Topics</a></li>
            <li role="presentation" ><a href="home.php">Home</a></li>
            <li role="presentation" class="active"><a href="profile.php">Profile</a></li>
            <li role="presentation"><a href="submit_blog.php">Contribute</a></li>
            <li role="presentation"><a href="chat_page.php">Chat <sup>&beta;</sup></a></li>
            <li role="presentation"><a href="about_us.php">About Us</a></li>

          </ul>
        </nav>
        <h3 class="text-info"><span class="glyphicon glyphicon-user"><span> <?php echo $un; ?></h3>
      </div>

      <div class="prof-poster" style="max-height:30vw;min-height: 10vw;" >
          <iframe width="100%" height="100%" frameborder="0"  src="view_photo.php?u=<?php echo $uid;?>"></iframe>
      </div>

      <div class="row marketing">
        <div class="col-lg-6">
          <h4><span class="glyphicon glyphicon-time"> </span> Recent Activity <span class="badge">
            <?php
              $query = mysqli_query($db, "SELECT COUNT(*) FROM `Activity` WHERE `ActivityOwnerID`='$uid'");
              $result = mysqli_fetch_array($query);
              echo $result[0];
              
            ?>
          </span></h4>
          <p>
            <?php
            if($result[0]==0)
            {
              if($isowner)
                echo '<span class="text-muted">Looks like you have been busy!</span>';
              else
              {
                echo '<span class="text-muted">No recent activity from '.$un.'</span>';
              }

            }
            else
            {
              $query11 = mysqli_query($db, "SELECT * FROM `Activity` WHERE `ActivityOwnerID`='$uid'");
              while($result11 = mysqli_fetch_array($query11))
              {
                switch ($result11['ActivityTypeID']) {
                  #TODO fetch more details of activities from individual tables.
                  case 1:
                    echo 'Post Published from scratch. Not from Saved Draft.';
                    break;
                  case 2:
                    echo 'Post published from Saved Draft.';
                    break;
                  case 3:
                    echo 'Post not published. Saved as Draft.';
                    break;
                  case 4:
                    echo 'Commented on a post.';
                    break;
                  case 5:
                    echo 'Started following a topic.';
                    break;
                  case 6:
                    echo 'Stopped following a topic.';
                    break;
                  case 7:
                    echo 'Deleted a live post.';
                    break;
                  case 8:
                    echo 'Edited a live post.';
                    break;
                  case 9:
                    echo 'Started following somebody.';
                    break; 
                  case 10:
                    echo 'Stopped following somebody.';
                    break;
                  case 11:
                    echo 'Changed status of live post to draft.';
                    break;
                  case 12:
                    echo 'Changed profile picture.';
                    break;
                  case 13:
                    echo 'Updated profile details.';
                    break;
                  case 14:
                    echo 'Upvoted a post.';
                    break;
                  case 15:
                    echo 'Downvoted a post';
                    break;
                  case 16:
                    echo 'Deleted a comment.';
                    break;
                  case 17:
                    echo 'Edited a comment.';
                    break;
                  
                  default:
                    echo 'You did something weird!';
                    break;
                }
              }
            }
            ?>
          </p>

          <h4><span class="glyphicon glyphicon-king"></span> Followers <span class="badge"><?php 
  $followers=[];
  $query9 = mysqli_query($db, "SELECT * FROM `Followers` WHERE `UserID` = $uid");
  while($result9 = mysqli_fetch_array($query9))
  {
    $followers[]=$result9['FollowerID'];
  }
  echo count($followers);

?></span></h4>
          <p><ul><?php 
              if(count($followers)==0)
              {
                if($isowner)
                  echo '<span class="text-muted">Start following someone.</span>';
                else
                  echo '<span class="text-muted">'.$un.' is not following anyone.</span>';
              }
              foreach ($followers as $fid) {
                $query1 = mysqli_query($db, "SELECT * FROM `Users` WHERE `UserID` = $fid");
                $result1 = mysqli_fetch_array($query1);
                echo '<li><a href="profile.php?q='.$result1['UserName'].'">'.$result1['UserName'].'</a></li>';
              }

          ?></ul></p>

          <h4><span class="glyphicon glyphicon-knight"></span> Following <span class="badge"><?php 
  $followers=[];
  $query2 = mysqli_query($db, "SELECT * FROM `Followers` WHERE `FollowerID` = $uid");
  while($result2 = mysqli_fetch_array($query2))
  {
    $followers[]=$result2['UserID'];
  }
  echo count($followers);

?></span></h4>
          <p><ul><?php 
              if(count($followers)==0)
              {
                echo '<span class="text-muted">No followers.</span>';
              }
              foreach ($followers as $fid) {
                $query3 = mysqli_query($db, "SELECT * FROM `Users` WHERE `UserID` = $fid");
                $result3 = mysqli_fetch_array($query3);
                echo '<li><a href="profile.php?q='.$result3['UserName'].'">'.$result3['UserName'].'</a></li>';
              }

          ?></ul></p>
        </div>

        <div class="col-lg-6">
          <h4>Biography</h4>
          <p>
            <dl>
              <dd>Joined 
              <?php 
                $sec=strtotime($result5['CreatedDate']);
                echo humanTiming($sec).' ago';



              ?></dd>
              <dt><span class="glyphicon glyphicon-envelope"> <span><dt><dd><?php echo $result5['UserEmail'];?></span></dd>
              <dt><span class="glyphicon glyphicon-heart"><span><dt><dd><?php $arrayint=[]; $query6 = mysqli_query($db, "SELECT * FROM `TopicFollowers` WHERE `UserID` = $uid ");
                $tid = [];$j=0;
  while($result6 = mysqli_fetch_array($query6))
  {
    $tid[] = $result6['TopicID'];
    $query7 = mysqli_query($db, "SELECT * FROM `Topics` WHERE `TopicID` = $tid[$j]");$j++;
    $result7 = mysqli_fetch_array($query7);
    $arrayint[] = $result7['Topic'];
  }  $ct=count($arrayint);

    for($i=0;$i<$ct;$i++){ echo ' <a class="tags" href="topics.php?q='.$tid[$i].'"><span class="label label-warning">'.$arrayint[$i].'</span></a>';} 
    if($ct<1)
    {
      if($isowner)
        echo '<span class="text-muted">Oops! You have no interests. <a href="topics.php">Subscribe now</a> to get better feeds</span>';
      else
        echo '<span class="text-muted"> This list is empty!</span>';
    }

  ?></dd>
            </dl>
          </p>

          <h4>Blogs <span class="badge"> <?php $blogs=[]; $drafts=[]; $query8 = mysqli_query($db, "SELECT * FROM `Posts` WHERE `OwnerID` = $uid ");
  while($result8 = mysqli_fetch_array($query8))
  {
    if($result8['Deleted']==0)
    {
      
      $bid = $result8['PostID'];
      if($result8['TemporaryDraft']==0)
      {
        $blogs[$bid] = $result8['PostTitle'];
      }
      else
      {
        $drafts[$bid] = $result8['PostTitle'];
      }
    }

    } echo count($blogs); 
    echo '</span></h4>
          <p><ul>';
    

   if(count($blogs)==0)
   {
    if($isowner)
       echo '<span class="text-muted">Time to get to work. <a href="submit_blog.php">Open editor now <span class="glyphicon glyphicon-edit"></span></a></span>';
       else
        echo '<span class="text-muted">No blogs yet.</span>'; 
    }        
    else
     foreach($blogs as $key => $blog)
      echo '<li><a href="posts.php?q='.$key.'">'.truncate($blog,100).'</a></li>';
   echo '</ul></p>';

   if($isowner===true)
   {

    echo '<h4>Drafts <span class="badge">'.count($drafts).'</span></h4><p><ul>';

    if(count($drafts)==0)
       echo '<span class="text-muted">Good Work! You have no pending drafts.</span>';         
    else
      foreach($drafts as $key1 => $draft) 
        echo '<li><a href="posts.php?q='.$key1.'">'.truncate($draft,100).'</a></li>'; 
    echo '</ul></p>';

  }

?>

        </div>
      </div>

      <footer class="footer">
        <p>&copy;2017, <a href="https://twitter.com/mynameistsp">@armag</a></p>
      </footer>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
<?

  $db->close();

?>