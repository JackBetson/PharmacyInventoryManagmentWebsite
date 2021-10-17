<!DOCTYPE html>
<html>
<head>
	<title>DB Setup</title>
	<meta charset="utf-8" />
  	<meta name="description" content="Add Sales Record" />
  	<meta name="keywords" content="HTML5, tags" />
  	<meta name="author" content="Group 4"  />
  	<title>People Health Pharmacy Inc. Admin Software Add Sales Record Page</title>
  	<link href= "styles/style.css" rel="stylesheet"/>
	<script src="scripts/validation.js"></script>
</head>

<body>
	<?php include "includes/header.inc";?>
	<?php include "includes/menu.inc"; ?>

	<h1>Add Record</h1>


<!-- Form that adds the records into the database -->
<form action="includes/insert.inc.php" method="POST" id = "add_record">
	<?php
	//Opens to database 
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "pharmacy";

	//Connection to database
	$conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($conn->connect_error) {
	  die("Connection failed: " . $conn->connect_error);
	}
	
	//Creates query of all the items name 
	$result = mysqli_query($conn, "select * from items"); 
	
	//Creates drop down menu for each Item Name in Item Table 
	echo"<select>"; 
	echo "<option></option>"; 
		while ($row=mysqli_fetch_array($result)){
			echo"<option>$row[ItemName]</option>"; 
		}
	echo"</select>"; 
	
	mysqli_close($conn); 
	?>
	
	<br>
	<br>
	<input type="text" name="id" id = "id" placeholder="Item ID">
	<br>
	<br>
	<input type="text" name="price" placeholder="Item Price" required>
	<br>
	<br>
	<input type="text" id = "quantity" name="quantity" placeholder="Item Quantity" required>
	<br>
	<br>
	<input type="date" id = "date" name="date" placeholder="Date" required>
	<br>
	<br>
	<button type="submit" name="submit">Submit Order</button>
</form>

</body>
</html>