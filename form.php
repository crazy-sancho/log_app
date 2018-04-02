<?php

include './config.php';

$task_name = "";
$task_time = "";
if (isset($_POST['task-name']) && isset($_POST['task-time'])) {
    $task_name = $_POST['task-name'];
    $task_time = $_POST['task-time'];
}
date_default_timezone_set('Europe/Riga');
$task_date = date('Y-m-d H:i:s', time());

// INSERT NEW VARIABLES
$insert = "INSERT INTO tasks VALUES ('', '$task_name','$task_time', '$task_date')";

if ( !empty($task_name) && !empty($task_time) ) {
    mysqli_query($conn, $insert);

    // NEW DATA
    $sql = "SELECT id, task_name, task_time, task_date FROM tasks ORDER BY ID DESC LIMIT 1";
    $result = mysqli_query($conn, $sql);
    $rows = array();
    while($r = mysqli_fetch_assoc($result)) {
        $rows[] = $r;
    }
    header('Content-type: application/json');
    echo json_encode($rows);
} else {
    mysqli_close($conn);
}

?>
