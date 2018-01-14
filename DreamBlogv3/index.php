<?php

  header("Content-Type: text/html; charset=utf-8");
  require('config.php');
  session_start();
  if(isset($_SESSION['login_user'])){
    header("location:home.php");
  }

?>
<!DOCTYPE html>
<html lang="en" >
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="author" content="armag">
    <link rel="icon" href="assets/icon/favicon.ico">
    <title>DreamBlog | The Sports Blog</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/ind-tmp.css" rel="stylesheet">

  </head>

  <body >
  <div class="outer-head navbar navbar-fixed-top">
    <div class="left-head" >
      <h3  class="masthead-brand lead bg-warning">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dream<img height="23em" src="assets/icon/favicon.ico">log&nbsp;&nbsp;</h3>
    </div>
    <div class="right-head">
        <ul class="masthead-nav">
          <li><a href="login.php">Login</a></li>
          <li><a href="signup.php">Sign Up</a></li>
          <li class="active"><a href="#">About Us</a></li>
        </ul>
    </div>
  </div>

   <div id="mycarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#mycarousel" data-slide-to="0" class="active"></li>
    <li data-target="#mycarousel" data-slide-to="1"></li>
    <li data-target="#mycarousel" data-slide-to="2"></li>
    <li data-target="#mycarousel" data-slide-to="3"></li>
    <li data-target="#mycarousel" data-slide-to="4"></li>
    <li data-target="#mycarousel" data-slide-to="5"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item" id="it1">
        <img src="assets/img/car1.jpg" data-color="lightblue" alt="First Image">
        <div class="carousel-caption">
            <h3>Share your adventures</h3>
            <p class="lead text-default">Write your own stories.<br><em>Fact or fiction!</em></p>
        </div>
    </div>
    <div class="item" id="it2">
        <img src="assets/img/car2.jpg" data-color="firebrick" alt="Second Image">
        <div class="carousel-caption">
            <h3>In the battlefield</h3>
            <p class="lead " style="text-shadow: 0px 0px 8px black !important;">Get closer to the action with daily updates<br><em>Brace yourself!</em></p>
        </div>
    </div>
    <div class="item" id="it3">
        <img src="assets/img/car3.png" data-color="violet" alt="Third Image">
        <div class="carousel-caption">
            <h3>Hone your skills</h3>
            <p class="lead ">Get better at your trade by subscribing to your interests.<br><em>Be the best!</em></p>
        </div>
    </div>
    <div class="item" id="it4">
        <img src="assets/img/car4.jpg" data-color="lightgreen" alt="Fourth Image">
        <div class="carousel-caption">
            <h3>Get inspired</h3>
            <p class="lead " style="color:white;">Follow new people and discover real life heroes.<br><em>Rever your idols!</em></p>
        </div>
    </div>
    <div class="item" id="it5">
        <img src="assets/img/car5.jpg" data-color="tomato" alt="Fifth Image">
        <div class="carousel-caption">
            <h3>Grow your followers</h3>
            <p class="lead ">It's time to get famous and make some fans<br><em>Be a star!</em></p>
        </div>
    </div>
    <div class="item" id="it6">
        <img src="assets/img/car6.jpg" data-color="tomato" alt="Seventh Image">
        <div class="carousel-caption">
            <h3>Bond &amp; Blend</h3>
            <p class="lead " style="text-shadow: 0px 0px 8px black !important;">Join our network today to find like-minded people near you.<br><em>Let's binge!</em></p>
        </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#mycarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#mycarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<div class="footer">
  <div class="inside-footer">
  </div>
</div>


    <script src="js/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
    <script src="js/index.js"></script>
  </body>
</html>


<?

  $db->close();

?>