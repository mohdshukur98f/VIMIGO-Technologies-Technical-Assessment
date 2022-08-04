<?php
$servername = "localhost";
$username   = "seriousl_mohdshukur";
$password   = "mohdshukur";
$dbname     = "seriousl_technical_assessment";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>