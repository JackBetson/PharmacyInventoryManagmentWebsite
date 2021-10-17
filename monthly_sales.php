<!DOCTYPE html>
<html>
<head>
	<title>DB Setup</title>
	<meta charset="utf-8" />
  	<meta name="description" content="Display Monthly Sales Record" />
  	<meta name="keywords" content="HTML5, tags" />
  	<meta name="author" content="Jack Betson"  />
  	<title>People Health Pharmacy Inc. Admin Software Display Monthly Sales Record Page</title>
  	<link href= "styles/style.css" rel="stylesheet"/>
</head>

<body>
	<?php include "includes/header.inc";?>
    <?php include "includes/menu.inc"; ?>
    <h1> Monthly Sales Records</h1>
    <?php
        require_once ("settings.php");
        $conn = @mysqli_connect($host,
                    $user,
                    $pwd,
                    $sql_db
                );
        
        $query = "SELECT * FROM MonthlySales;";
        $result = mysqli_query($conn, $query);

        echo "\n<table id='resultTable'>\n";
		echo "<tr>\n "
		."<th scope=\"col\">Item ID</th>\n "
		."<th scope=\"col\">Item Name</th>\n "
		."<th scope=\"col\">Total Items Sold</th>\n "
		."<th scope=\"col\">Total Income</th>\n "
        ."<th scope=\"col\">Month</th>\n "
		."</tr>\n ";

        while ($row = mysqli_fetch_assoc($result)){
            echo "<tr>\n "
            ."<td>", $row["ItemID"], "</td>\n "
            ."<td>", $row["ItemName"], "</td>\n "
            ."<td>", $row["TotalSold"], "</td>\n "
            ."<td>", $row["TotalProfit"], "</td>\n "
            ."<td>", $row["Month"], "</td>\n "
            ."</tr>\n ";
        }
        echo "</table>\n ";
    ?>
</body>
</html>