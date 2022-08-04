<?php
error_reporting(0);
include_once ("dbconnect.php");

$search = $_POST["search"];



if (isset($search)){
   $sql = "SELECT * FROM Contact WHERE user LIKE  '%$search%' 
   OR phone LIKE  '%$search%' 
    OR check_in LIKE  '%$search%' 
    ORDER BY user ASC;
   ";
}else {
    $sql = "SELECT * FROM Contact 
    ORDER BY user ASC;";    
}


$result = $conn->query($sql);

if ($result->num_rows)
{

    $response["contact"] = array();
    while ($row = $result->fetch_assoc())
    {
        $contactlist = array();
        $contactlist["user"] = $row["user"];
        $contactlist["phone"] = $row["phone"];
        $contactlist["check_in"] = $row["check_in"];
        
        array_push($response["contact"], $contactlist);
    }
    echo json_encode($response);
}
else
{
    echo 'nodata';
}
?>