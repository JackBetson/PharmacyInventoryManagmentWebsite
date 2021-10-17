<?php

// db connection file
include_once 'dbh.inc.php';

/*$servername = "localhost";
$username = "root";
$password = "";
$dbname = "pharmarcy";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}*/

$id = $_POST['id'];
$name = $_POST['itemName'];
$price = $_POST['price'];
$quantity = $_POST['quantity'];
$date = $_POST['date'];
$total = $quantity * $price; 

$sql = "INSERT INTO sales (itemID, Quantity, Total, OrderDate)
VALUES ($id, '$quantity', $total, '$date');";

if ($conn->query($sql) === TRUE) {
  echo "New record created successfully";
} else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}
$conn->close();

header("Location: ../add_record.php")
?>