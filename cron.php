<?php 


$servername = "localhost";
$username = "root";
$password = "";
$db = "regulatory";

// Create connection
$conn = new mysqli($servername, $username, $password, $db);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// SI PESAT
$data_source = mysqli_query($conn, "SELECT * FROM t0source_sipesat WHERE status = 'new'");
$data = array();
while ($row=mysqli_fetch_array($data_source, MYSQLI_BOTH)) {
  
   $id_source   = $row['id'];
   $customer_code   = $row['customer_code'];
   $customer_name   = $row['customer_name'];
   $birth_place   = $row['birth_place'];
   $birth_date   = $row['birth_date'];
   $address   = $row['address'];
   $id_card_number   = $row['id_card_number'];
   $id_card_number_other   = $row['id_card_number_other'];
   $customer_cif   = $row['customer_cif'];
   $register_date   = $row['register_date'];
   $customer_type   = $row['customer_type'];
   $trx_date   = $row['trx_date'];
   $datestamp   = date('YmdHis');
   $status     = 'new';
    mysqli_query($conn, "UPDATE t0source_sipesat SET status = 'old' WHERE id = '".$row['id']."'  ");
    $data[] = "('', '$id_source', '$customer_code', '$customer_name', '$birth_place', '$birth_date', '$address', '$id_card_number', '$id_card_number_other', '$customer_cif', '$register_date', '$customer_type', '$trx_date', '$datestamp', '$status')";

}
$sql = "INSERT INTO t1clean_sipesat VALUES  ";
$sql .= implode(',', $data);
mysqli_query($conn, $sql);



// DANA FLOAT
$data_source = mysqli_query($conn, "SELECT * FROM t0source_danafloat WHERE status = 'new'");
$data = array();
while ($row=mysqli_fetch_array($data_source, MYSQLI_BOTH)) {
  
   $id_source   = $row['id'];
   $wallet_code   = $row['wallet_code'];
   $trx_code   = $row['trx_code'];
   $trx_id   = $row['trx_id'];
   $trx_type   = $row['trx_type'];
   $trx_value   = $row['trx_value'];
   $description   = $row['description'];
   $credit   = $row['credit'];
   $debit   = $row['debit'];
   $syslogno   = $row['syslogno'];
   $channel_id   = $row['channel_id'];
   $srac   = $row['srac'];
   $dsac   = $row['dsac'];
   $trx_datetime   = $row['trx_datetime'];
   $datestamp   = date('YmdHis');
   $status     = 'new';
    mysqli_query($conn, "UPDATE t0source_danafloat SET status = 'old' WHERE id = '".$row['id']."'  ");
    $data[] = "('', '$id_source', '$wallet_code', '$trx_code', '$trx_id', '$trx_type', '$trx_value', '$description', '$credit', '$debit', '$syslogno', '$channel_id', '$srac', '$dsac', '$trx_datetime', '$datestamp', '$status')";

}
$sql = "INSERT INTO t1clean_danafloat VALUES  ";
$sql .= implode(',', $data);
mysqli_query($conn, $sql);

echo "successfully";