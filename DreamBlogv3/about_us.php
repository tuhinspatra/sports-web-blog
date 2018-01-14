<?php


  header("Content-Type: text/html; charset=utf-8");
  require('config.php');
  session_start();
  /*if(isset($_SESSION['login_user'])){
    header("location:home.php");
  }*/

?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="author" content="armag">
    <link rel="icon" href="assets/icon/favicon.ico">
    <title>DreamBlog | A Blogging Paradise</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/cover.css" rel="stylesheet">

  </head>

  <body>

    <div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

          <div class="masthead clearfix">
            <div class="inner">
              <h3 class="masthead-brand">DreamBlog</h3>
              <nav>
                <ul class="nav masthead-nav">
                  
                  <?php

                    if(isset($_SESSION['login_user'])){
                        // header("location:home.php");

                      echo '<li><a href="home.php" >Home</a></li>
                            <li><a href="profile.php">Profile</a></li>';
                    } else {
                      echo '<li><a href="login.php">Login</a></li>
                      <li><a href="signup.php">Sign Up</a></li>';

                    }


                  ?>

                  
                  <li class="active"><a href="#">About Us</a></li>
                </ul>
              </nav>
            </div>
          </div>

          <div class="inner cover">
          <h1> Hey there! </h1>
            <p class="lead">The official documentation of the website is under progress. In the mean time you can read more about us from third-party sources or browse the links below.</p>

            <p class="lead">
              <a href="about_us.php" class="btn btn-lg btn-default">Members</a>
            </p>
            <p class="lead">
              <a href="about_us.php" class="btn btn-lg btn-default">Terms &amp; Conditions</a>
            </p>
            <p class="lead">
              <a href="about_us.php" class="btn btn-lg btn-default">Privacy Policy</a>
            </p>
          </div>

          <div class="mastfoot">
            <div class="inner">
              <p>Created for <a href="https://academics.mnnit.ac.in/webt14.html">WDC Project</a>, by <a href="https://twitter.com/mynameistsp">armag</a>.</p>
            </div>
          </div>

        </div>

      </div>

    </div>

   
    <script src="js/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>


<?

  $db->close();

?>