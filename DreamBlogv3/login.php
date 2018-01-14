<?php


  header("Content-Type: text/html; charset=utf-8");
  require('config.php');
  session_start(); // Starting Session
  $error=''; // Variable To Store Error Message
  if (isset($_POST['submit'])) {
    if (empty($_POST['username']) || empty($_POST['password'])) {
    $error = "Username or Password is invalid";
    }
    else
    {
      // Define $username and $password
      $username=$_POST['username'];
      $password=$_POST['password'];
      // To protect MySQL injection for Security purpose
      $username = stripslashes($username);
      $password = stripslashes($password);
      $username = mysqli_real_escape_string($db,$username);
      $password = mysqli_real_escape_string($db,$password);
      $password = md5($password);
      // SQL query to fetch information of registerd users and finds user match.
      $query = mysqli_query($db,"select * from Users where BINARY UserName = BINARY '$username' AND Password = '$password'");
      $rows = mysqli_num_rows($query);
      if ($rows == 1) {
        $_SESSION['login_user']=$username; // Initializing Session
        header("location: home.php"); // Redirecting To Other Page
      } else {
        $error = "Username or Password is invalid.";

      }
      mysqli_close($db); // Closing Connection
    }
  }

  if(isset($_SESSION['login_user'])){
    header("location: home.php");
  }
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="author" content="armag">
    <meta name="google-signin-client_id" content="1089456065411-d9cg2b0lrsrkt5g0n1miehdfuf1t90a1.apps.googleusercontent.com">
    <link rel="icon" href="assets/icon/favicon.ico">

    <title>Sigin | DreamBlog</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">

  </head>

  <body>
      <script src="js/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
      <script src="js/fbsdk.js"></script>
      <script src="js/gsdk.js"></script>
      <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>


    <div class="container">

      <form accept-charset="utf-8" class="form-signin" action="" method="post" name="login">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputEmail" class="sr-only">Username</label>
        <input type="text" id="inputUsername"  name="username" class="form-control" placeholder="Username" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
        <?php 
        if($error!='')
          echo '<span class=" form-control alert alert-info">'.$error.'</span>'; 

        ?>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button name="submit" class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>

        <div id="oauth-btn" class="text-center">
          <div id="fbloginbtn" class="form-control">
            <div id="fbloading"></div>
            <div class="fb-login-wrapper" >
              <div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" width="auto" data-auto-logout-link="false" data-use-continue-as="true"></div>
            </div>
          </div>

          <div id="gloginbtn" class="form-control">
          <div id="gloading"></div>
            <div id="myg-signin2"></div>
          </div>
        </div>

      </form>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>

<?

  // ALREADY CLOSED SOMEWHERE ABOVE
  //$db->close()

?>