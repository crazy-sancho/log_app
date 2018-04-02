<?php

$servername = "localhost";
$username = "admin";
$password = "admin";
$dbname = "test";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn === false) {
    die("Connection failed: " . mysqli_connect_error());
}

?>