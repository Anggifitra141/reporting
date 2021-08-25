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
    $this->load->model(['M_raw_data', 'M_tltdbb_source', 'M_tltdbb_clean']);
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
    $data['sender_country'] = $this->db->query("SELECT DISTINCT tltdbb_clean.sender_country FROM tltdbb_clean WHERE status='cleansing'")->result_array();;
		$data['recept_country'] = $this->db->query("SELECT DISTINCT tltdbb_clean.recept_country FROM tltdbb_clean WHERE status='cleansing'")->result_array();
    // $data['country'] = $this->db->query("SELECT name FROM tcountrycode")->result();
    $data['content'] = $this->load->view('utilities/role_clean', $data, TRUE);
		$this->load->view('layout', $data);
  }

  public function listscountry($value=''){
		// $sender = str_replace("_", " ",$value);
		$data['header']			= $value ;
		$data['page']  			= 'lists country';
    // $data['city_result']       = $this->db->query("SELECT alto FROM tregioncode")->result();
		$data['sender_country'] 	= $this->db->query("SELECT DISTINCT sender_city, sender_city,sender_country From tltdbb_clean WHERE sender_country='$value'")->result_array();
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
		$this->db->update('tltdbb_clean', $data);
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
		$data['sender_country'] 	= $this->db->query("SELECT sender_country FROM tltdbb_clean WHERE sender_country = '$sender' LIMIT 1")->result_array();
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
		$this->db->update('tltdbb_clean', $data);
		$this->db->trans_complete();
		$this->session->set_flashdata("msg", "<div class='alert alert-success' role='alert' style='font-size: 10px; margin:15px 0px -15px 0px;'>
		Upadated Done!
		</div><br/><br/>");
		redirect('utilities/manual');
	}

  // START :: RECEIPT COUNTRY
  public function listreceipt($value="")
  {
    $receipt				= str_replace("_", " ",$value);
		$data['header']			= $receipt ;
		$data['page']  			= 'listrcountry';
		$data['recept_country']	= $this->db->query("SELECT DISTINCT recept_city, recept_country From tltdbb_clean WHERE recept_country='$receipt'")->result_array();
    $data['receipt'] = $this->db->query("SELECT alto FROM tregioncode")->result();
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
		$this->db->update('tltdbb_clean', $data);
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
		$this->db->update('tltdbb_clean', $data);
		$this->db->trans_complete();
		$this->session->set_flashdata("msg", "<div class='alert alert-success' role='alert' style='font-size: 10px; margin:15px 0px -15px 0px;'>
		Upadated Done!
		</div><br/><br/>");
		redirect('utilities/manual');
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
	public function proc_auto_clean()
  {
		$data['page'] 	= 'displayClean';
		$status  			= $this->input->post('status');
		$test = $this->db->query("SELECT * FROM tltdbb_source WHERE  status = 'new' ")->result_array();
		$datestamp = date("Ymd");
		$success = 0;
		$false = 0;
		$data_clean = [];
		
		foreach($test as $SheetDataKey) {
			$id 						= $SheetDataKey['id'];
			$sender_country = strtolower($SheetDataKey['sender_country']);
			$sender_city 		= strtolower($SheetDataKey['sender_city']);
			$recept_country = strtolower($SheetDataKey['recept_country']);
			$recept_city 		= strtolower($SheetDataKey['recept_city']);
			$sender_name 		= strtoupper($SheetDataKey['sender_name']);
			$recept_name 		= strtoupper($SheetDataKey['recept_name']);
			$recept_phone		= $SheetDataKey['recept_phone'];
			$description		= $SheetDataKey['description'];
			$trx_amount		= $SheetDataKey['trx_amount'];
			$trx_date		= $SheetDataKey['trx_date'];
			$trx_type		= $SheetDataKey['trx_type'];


			//Cleanser sender_country
			$cek_sender_country = $this->db->query("SELECT `to` as `to` FROM trole_model WHERE `from` = '".$sender_country."' AND `table` = 'tltdbb' AND field = 'sender_country'  ")->row();
			if($cek_sender_country){
				$sender_country = $cek_sender_country->to;
			}
			//Cleanser sender_city
			$cek_sender_city = $this->db->query("SELECT `to` as `to` FROM trole_model WHERE `from` = '".$sender_city."' AND `table` = 'tltdbb' AND field = 'sender_city'  ")->row();
			if($cek_sender_city){
				$sender_city = $cek_sender_city->to;
			}
			//Cleanser recept_country
			$cek_recept_country = $this->db->query("SELECT `to` as `to` FROM trole_model WHERE `from` = '".$recept_country."' AND `table` = 'tltdbb' AND field = 'recept_country'  ")->row();
			if($cek_recept_country){
				$recept_country = $cek_recept_country->to;
			}
			//Cleanser recept_city
			$cek_recept_city = $this->db->query("SELECT `to` as `to` FROM trole_model WHERE `from` = '".$recept_city."' AND `table` = 'tltdbb' AND field = 'recept_city'  ")->row();
			if($cek_recept_city){
				$recept_city = $cek_recept_city->to;
			}
			if($cek_sender_country && $cek_sender_city && $cek_recept_country && $cek_recept_city ){
				$result = $this->db->insert('tltdbb_clean', [
					'source_id'					=> $id,
					'sender_country'		=> $sender_country,
					'sender_city'				=> $sender_city,
					'recept_country'		=> $recept_country,
					'recept_city'				=> $recept_city,
					'sender_name'				=> $sender_name,
					'recept_name'				=> $recept_name,
					'recept_phone'			=> $recept_phone,
					'description'				=> $description,
					'amount'						=> $trx_amount,
					'trx_type'					=> $trx_type,
					'trx_date'					=> $trx_date,
					'datestamp'					=> date('YmdHis'),
					'status'						=> 'cleaned'
				]);
				$this->db->update('tltdbb_source', ['status' => 'old'], ['id' => $id]);
				$success++;
			}else{
				// $this->db->update('tltdbb_source', ['status' => 'failed'], ['id' => $id]);
				$false++;
			}
		}
			
		echo json_encode(['status' => true, 'success' => $success, 'false' => $false]);
	}
	// END :: AUTO CLEAN

	// START :: MANUAL CLEAN
	public function manual()
	{
		$data= [];
		$data['sender_country'] = $this->db->query("SELECT DISTINCT tltdbb_clean.sender_country FROM tltdbb_clean WHERE status='unverified'")->result_array();
		$data['recept_country'] = $this->db->query("SELECT DISTINCT tltdbb_clean.recept_country FROM tltdbb_clean WHERE status='unverified'")->result_array();
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
			$row[] = $this->lib->rupiah($raw_data->amount);
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
			$this->db->update('tltdbb_clean', ['status' => 'rollback'], ['id' => $id]);
			$this->db->where_in('id', $id);
		}else{
			/* $update = "status";
			$data2 = array(
				'status' => $update;
				);	
			$where = array('id' => $id);
			$this->corelib->update($where,$data2,'tdatasource1'); */
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
			$this->db->update('tltdbb_clean',$dataInsert,$where);
			//die(print_r($dataInsert));
			//$insertdata  = $this->corelib->input_data($dataInsert,'tltdbb_clean');
			/* if($insertdata == TRUE) {
				$this->db->query("UPDATE tdatasource1 SET status = 'old' WHERE id='".$id."'");
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
			$result = $this->db->query("SELECT * FROM tltdbb_clean WHERE id = '".$id."'")->row();
			$update_source_data[] = array(
				'id'				=> $result->id_data_source,
				'status'		=> 'rollback'
			);
			$delete_clean_data[] = $id;

		}
		$this->db->update_batch('tdatasource1', $update_source_data, 'id');
		$this->db->where_in('id', $delete_clean_data);
		$this->db->delete('tltdbb_clean');
		echo json_encode(['status' => true, 'rollback' => count($update_source_data)]);
	}
	public function ajax_delete_manual_clean()
	{
		$id = $this->input->post('id');
		$this->db->delete('tltdbb_clean', ['id' => $id]);
		echo json_encode(['status' => true]);
	}
	// END :: MANUAL CLEAN
}