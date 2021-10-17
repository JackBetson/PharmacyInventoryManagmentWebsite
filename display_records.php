<!DOCTYPE html>
<html>
<head>
	<title>DB Setup</title>
	<meta charset="utf-8" />
  	<meta name="description" content="Display Sales Record" />
  	<meta name="keywords" content="HTML5, tags" />
  	<meta name="author" content="Jack Betson"  />
  	<title>People Health Pharmacy Inc. Admin Software Display Sales Record Page</title>
  	<link href= "styles/style.css" rel="stylesheet"/>
</head>

<body>
	<?php include "includes/header.inc";?>
    <?php include "includes/menu.inc"; ?>
    <h1> All Sales Records</h1>
    <?php
        require_once ("settings.php");
        $conn = @mysqli_connect($host,
                    $user,
                    $pwd,
                    $sql_db
                );
        
        $query = "SELECT * FROM DisplayRecords ORDER BY SalesID DESC;";
        $result = mysqli_query($conn, $query);

        echo "\n<table id='resultTable'>\n";
		echo "<tr>\n "
		."<th scope=\"col\">Sales ID</th>\n "
		."<th scope=\"col\">Item Name</th>\n "
		."<th scope=\"col\">Item Price</th>\n "
		."<th scope=\"col\">Item Quantity</th>\n "
        ."<th scope=\"col\">Total Price</th>\n "
        ."<th scope=\"col\">Order Date</th>\n "
		."</tr>\n ";

        while ($row = mysqli_fetch_assoc($result)){
            echo "<tr>\n "
            ."<td>", $row["SalesID"], "</td>\n "
            ."<td>", $row["ItemName"], "</td>\n "
            ."<td>", $row["ItemPrice"], "</td>\n "
            ."<td>", $row["Quantity"], "</td>\n "
            ."<td>", $row["Total"], "</td>\n "
            ."<td>", $row["OrderDate"], "</td>\n "
            ."<td>", "<a href='edit_record.php?id=$row[SalesID]'>", "<button class='editButton'>", "Edit",  "</button>", "</a>", "</td>\n "
            ."</tr>\n ";
        }
        echo "</table>\n ";
    ?>
</body>
</html>