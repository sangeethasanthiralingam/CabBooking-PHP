<?php require_once('../config.php'); ?>
<?php
$newCurrentPlace = $_POST["current_place"];
$status = $_POST["status"];
$userId =1;

$updateQuery = "UPDATE cab_list  SET avai= $status , current_place = '$newCurrentPlace' WHERE id = $userId";

if ($conn->query($updateQuery) === TRUE) {
    // Redirect to a success page
    header("Location: index.php");
    exit();
}

?>