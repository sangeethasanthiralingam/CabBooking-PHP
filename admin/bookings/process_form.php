<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<?php

// Retrieve form data
$cab_id = $_POST["cab_id"];
$client_id = $_POST["client_id"];
$ref_code = $_POST["ref_code"];
$pickup_zone = $_POST["pickup_zone"];
$drop_zone = $_POST["drop_zone"];

// Perform database insertion
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cbsphp";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "INSERT INTO booking_list (cab_id, client_id, ref_code, pickup_zone, drop_zone) VALUES ('$cab_id', '$client_id', '$ref_code', '$pickup_zone', '$drop_zone')";

if ($conn->query($sql) === TRUE) {
    echo "Record inserted successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
