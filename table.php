<?php

include './config.php';

$sql = "SELECT id, task_name, task_time, task_date FROM tasks ORDER BY ID DESC";
$result = mysqli_query($conn, $sql);
$rows = array();
while($r = mysqli_fetch_assoc($result)) {
    $rows[] = $r;
}
header('Content-type: application/json');
echo json_encode($rows);

mysqli_close($conn);

?>