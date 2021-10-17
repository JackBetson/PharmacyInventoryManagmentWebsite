<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="description" content="Index page for PHP Inc. Admin Software" />
  <meta name="keywords" content="HTML5, tags" />
  <meta name="author" content="Jack Betson"  />
  <title>People Health Pharmacy Inc. Admin Software Home Page</title>
  <link href= "styles/style.css" rel="stylesheet"/>
</head>

<body>
	<?php include "includes/header.inc";?>

  <?php
        require_once ("settings.php");
        $conn = @mysqli_connect($host,
                    $user,
                    $pwd,
                    $sql_db
                );

    if(isset($_POST['login'])) // when click on Update button
        {
            $UserName = $_POST['UserName'];
            $Password = $_POST['Password'];

            $VerifyLogin = mysqli_query($conn, "SELECT * FROM user WHERE UserName = '$UserName'");
            
            
            if($VerifyLogin)
            {
                $UserRecord = mysqli_fetch_assoc($VerifyLogin);
                if($UserRecord)
                {
                    if($UserRecord["UserName"] == $UserName and $UserRecord["PasswordHash"] == crypt($Password, $UserRecord["Salt"]))
                    {
                      mysqli_close($conn); // Close connection
                      header("location:add_record.php"); // redirects to all records page
                      exit;
                    }
                }
                else
                {
                    echo mysqli_error();
                }
            }
            else
            {
                echo mysqli_error();
            }    	
        }

  ?>


		<section id="Welcome">
			<p>Welcome!</p>
      <form method="POST">
        <label for="UserName">User Name</label>
        <br>
        <input type="text" name="UserName" placeholder="Enter User Name" Required>
        <br>
        <label for="Password">Password</label>
        <br>
        <input type="text" name="Password" placeholder="Enter Password" Required>
        <br>
        <input type="submit" name="login" value="Login">
		</section>
</body>
</html>