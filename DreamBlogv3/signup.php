<?php


	header("Content-Type: text/html; charset=utf-8");
	require('config.php');
	session_start();
	if(isset($_SESSION['login_user'])){
		die("3");
		header("location:profile.php");
	}
	$error='';
	if (isset($_POST['submit'])) {
		if (empty($_POST['username']) || (empty($_POST['password'])) )
			$error = "Fill all the fields.";
		else if($_POST['password']!=$_POST['repassword'])
		{
			$error = "Retyped password didn't match with origial one, please try again.";
		}
		else
		{
			$uname=$_POST['username'];
			$pword=$_POST['password'];
			$pword=md5($pword);
			$email=$_POST['email'];
			$query1="INSERT INTO `Users` (`UserID`, `UserName`, `UserEmail`, `CreatedDate`, `Active`, `Password`) VALUES (NULL,'$uname','$email',CURRENT_TIMESTAMP,'1','$pword');";
			mysqli_query($db,$query1) or die("Couldn't store data in database.");
			$query2 = "SELECT * FROM `Users` where BINARY(`UserName`) = BINARY('$uname')";
			$res = mysqli_query($db,$query2) or die("Couldn't fetch data from database.");
			if(mysqli_num_rows($res)<1)
				$error="Oops...There was some error.".mysqli_error($db);
			else
			{
				if(isset($_GET['remember']))
				{
					if($_GET['remember']== true)
					{
						$_SESSION['login_user'] = $uname; 
						
					}
				}
				header("location: profile.php");
			}
			mysqli_close($db);
		}
	}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="assets/icon/favicon.ico">

	<title>
		Join Us!
	</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signup.css" rel="stylesheet">



</head>
<body>
<br>
 <div class="container">

      <form accept-charset="utf-8" class="form-signup" action="" method="post" name="signup">
        <h2 class="form-signup-heading">Join Us!</h2>
		<label for="inputName" class="sr-only">Name(optional)</label>
		<input type="text" id="inputName" class="form-control" placeholder="Name (optional)" name="name"><br>
		<label for="inputUsername" class="sr-only" >Username</label>
		<input type="text" id="inputUsername" class="form-control" placeholder="Username" name="username" required><br>
		<div id="msg"></div>
		<label for="inputEmail" class="sr-only">e-mail:</label>
		<input type="email" id="inputEmail" class="form-control" placeholder="Email" name="email" required><br>
		<label for="inputInterests" class="sr-only" >Add Interests</label>
		<!-- TODO use ajax so that users can start typing a interests to add -->
		<input type="text" name="interests" id="inputInterests" class="form-control" placeholder="Interests (Start typing anything to add eg. Web, Music)"> 
		<div id="intload"></div>
		<br/>
		<label for="inputPassword" class="sr-only">Choose Password</label>
		<input type="password" id="inputPassword" class="form-control" placeholder="Choose Password" name="password" required=""><br>
		<label for="inputRepassword" class="sr-only">Retype Password:</label>
		<input type="password" id="inputRepassword" class="form-control" placeholder="Retype Password" name="repassword" required=""><br>
		<?php 
        if($error!='')
          echo '<span class=" form-control alert alert-info">'.$error.'</span>'; 

        ?>
		<div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
		<button name="submit" class="btn btn-lg btn-primary btn-block" type="submit">Sign Up</button>

		</form>
	 </div> <!-- /container -->

<script src="js/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery.min.js"><\/script>')</script>
<script src="js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="js/ie10-viewport-bug-workaround.js"></script>
<script src="js/signup.js"></script>

</body>
</html>

<?
	//ALREADY CLOSED CONNECTION TO DATABASE
	  //$db->close();

?>