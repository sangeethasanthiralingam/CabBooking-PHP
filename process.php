<?php require_once('./config.php') ?>
<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $ratePoints = $_POST["rating"];
    $description = $_POST["description"];

    // // Validate and sanitize the data if needed

    // // Connect to the database (replace with your actual database credentials)
    // $servername = "localhost";
    // $username = "your_username";
    // $password = "your_password";
    // $dbname = "your_database";

    // $conn = new mysqli($servername, $username, $password, $dbname);

    // Check the connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Insert data into the 'ratings' table
    $sql = "INSERT INTO ratings (rating, description) VALUES ('$ratePoints', '$description')";

    if ($conn->query($sql) === TRUE) {
        $_SESSION['success_message'] = "Rating stored successfully!";
        
        // Redirect to another page upon success
        // header("Location: view_booking.php");
    
      
    }

}
?>
