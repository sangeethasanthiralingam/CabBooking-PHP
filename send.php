<?php

// Declare variables
$email = $_POST["email"];
$password = $_POST["password"];

// Include PHPMailer autoloader
require './PHPMailer/vendor/autoload.php';

// Import PHPMailer classes into the global namespace
// These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

// Create an instance; passing `true` enables exceptions
$mail = new PHPMailer(true);

try {
    // Server settings
    $mail->isSMTP();                                          // Send using SMTP
    $mail->Host       = 'smtp.gmail.com';                    // Set the SMTP server to send through
    $mail->SMTPAuth   = true;                                // Enable SMTP authentication
    $mail->Username   = 'alanbilla2023@gmail.com';          // SMTP username
    $mail->Password   = 'qqedrfhjvrzghswc';                  // SMTP password
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;           // Enable explicit TLS encryption (change to PHPMailer::ENCRYPTION_STARTTLS if needed)
    $mail->Port       = 465;                                 // TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

    // Recipients
    $mail->setFrom('alanbilla2023@gmail.com', 'TMS');
    $mail->addAddress($email);                               // Add a recipient

    // Content
    $mail->isHTML(true);                                     // Set email format to HTML
    $mail->Subject = 'Authorization for TMS';
    $mail->Body = 'Username: ' . $email . ' Password: ' . $password;
    $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

    $mail->send();
    echo 'Message has been sent';
} catch (Exception $e) {
    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
}
