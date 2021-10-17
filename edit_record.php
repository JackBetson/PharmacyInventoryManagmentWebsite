<!DOCTYPE html>
<html>
<head>
	<title>DB Setup</title>
	<meta charset="utf-8" />
  	<meta name="description" content="Add Sales Record" />
  	<meta name="keywords" content="HTML5, tags" />
  	<meta name="author" content="Jack Betson"  />
  	<title>People Health Pharmacy Inc. Admin Software Display Sales Record Page</title>
  	<link href= "styles/style.css" rel="stylesheet"/>
</head>

<body>
	<?php include "includes/header.inc";?>
    <?php include "includes/menu.inc"; ?>
    <?php
        require_once ("settings.php");
        $conn = @mysqli_connect($host,
                    $user,
                    $pwd,
                    $sql_db
                );
        
        $id = $_GET['id'];
        $qry = mysqli_query($conn,"SELECT * FROM sales WHERE SalesID='$id'"); // select query
        $data = mysqli_fetch_array($qry); // fetch data

        if(isset($_POST['update'])) // when click on Update button
        {
            $SalesID = $_POST['SalesID'];
            $ItemID = $_POST['ItemID'];
            $Quantity = $_POST['Quantity'];
            $Total = $_POST['OrderTotal'];
            $OrderDate = $_POST['OrderDate'];
            
            $edit = mysqli_query($conn,"UPDATE sales SET SalesID='$SalesID', ItemID='$ItemID', Quantity='$Quantity', Total='$Total', OrderDate='$OrderDate' WHERE SalesID='$id'");
            
            if($edit)
            {
                mysqli_close($conn); // Close connection
                header("location:display_records.php"); // redirects to all records page
                exit;
            }
            else
            {
                echo mysqli_error();
            }    	
        }
        ?>
        
        <h3>Update Data</h3>
        
        <form method="POST">
            <label for="SalesID">Sales ID</label>
            <input type="text" name="SalesID" value="<?php echo $data['SalesID'] ?>" placeholder="Enter Sales ID" Required>
            <label for="ItemID">Item ID</label>
            <input type="text" name="ItemID" value="<?php echo $data['ItemID'] ?>" placeholder="Enter Item ID" Required>
            <label for="Quantity">Quantity</label>
            <input type="text" name="Quantity" value="<?php echo $data['Quantity'] ?>" placeholder="Enter Quantity" Required>
            <label for="OrderTotal">Total</label>
            <input type="text" name="OrderTotal" value="<?php echo $data['Total'] ?>" placeholder="Enter Order Total" Required>
            <label for="OrderDate">Order Date</label>
            <input type="date" name="OrderDate" value="<?php echo $data['OrderDate'] ?>" placeholder="Enter Order Date" Required>
            <input type="submit" name="update" value="Update">
        </form>
</body>
</html>