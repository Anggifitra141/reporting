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
   $datestamp   = date('Ymd');
   $status     = 'cleaned';
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
   $datestamp   = date('Ymd');
   $status     = 'cleaned';
    mysqli_query($conn, "UPDATE t0source_danafloat SET status = 'old' WHERE id = '".$row['id']."'  ");
    $data[] = "('', '$id_source', '$wallet_code', '$trx_code', '$trx_id', '$trx_type', '$trx_value', '$description', '$credit', '$debit', '$syslogno', '$channel_id', '$srac', '$dsac', '$trx_datetime', '$datestamp', '$status')";

}
$sql = "INSERT INTO t1clean_danafloat VALUES  ";
$sql .= implode(',', $data);
mysqli_query($conn, $sql);


// LTKL
$data_source = mysqli_query($conn, "SELECT * FROM t0source_ltkl WHERE status = 'new'");
$data = array();
while ($row=mysqli_fetch_array($data_source, MYSQLI_BOTH)) {

  $country = preg_replace('/\s*/', "", strtolower($row['sender_country']));
  $cek_sender_country = mysqli_query($conn, "SELECT `code` FROM tltkl_country WHERE LOWER(REPLACE(description, ' ', '')) =  '".$country."'")->fetch_array();
  if($cek_sender_country)
  {
    $sender_country = $cek_sender_country['code'];
    $id_source   = $row['id'];
   $sender_name   = $row['sender_name'];
   $sender_addr   = $row['sender_addr'];
   $sender_id   = $row['sender_id'];
   $destbankacc   = $row['destbankacc'];
   $notes   = $row['notes'];
   $recept_name   = $row['recept_name'];
   $recept_addr   = $row['recept_addr'];
   $recept_city   = $row['recept_city'];
   $recept_city1   = $row['recept_city1'];
   $recept_province   = $row['recept_province'];
   $recept_province1   = $row['recept_province1'];
   $recept_id   = $row['recept_id'];
   $destamount   = $row['destamount'];
   $sender_aiming   = $row['sender_aiming'];
   $trx_date   = $row['trx_date'];
   $datestamp   = date('Ymd');
   $status     = 'cleaned';
    mysqli_query($conn, "UPDATE t0source_ltkl SET status = 'old' WHERE id = '".$row['id']."'  ");
    $data[] = "('', '$id_source', '$sender_name', '$sender_country', '$sender_addr', '$sender_id', '$destbankacc', '$notes', '$recept_name', '$recept_addr', '$recept_city', '$recept_city1', '$recept_province', '$recept_province1', '$recept_id', '$destamount', '$sender_aiming', '$trx_date', '$datestamp', '$status')"; 
  }

}
$sql = "INSERT INTO t1clean_ltkl VALUES  ";
$sql .= implode(',', $data);
mysqli_query($conn, $sql);


// LKPBU 302 CARD
$data_source = mysqli_query($conn, "SELECT * FROM t0source_lkpbu_302_card WHERE status = 'new'");
$data = array();
while ($row=mysqli_fetch_array($data_source, MYSQLI_BOTH)) {

  
    $id_source   = $row['id'];
   $cust_code   = $row['cust_code'];
   $cust_type_id   = $row['cust_type_id'];
   $city_id   = $row['city_id'];
   $status_card   = $row['status_card'];
   $register_date   = $row['register_date'];
   $datestamp   = date('Ymd');
   $status     = 'cleaned';
    mysqli_query($conn, "UPDATE t0source_lkpbu_302_card SET status = 'old' WHERE id = '".$row['id']."'  ");
    $data[] = "('', '$id_source', '$cust_code', '$cust_type_id', '$city_id', '$status_card', '$register_date', '$datestamp', '$status')"; 
  

}
$sql = "INSERT INTO t1clean_lkpbu_302_card VALUES  ";
$sql .= implode(',', $data);
mysqli_query($conn, $sql);

// LKPBU 302 DANAfloat
$data_source = mysqli_query($conn, "SELECT * FROM t0source_lkpbu_302_danafloat WHERE status = 'new'");
$data = array();
while ($row=mysqli_fetch_array($data_source, MYSQLI_BOTH)) {

  
    $id_source   = $row['id'];
   $cust_code   = $row['cust_code'];
   $cust_type_id   = $row['cust_type_id'];
   $city_id   = $row['city_id'];
   $curr_balance   = $row['curr_balance'];
   $trx_datetime   = $row['trx_datetime'];
   $datestamp   = date('Ymd');
   $status     = 'cleaned';
    mysqli_query($conn, "UPDATE t0source_lkpbu_302_danafloat SET status = 'old' WHERE id = '".$row['id']."'  ");
    $data[] = "('', '$id_source', '$cust_code', '$cust_type_id', '$city_id', '$curr_balance', '$trx_datetime', '$datestamp', '$status')"; 
  

}
$sql = "INSERT INTO t1clean_lkpbu_302_danafloat VALUES  ";
$sql .= implode(',', $data);
mysqli_query($conn, $sql);

