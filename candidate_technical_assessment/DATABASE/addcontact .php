<?php
error_reporting(0);
include_once ("dbconnect.php");
$user = $_POST['user'];
$phone = $_POST['phone'];
date_default_timezone_set("Asia/Kuala_Lumpur");
$checkin =date('Y-m-d H:i:s');


$sqlinsert = "INSERT INTO Contact(user,phone,check_in) 
VALUES ('$user','$phone','$checkin')";

if ($conn->query($sqlinsert) === true)
{
    echo "success";
}
else
{
    echo "failed";
}

?>