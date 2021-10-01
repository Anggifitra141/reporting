<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Utilities extends CI_Controller {

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
	{
		parent::__construct();
    $this->load->model(['M_raw_data', 'M_tltdbb_source', 'M_tltdbb_clean', 'M_ltkl_source', 'M_qris_merchant_source']);
		if(!$this->session->userdata('logged_in'))
    {
      $data=array();
			$data['msg'] = "Maaf Anda tidak punya akses ke halaman ini !";
			$content = $this->load->view('errors/html/error_sessi', $data, TRUE);
			exit($content);
    }
	}

	public function index()
	{
    // $data= [];
    // $data['content'] = $this->load->view('campaign/index', $data, TRUE);
		// $this->load->view('layout', $data);
	}

  public function role_clean()
  {
    $data['sender_country'] = $this->db->query("SELECT DISTINCT t1clean_ltdbb.sender_country FROM t1clean_ltdbb WHERE status='cleaned'")->result_array();;
		$data['recept_country'] = $this->db->query("SELECT DISTINCT t1clean_ltdbb.recept_country FROM t1clean_ltdbb WHERE status='cleaned'")->result_array();
    $data['country'] = $this->db->query("SELECT country name FROM tltdbb_bi_country")->result();
    $data['content'] = $this->load->view('utilities/role_clean', $data, TRUE);
		$this->load->view('layout', $data);
  }

  public function listscountry($value=''){
		// $sender = str_replace("_", " ",$value);
		$data['header']			= $value ;
		$data['page']  			= 'lists country';
    $data['city_result']       = $this->db->query("SELECT bi_code, bi_city FROM tltdbb_bi_city")->result();
		$data['sender_country'] 	= $this->db->query("SELECT DISTINCT sender_city, sender_city,sender_country From t1clean_ltdbb WHERE sender_country='$value'")->result_array();
		$data['content'] = $this->load->view('utilities/list_country', $data, TRUE);
		$this->load->view('layout', $data);
	}
  function uscity()
	{
		$id = $this->input->post('id');
		$name = $this->input->post('sender');
		$contry = $this->input->post('contry');
		$data['sender_city'] = $name;
		$this->db->trans_start();
		$this->db->where('sender_city', $id);
		$this->db->update('t1clean_ltdbb', $data);
		$this->db->trans_complete();
		$this->session->set_flashdata("msg", "<div class='alert alert-success' role='alert' style='font-size: 10px; margin:15px 0px -15px 0px;'>
		Upadated Done!
		</div><br/><br/>");
		$url = 'utilities/listscountry';
		echo'
		<script>
		window.location.href = "'.base_url().$url.'/'.$contry.'";
		</script>
		';
		//redirect('utilities/manual');
	}
  function sender_country($value=''){
		$sender = str_replace("_", " ",$value);
		$data['sender_country'] 	= $this->db->query("SELECT sender_country FROM t1clean_ltdbb WHERE sender_country = '$sender' LIMIT 1")->result_array();
		$data['country']		= $this->db->query("SELECT name FROM tcountrycode")->result();
		$data['content'] = $this->load->view('utilities/sender_country', $data, TRUE);
		$this->load->view('layout', $data);
	}
  function uscountry()
	{
		$id = $this->input->post('id');
		$name = $this->input->post('name');
		$data['sender_country'] = $name;
		$this->db->trans_start();
		$this->db->where('sender_country', $id);
		$this->db->where('status', 'cleaned');
		$this->db->update('t1clean_ltdbb', $data);
		$this->db->trans_complete();
		$this->session->set_flashdata("msg", "<div class='alert alert-success' role='alert' style='font-size: 10px; margin:15px 0px -15px 0px;'>
		Upadated Done!
		</div><br/><br/>");
		redirect('utilities/role_clean');
	}

  // START :: RECEIPT COUNTRY
  public function listreceipt($value="")
  {
    $receipt				= str_replace("_", " ",$value);
		$data['header']			= $receipt ;
		$data['page']  			= 'listrcountry';
		$data['receptcountry']	= $this->db->query("SELECT DISTINCT recept_city, recept_country From t1clean_ltdbb WHERE recept_country='$receipt'")->result_array();
    $data['recept']       = $this->db->query("SELECT bi_code, bi_city FROM tltdbb_bi_city")->result();
		$data['content'] = $this->load->view('utilities/listreceipt', $data, TRUE);
		$this->load->view('layout', $data);
  }
  public function urcity()
	{
		$id = $this->input->post('id');
		$name = $this->input->post('name');
		$contry = $this->input->post('contry');
		$data['recept_city'] = $name;
		$this->db->trans_start();
		$this->db->where('recept_city', $id);
		$this->db->where('status', 'cleaned');
		$this->db->update('t1clean_ltdbb', $data);
		$this->db->trans_complete();
		$this->session->set_flashdata("msg", "<div class='alert alert-success' role='alert' style='font-size: 10px; margin:15px 0px -15px 0px;'>
		Upadated Done!
		</div><br/><br/>");
		$url = 'utilities/listreceipt';
		echo'
		<script>
		window.location.href = "'.base_url().$url.'/'.$contry.'";
		</script>
		';
		//redirect('utilities/manual');
	}
  function urcountry()
	{
		$id = $this->input->post('id');
		$name = $this->input->post('name');
		$data['recept_country'] = $name;
		$this->db->trans_start();
		$this->db->where('recept_country', $id);
		$this->db->where('status', 'cleaned');
		$this->db->update('t1clean_ltdbb', $data);
		$this->db->trans_complete();
		$this->session->set_flashdata("msg", "<div class='alert alert-success' role='alert' style='font-size: 10px; margin:15px 0px -15px 0px;'>
		Upadated Done!
		</div><br/><br/>");
		redirect('utilities/role_clean');
	}
  // END :: RECEIPT COUNTRY


	// START :: AUTO CLEAN
  public function auto_clean()
  {
    $data= [];
    $data['content'] = $this->load->view('utilities/auto_clean', $data, TRUE);
		$this->load->view('layout', $data);
  }
	public function ajax_raw_data()
	{
		$this->db->where('status', "new");
    $list = $this->M_tltdbb_source->get_datatables();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
      $row = array();
      $row[] = date('d-m-Y', strtotime($item->trx_date));
      $row[] = strtoupper($item->status);
      $row[] = $item->sender_country;
      $row[] = $item->sender_city;
			$row[] = $item->recept_country;
      $row[] = $item->recept_city;
      $row[] = $item->sender_name;
      $row[] = $item->recept_name;
      $row[] = $this->lib->rupiah($item->trx_amount);
      $data[] = $row;
    }
    $recordsTotal = $this->M_tltdbb_source->count_all();
    $recordsFiltered = $this->M_tltdbb_source->count_filtered();
    

    $output = array(
          "draw" => $_POST['draw'],
          "recordsTotal" => $recordsTotal,
          "recordsFiltered" => $recordsFiltered,
          "data" => $data,
        );
    echo json_encode($output);
	}
	public function json_auto_clean(){
		$result = $this->_proc_auto_clean();
		echo json_encode($result);
	}
	private function _proc_auto_clean()
  {
		$data['page'] 	= 'displayClean';
		$test = $this->db->query("SELECT * FROM t0source_ltdbb WHERE  status = 'new' ")->result_array();
		$datestamp = date("Ymd");
		$success = 0;
		$false = 0;
		$data_clean = [];
		$failed_clean = [];
		foreach($test as $SheetDataKey) {
			$row_failed = array();
			$id 						= $SheetDataKey['id'];
			$sender_country = preg_replace('/\s*/', '', strtolower($SheetDataKey['sender_country']));
			$sender_city 		= preg_replace('/\s*/', '', strtolower($SheetDataKey['sender_city']));
			$recept_country = preg_replace('/\s*/', '', strtolower($SheetDataKey['recept_country']));
			$recept_city 		= preg_replace('/\s*/', '', strtolower($SheetDataKey['recept_city']));
			$sender_name 		= strtoupper($SheetDataKey['sender_name']);
			$recept_name 		= strtoupper($SheetDataKey['recept_name']);
			$recept_phone		= $SheetDataKey['recept_phone'];
			$description		= $SheetDataKey['description'];
			$trx_amount		= $SheetDataKey['trx_amount'];
			$trx_freq		= $SheetDataKey['trx_freq'];
			$trx_date		= $SheetDataKey['trx_date'];
			$trx_type		= $SheetDataKey['trx_type'];


			//Cleanser sender_country
			$cek_sender_country = $this->db->query("SELECT `to` as `to` FROM t3role_model WHERE LOWER(REPLACE(`from`, ' ', '')) = '".$sender_country."' AND `table` = 'ltdbb' AND field = 'sender_country'  ")->row();
			if($cek_sender_country){
				$sender_country = $cek_sender_country->to;
			}
			//Cleanser sender_city
			$cek_sender_city = $this->db->query("SELECT `to` as `to` FROM t3role_model WHERE LOWER(REPLACE(`from`, ' ', '')) = '".$sender_city."' AND `table` = 'ltdbb' AND field = 'sender_city'  ")->row();
			if($cek_sender_city){
				$sender_city = $cek_sender_city->to;
			}
			//Cleanser recept_country
			$cek_recept_country = $this->db->query("SELECT `to` as `to` FROM t3role_model WHERE LOWER(REPLACE(`from`, ' ', '')) = '".$recept_country."' AND `table` = 'ltdbb' AND field = 'recept_country'  ")->row();
			if($cek_recept_country){
				$recept_country = $cek_recept_country->to;
			}
			//Cleanser recept_city
			$cek_recept_city = $this->db->query("SELECT `to` as `to` FROM t3role_model WHERE LOWER(REPLACE(`from`, ' ', '')) = '".$recept_city."' AND `table` = 'ltdbb' AND field = 'recept_city'  ")->row();
			if($cek_recept_city){
				$recept_city = $cek_recept_city->to;
			}
			
			if($cek_sender_country && $cek_sender_city && $cek_recept_country && $cek_recept_city ){
				$result = $this->db->insert('t1clean_ltdbb', [
					'id_source'					=> $id,
					'sender_country'		=> $sender_country,
					'sender_city'				=> $sender_city,
					'recept_country'		=> $recept_country,
					'recept_city'				=> $recept_city,
					'sender_name'				=> $sender_name,
					'recept_name'				=> $recept_name,
					'recept_phone'			=> $recept_phone,
					'description'				=> $description,
					'trx_amount'				=> $trx_amount,
					'trx_freq'					=> $trx_freq,
					'trx_type'					=> $trx_type,
					'trx_date'					=> $trx_date,
					'datestamp'					=> date('Ymd'),
					'status'						=> 'cleaned'
				]);
				$this->db->update('t0source_ltdbb', ['status' => 'old'], ['id' => $id]);
				$success++;
			}else{
				if(!$cek_sender_country){
					$failed_clean[] = [
						'sender_country'		=> $SheetDataKey['sender_country']
					];
				}
				if(!$cek_sender_city){
					$failed_clean[] = [
						'sender_city'		=> $SheetDataKey['sender_city']
					];
				}
				if(!$cek_recept_country){
					$failed_clean[] = [
						'recept_country'		=> $SheetDataKey['recept_country']
					];
				}
				if(!$cek_recept_city){
					$failed_clean[] = [
						'recept_city'		=> $SheetDataKey['recept_city']
					];
				}
				$false++;
			}
		}

		if($false > 0 ){
			$fail_clean = array();
			$form_clean = array();
			foreach ($failed_clean as $key => $value){
				if(!in_array($value, $fail_clean)){
					$fail_clean[$key] = $value;
					if( key($value) == 'sender_country'){
						$form_clean[$key]= '
									<div class="row">
										<div class="col-md-6">
										<div class="form-group">
											<label>Before Sender Country</label>
											<input type="text" class="form-control" name="before_sender_country[]" value="'. $value['sender_country'] .'" readonly>
											<span class="invalid-feedback"></span>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>To Sender Country</label>
											<input type="text" class="form-control" name="to_sender_country[]">
											<span class="invalid-feedback"></span>
										</div>
									</div>
								</div>
							';
					}
					if( key($value) == 'sender_city'){
						$form_clean[$key]= '
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Before Sender city</label>
										<input type="text" class="form-control" name="before_sender_city[]" readonly value="'. $value['sender_city'] .'">
										<span class="invalid-feedback"></span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>To Sender city</label>
										<input type="text" class="form-control" name="to_sender_city[]">
										<span class="invalid-feedback"></span>
									</div>
								</div>
							</div>
							';
					}
					if( key($value) == 'recept_country'){
						$form_clean[$key]= '
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Before Recept Country</label>
										<input type="text" class="form-control" name="before_recept_country[]" readonly value="'.$value['recept_country'].'">
										<span class="invalid-feedback"></span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>To Recept Country</label>
										<input type="text" class="form-control" name="to_recept_country[]">
										<span class="invalid-feedback"></span>
									</div>
								</div>
							</div>
							';
					}
					if( key($value) == 'recept_city'){
						$form_clean[$key]= '
							<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label>Before recept City</label>
									<input type="text" class="form-control" name="before_recept_city[]" readonly value="'.$value['recept_city'].'">
									<span class="invalid-feedback"></span>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>To recept City</label>
									<input type="text" class="form-control" name="to_recept_city[]">
									<span class="invalid-feedback"></span>
								</div>
							</div>
						</div>
							';
					}
					
				}
			}
		}
			
		return array('status' => true, 'success' => $success, 'false' => $false, 'fail_clean' => array_slice($form_clean, 0, 10));
	}
	function group_by($key, $data) {
    $result = array();

    foreach($data as $val) {
        if(array_key_exists($key, $val)){
            $result[$val[$key]][] = $val;
        }else{
            $result[""][] = $val;
        }
    }

    return $result;
}
	// END :: AUTO CLEAN

	// START :: AUTO CLEAN LTKL
	public  function auto_clean_ltkl(){
		$data= [];
    $data['content'] = $this->load->view('utilities/auto_clean_ltkl', $data, TRUE);
		$this->load->view('layout', $data);
	}
	public function ajax_rawdata_ltkl()
	{
		
    $list = $this->M_ltkl_source->get_datatables();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
      $row = array();
      $row[] = date('d/m/Y', strtotime($item->trx_date));
      $row[] = $item->sender_name;
      $row[] = $item->sender_country;
      $row[] = $item->sender_addr;
			$row[] = $item->sender_id;
      $row[] = $item->destbankacc;
      $row[] = $item->notes;
      $row[] = $item->recept_name;
			$row[] = $item->recept_addr;
      $data[] = $row;
    }
		
    $recordsTotal = $this->M_ltkl_source->count_all();
		
    $recordsFiltered = $this->M_ltkl_source->count_filtered();
    

    $output = array(
          "draw" => $_POST['draw'],
          "recordsTotal" => $recordsTotal,
          "recordsFiltered" => $recordsFiltered,
          "data" => $data,
        );
    echo json_encode($output);
	}
	public function json_auto_clean_ltkl(){
		$result = $this->_proc_auto_clean_ltkl();
		echo json_encode($result);
	}
	private function _proc_auto_clean_ltkl()
  {
		$test = $this->db->query("SELECT * FROM t0source_ltkl WHERE  status = 'new' ")->result_array();
		$datestamp = date("Ymd");
		$success = 0;
		$false = 0;
		$data_clean = [];
		$fail_clean = [];
		foreach($test as $SheetDataKey) {
			$id 										= $SheetDataKey['id'];
			$sender_name 						= strtoupper($SheetDataKey['sender_name']);
			$sender_country 				= preg_replace('/[0-9]+/', '', preg_replace('/\s*/', '', strtolower($SheetDataKey['sender_country'])));
			$sender_addr 						= strtoupper($SheetDataKey['sender_addr']);
			$sender_id 							= $SheetDataKey['sender_id'];
			$destbankacc 						= $SheetDataKey['destbankacc'];
			$notes 									= $SheetDataKey['notes'];
			$recept_name 						= strtoupper($SheetDataKey['recept_name']);
			$recept_addr 						= strtoupper($SheetDataKey['recept_addr']);
			$recept_city 						= strtoupper($SheetDataKey['recept_city']);
			$recept_city1 					= strtoupper($SheetDataKey['recept_city1']);
			$recept_province 				= strtoupper($SheetDataKey['recept_province']);
			$recept_province1 			= strtoupper($SheetDataKey['recept_province1']);
			$recept_id 							= $SheetDataKey['recept_id'];
			$destamount 						= $SheetDataKey['destamount'];
			$sender_aiming 					= strtoupper($SheetDataKey['sender_aiming']);
			$trx_date 							=	date('Ymd', strtotime($SheetDataKey['trx_date']));


			//Cleanser sender_country
			$cek_sender_country = $this->db->query("SELECT `to` as `to` FROM t3role_model WHERE LOWER(REPLACE(`from`, ' ', '')) = '".$sender_country."' AND `table` = 'ltkl' AND field = 'sender_country'  ")->row();
			if($cek_sender_country){
				$sender_country = $cek_sender_country->to;
			}
			
			if($cek_sender_country ){
				$result = $this->db->insert('t1clean_ltkl', [
					'id_source'					=> $id,
					'sender_name'		=> $sender_name,
					'sender_country'		=> $sender_country,
					'sender_addr'				=> $sender_addr,
					'sender_id'		=> $sender_id,
					'destbankacc'				=> $destbankacc,
					'notes'				=> $notes,
					'recept_name'				=> $recept_name,
					'recept_addr'			=> $recept_addr,
					'recept_city'				=> $recept_city,
					'recept_city1'				=> $recept_city1,
					'recept_province'					=> $recept_province,
					'recept_province1'					=> $recept_province1,
					'recept_id'					=> $recept_id,
					'destamount'					=> $destamount,
					'sender_aiming'					=> $sender_aiming,
					'trx_date'					=> $trx_date,
					'datestamp'					=> date('Ymd'),
					'status'						=> 'cleaned'
				]);
				$this->db->update('t0source_ltkl', ['status' => 'old'], ['id' => $id]);
				$success++;
			}else{
				$fail_clean[] = $SheetDataKey['sender_country'];
				// $this->db->update('t0source_ltkl', ['status' => 'failed'], ['id' => $id]);
				$false++;
			}
		}
			
		return array('status' => true, 'success' => $success, 'false' => $false, 'fail_clean' => $fail_clean);
	}

	// START :: AUTO CLEAN QRIS
	public  function auto_clean_qris(){
		$data= [];
    $data['content'] = $this->load->view('utilities/auto_clean_qris', $data, TRUE);
		$this->load->view('layout', $data);
	}
	public function ajax_rawdata_qris()
	{
		
    $list = $this->M_qris_merchant_source->get_datatables();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
      $row = array();
      $row[] = $item->merchant_name;
     $row[] = $item->city;
     $row[] = $item->mcc;
     $row[] = $item->merchant_criteria;
     $row[] = $item->merchant_status;
     $row[] = date('d/m/Y', strtotime($item->activation_peroid));
     $row[] = date('d/m/Y', strtotime($item->datestamp));
      $data[] = $row;
    }
		
    $recordsTotal = $this->M_qris_merchant_source->count_all();
		
    $recordsFiltered = $this->M_qris_merchant_source->count_filtered();
    

    $output = array(
          "draw" => $_POST['draw'],
          "recordsTotal" => $recordsTotal,
          "recordsFiltered" => $recordsFiltered,
          "data" => $data,
        );
    echo json_encode($output);
	}
	public function json_auto_clean_qris(){
		$result = $this->_proc_auto_clean_qris();
		echo json_encode($result);
	}
	private function _proc_auto_clean_qris()
  {
		$test = $this->db->query("SELECT * FROM t0source_qris_merchant WHERE  status = 'new' ")->result_array();
		$datestamp = date("Ymd");
		$success = 0;
		$false = 0;
		$data_clean = [];
		$fail_clean = [];
		foreach($test as $row) {
			$city = preg_replace('/\s*/', "", strtolower($row['city']));
			$cek_city = $this->db->query("SELECT `to` FROM t3role_model WHERE `table` = 'QRIS' AND LOWER(REPLACE(`from`, ' ', '')) =  '".$city."'")->row_array();
			
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
				$this->db->update("t0source_qris_merchant", ['status' => 'old'] , ['id' => $row['id']]);
				$this->db->insert('t1clean_qris_merchant', [
					'id_source'		=> $id_source,
					'merchant_name'		=> $merchant_name,
					'city'		=> $city,
					'mcc'		=> $mcc,
					'merchant_criteria'		=> $merchant_criteria,
					'merchant_status'		=> $merchant_status,
					'activation_peroid'		=> $activation_peroid,
					'datestamp'		=> $datestamp,
					'status'		=> $status
				]);
				$success++;
			}else{
				$false++;
				$fail_clean[] = $row['city'];
			}
		}
			
		return array('status' => true, 'success' => $success, 'false' => $false, 'fail_clean' => $fail_clean);
	}

	public function save_role_model()
	{
		$report = $this->input->post('report');
		$status_clean = $this->input->post('status_clean');
		if($report == 'QRIS'){
			$before_city = $this->input->post('before_city');
			$to_city = $this->input->post('to_city');
			$this->db->insert('t3role_model', [
				'report_code'		=> 'QRIS',
				'table'					=> 'QRIS',
				'field'					=> 'city',
				'from'					=> $before_city,
				'to'						=> $to_city
			]);
			$id = $this->db->insert_id();
			$result = $this->_proc_auto_clean_qris();
			if($status_clean == 'clean') {
				$this->db->delete('t3role_model', ['id' => $id]);
			}
			echo json_encode($result);
		}
		if($report == 'LTKL'){
			$before_sender_country = $this->input->post('before_sender_country');
			$to_sender_country = $this->input->post('to_sender_country');
			$this->db->insert('t3role_model', [
				'report_code'		=> 'LTKL',
				'table'					=> 'ltkl',
				'field'					=> 'sender_country',
				'from'					=> $before_sender_country,
				'to'						=> $to_sender_country
			]);
			$id = $this->db->insert_id();
			$result = $this->_proc_auto_clean_ltkl();
			if($status_clean == 'clean') {
				$this->db->delete('t3role_model', ['id' => $id]);
			}
			echo json_encode($result);
		}
		if($report == 'LTDBB'){
			$before_sender_country = $this->input->post('before_sender_country');
			$to_sender_country = $this->input->post('to_sender_country');

			$before_sender_city = $this->input->post('before_sender_city');
			$to_sender_city = $this->input->post('to_sender_city');

			$before_recept_country = $this->input->post('before_recept_country');
			$to_recept_country = $this->input->post('to_recept_country');

			$before_recept_city = $this->input->post('before_recept_city');
			$to_recept_city = $this->input->post('to_recept_city');
			$id_delete = [];

			// SENDER COUNTRY
			if($before_sender_country){
				foreach ($before_sender_country as $key => $value) {
					if($to_sender_country[$key]){
						$this->db->insert('t3role_model', [
							'report_code'		=> 'LTDBB',
							'table'					=> 'ltdbb',
							'field'					=> 'sender_country',
							'from'					=> $before_sender_country[$key],
							'to'						=> $to_sender_country[$key]
						]);
						$id = $this->db->insert_id();		
						$id_delete[] = $id;
					}
				}	
			}

			// SENDER CITY
			if($before_sender_city){
				foreach ($before_sender_city as $key => $value) {
					if($to_sender_city[$key]){
						$this->db->insert('t3role_model', [
							'report_code'		=> 'LTDBB',
							'table'					=> 'ltdbb',
							'field'					=> 'sender_city',
							'from'					=> $before_sender_city[$key],
							'to'						=> $to_sender_city[$key]
						]);
						$id = $this->db->insert_id();		
						$id_delete[] = $id;
					}
				}	
			}

			// RECEPT COUNTRY
			if($before_recept_country){
				foreach ($before_recept_country as $key => $value) {
					if($to_recept_country[$key]){
						$this->db->insert('t3role_model', [
							'report_code'		=> 'LTDBB',
							'table'					=> 'ltdbb',
							'field'					=> 'recept_country',
							'from'					=> $before_recept_country[$key],
							'to'						=> $to_recept_country[$key]
						]);
						$id = $this->db->insert_id();		
						$id_delete[] = $id;
					}
				}	
			}

			// RECEPT CITY
			if($before_recept_city){
				foreach ($before_recept_city as $key => $value) {
					if($to_recept_city[$key]){
						$this->db->insert('t3role_model', [
							'report_code'		=> 'LTDBB',
							'table'					=> 'ltdbb',
							'field'					=> 'recept_city',
							'from'					=> $before_recept_city[$key],
							'to'						=> $to_recept_city[$key]
						]);
						$id = $this->db->insert_id();		
						$id_delete[] = $id;
					}
				}	
			}



			$result = $this->_proc_auto_clean();
			if($status_clean == 'clean') {
				$this->db->where_in('id', $id_delete);
				$this->db->delete('t3role_model');
			}
			echo json_encode($result);
		}
	}
	// END :: AUTO CLEAN LTKL

	// START :: MANUAL CLEAN
	public function manual()
	{
		$data= [];
		$data['sender_country'] = $this->db->query("SELECT DISTINCT t1clean_ltdbb.sender_country FROM t1clean_ltdbb WHERE status='unverified'")->result_array();
		$data['recept_country'] = $this->db->query("SELECT DISTINCT t1clean_ltdbb.recept_country FROM t1clean_ltdbb WHERE status='unverified'")->result_array();
    $data['content'] = $this->load->view('utilities/manual_clean', $data, TRUE);
		$this->load->view('layout', $data);
	}
	public function ajax_manual_clean()
	{
		if($this->input->post('campaign') != ''){
			$this->db->where('campaign', $this->input->post('campaign'));
		}
		if($this->input->post('daterange') != ''){
			$start_date = date('Y-m-d', strtotime(substr($this->input->post('daterange'),0,10)));
			$end_date =  date('Y-m-d', strtotime(substr($this->input->post('daterange'),13,23)));
			$this->db->where('DATE(datestamp) >=', $start_date);
			$this->db->where('DATE(datestamp) <=', $end_date);
		}
	

		$list = $this->M_tltdbb_clean->get_datatables();
		$data = array();
		$no = $_POST['start'];
		foreach ($list as $raw_data) {
			$no++;
			$row = array();
			$row[] = '<input type="checkbox" class="data-check" value="'.$raw_data->id.'">';
			$row[] = '
				<a href="'.base_url('utilities/edit_manual/').md5($raw_data->id).'"  class="btn btn-primary btn-sm"> <i class="far fa-edit"></i></a>
				<a href="javascript:void(0)" onclick="delete_row('.$raw_data->id.')"  class="btn btn-danger btn-sm"> <i class="fas fa-trash"></i></a>
			';
			$row[] = date('d-m-Y', strtotime($raw_data->trx_date));
			$row[] = $raw_data->sender_country;
			$row[] = $raw_data->sender_city;
			$row[] = $raw_data->recept_country;
			$row[] = $raw_data->recept_city;
			$row[] = $raw_data->sender_name;
			$row[] = $raw_data->recept_city;
			$row[] = $this->lib->rupiah($raw_data->trx_amount);
			$data[] = $row;
		}
		if($this->input->post('daterange') != ''){
			$start_date = date('Y-m-d', strtotime(substr($this->input->post('daterange'),0,10)));
			$end_date =  date('Y-m-d', strtotime(substr($this->input->post('daterange'),13,23)));
			$this->db->where('DATE(datestamp) >=', $start_date);
			$this->db->where('DATE(datestamp) <=', $end_date);
		}
		$recordsTotal = $this->M_tltdbb_clean->count_all();

		if($this->input->post('daterange') != ''){
			$start_date = date('Y-m-d', strtotime(substr($this->input->post('daterange'),0,10)));
			$end_date =  date('Y-m-d', strtotime(substr($this->input->post('daterange'),13,23)));
			$this->db->where('DATE(datestamp) >=', $start_date);
			$this->db->where('DATE(datestamp) <=', $end_date);
		}
		$recordsFiltered = $this->M_tltdbb_clean->count_filtered();
		$output = array(
							"draw" => $_POST['draw'],
							"recordsTotal" => $recordsTotal,
							"recordsFiltered" => $recordsFiltered,
							"data" => $data,
						);
		echo json_encode($output);
	}
	public function edit_manual($id)
	{
		$data= [];
    $data['source'] =	$this->M_tltdbb_clean->get(['md5(id)' => $id])->row();
    $data['content'] = $this->load->view('utilities/edit_manual', $data, TRUE);
		$this->load->view('layout', $data);
	}
	public function udata(){
		$rollback = $this->input->post('rollback');
		$id 						= $this->input->post('id');
		$sender_city 		= $this->input->post('sender_city');
		$sender_country 	= $this->input->post('sender_country');
		$recept_city 		= $this->input->post('recept_city');
		$recept_country = $this->input->post('recept_country');
		$sender_name			= $this->input->post('sender_name');
		$recept_name 		= $this->input->post('recept_name');
		$sender_phone 		= $this->input->post('sender_phone');
		$recept_phone 	= $this->input->post('recept_phone');
		$description 		= $this->input->post('description');
		$status 				= $this->input->post('status');
		if($rollback == 'Y'){
			$this->db->update('t1clean_ltdbb', ['status' => 'rollback'], ['id' => $id]);
			$this->db->where_in('id', $id);
		}else{
			/* $update = "status";
			$data2 = array(
				'status' => $update;
				);	
			$where = array('id' => $id);
			$this->corelib->update($where,$data2,'t0source_ltdbb'); */
			$dataInsert = array(
				'sender_city' 			=> $sender_city,
				'sender_country' 	=> $sender_country,
				'recept_city' 		=> $recept_city,
				'recept_country' 	=> $recept_country,
				'sender_name' 			=> $sender_name,
				'recept_name' 		=> $recept_name,
				'sender_phone' 		=> $sender_phone,
				'recept_phone' 		=> $recept_phone,
				'description' 		=> $description,
				'status' 					=> $status
				);	
			$where = array('id' => $id);
			$this->db->update('t1clean_ltdbb',$dataInsert,$where);
			//die(print_r($dataInsert));
			//$insertdata  = $this->corelib->input_data($dataInsert,'t1clean_ltdbb');
			/* if($insertdata == TRUE) {
				$this->db->query("UPDATE t0source_ltdbb SET status = 'old' WHERE id='".$id."'");
			} */
		}
		$this->session->set_flashdata("msg", "<div class='alert alert-success' role='alert' style='font-size: 10px; margin:15px 0px -15px 0px;'>
		Berhasil mengubah service!
		</div><br/>");
		redirect('utilities/manual');
	}
	function ajax_bulk_delete_manual()
	{
		$list_id = $this->input->post('id');
		foreach ($list_id as $id) {
				$this->M_tltdbb_clean->delete_by_id($id);
		}
		echo json_encode(array("status" => TRUE));
	}
	public function ajax_bulk_rollback()
	{
		$list_id = $this->input->post('id');
		$update_source_data = [];
		$delete_clean_data = [];
		foreach ($list_id as $id) {
			$result = $this->db->query("SELECT * FROM t1clean_ltdbb WHERE id = '".$id."'")->row();
			$update_source_data[] = array(
				'id'				=> $result->id_source,
				'status'		=> 'new'
			);
			$delete_clean_data[] = $id;

		}
		$this->db->update_batch('t0source_ltdbb', $update_source_data, 'id');
		$this->db->where_in('id', $delete_clean_data);
		$this->db->delete('t1clean_ltdbb');
		echo json_encode(['status' => true, 'rollback' => count($update_source_data)]);
	}
	public function ajax_delete_manual_clean()
	{
		$id = $this->input->post('id');
		$this->db->delete('t1clean_ltdbb', ['id' => $id]);
		echo json_encode(['status' => true]);
	}
	// END :: MANUAL CLEAN
}