// LKPBU 302 TRX
$data_source = mysqli_query($conn, "SELECT * FROM t0source_lkpbu_302_trx WHERE status = 'new'");
$data = array();
while ($row=mysqli_fetch_array($data_source, MYSQLI_BOTH)) {

  
    $id_source   = $row['id'];
   $cust_code   = $row['cust_code'];
   $cust_type_id   = $row['cust_type_id'];
   $city_id   = $row['city_id'];
   $trx_value   = $row['trx_value'];
   $trx_code   = $row['trx_code'];
   $wstransfertype   = $row['wstransfertype'];
   $trx_datetime   = $row['trx_datetime'];
   $datestamp   = date('Ymd');
   $status     = 'cleaned';
    mysqli_query($conn, "UPDATE t0source_lkpbu_302_trx SET status = 'old' WHERE id = '".$row['id']."'  ");
    $data[] = "('', '$id_source', '$cust_code', '$cust_type_id', '$city_id', '$trx_value', '$trx_code', '$wstransfertype', '$trx_datetime', '$datestamp', '$status')"; 
  

}
$sql = "INSERT INTO t1clean_lkpbu_302_trx VALUES  ";
$sql .= implode(',', $data);
mysqli_query($conn, $sql);

// LKPBU 302 VOL
$data_source = mysqli_query($conn, "SELECT * FROM t0source_lkpbu_302_vol WHERE status = 'new'");
$data = array();
while ($row=mysqli_fetch_array($data_source, MYSQLI_BOTH)) {

  
    $id_source   = $row['id'];
   $cust_code   = $row['cust_code'];
   $cust_type_id   = $row['cust_type_id'];
   $city_id   = $row['city_id'];
   $trx_value   = $row['trx_value'];
   $init_amount   = $row['init_amount'];
   $trx_datetime   = $row['trx_datetime'];
   $datestamp   = date('Ymd');
   $status     = 'cleaned';
    mysqli_query($conn, "UPDATE t0source_lkpbu_302_vol SET status = 'old' WHERE id = '".$row['id']."'  ");
    $data[] = "('', '$id_source', '$cust_code', '$cust_type_id', '$city_id', '$trx_value', '$init_amount', '$trx_datetime', '$datestamp', '$status')"; 
  

}
$sql = "INSERT INTO t1clean_lkpbu_302_vol VALUES  ";
$sql .= implode(',', $data);
mysqli_query($conn, $sql);



// QRIS MERCHANT
$data_source = mysqli_query($conn, "SELECT * FROM t0source_qris_merchant WHERE status = 'new'");
$data = array();
while ($row=mysqli_fetch_array($data_source, MYSQLI_BOTH)) {

  $city = preg_replace('/\s*/', "", strtolower($row['city']));
  $cek_city = mysqli_query($conn, "SELECT `to` FROM t3role_model WHERE `table` = 'QRIS' AND LOWER(REPLACE(`from`, ' ', '')) =  '".$city."'")->fetch_array();
  
  if($cek_city)
  {
    $id_source   = $row['id'];
    $city = $cek_city['to'];
    $merchant_name   = $row['merchant_name'];
    $mcc   = $row['mcc'];
    $merchant_criteria   = $row['merchant_criteria'];
    $merchant_status   = $row['merchant_status'];
    $activation_peroid   = date('Ymd', strtotime($row['activation_peroid']));
    $datestamp   = date('Ymd');
    $status     = 'cleaned';
    mysqli_query($conn, "UPDATE t0source_qris_merchant SET status = 'old' WHERE id = '".$row['id']."'  ");
    $data[] = "('".''."', '".$id_source."', '".$merchant_name."', '".$city."', '".$mcc."', '".$merchant_criteria."', '".$merchant_status."', '".$activation_peroid."', '".$datestamp."', '".$status."')"; 
  }

}
$sql = "INSERT INTO t1clean_qris_merchant VALUES  ";
$sql .= implode(',', $data);
$test = mysqli_query($conn, $sql);

// QRIS TRX
$data_source = mysqli_query($conn, "SELECT * FROM t0source_qris_trx WHERE status = 'new'");
$data = array();
while ($row=mysqli_fetch_array($data_source, MYSQLI_BOTH)) {

  $city = preg_replace('/\s*/', "", strtolower($row['city']));
  $cek_city = mysqli_query($conn, "SELECT `to` FROM t3role_model WHERE `table` = 'QRIS' AND LOWER(REPLACE(`from`, ' ', '')) =  '".$city."'")->fetch_array();
  
  if($cek_city)
  {
    $id_source   = $row['id'];
    $city = $cek_city['to'];
    $pjsp   = $row['pjsp'];
    $mcc   = $row['mcc'];
    $merchant_criteria   = $row['merchant_criteria'];
    $vol_trx   = $row['vol_trx'];
    $amount_trx   = $row['amount_trx'];
    $trx_date   = date('Ymd', strtotime($row['trx_date']));
    $datestamp   = date('Ymd');
    $status     = 'cleaned';
    mysqli_query($conn, "UPDATE t0source_qris_trx SET status = 'old' WHERE id = '".$row['id']."'  ");
    $data[] = "('".''."', '".$id_source."', '".$city."', '".$pjsp."', '".$mcc."', '".$merchant_criteria."', '".$vol_trx."', '".$amount_trx."', '".$trx_date."', '".$datestamp."', '".$status."')"; 
  }

}
$sql = "INSERT INTO t1clean_qris_trx VALUES  ";
$sql .= implode(',', $data);
$test = mysqli_query($conn, $sql);
echo "successfully";