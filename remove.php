<?php

include './config.php';

$remove = "";
if (isset($_POST['id'])) {
    $remove = $_POST['id'];
}

$qry = "DELETE FROM tasks WHERE id=".$remove;
$result = mysqli_query($conn, $qry);

mysqli_close($conn);

?>