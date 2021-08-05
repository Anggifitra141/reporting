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
    $this->load->model(['M_campaign', 'M_raw_data', 'M_clean_data']);
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
    $data['sendercountry'] = $this->db->query("SELECT DISTINCT tcleandatasource1.sendercountry FROM tcleandatasource1 WHERE status='unverified'")->result_array();
		$data['receiptcountry'] = $this->db->query("SELECT DISTINCT tcleandatasource1.receiptcountry FROM tcleandatasource1 WHERE status='unverified'")->result_array();
    $data['country'] = $this->db->query("SELECT name FROM tcountrycode")->result();
    $data['content'] = $this->load->view('utilities/role_clean', $data, TRUE);
		$this->load->view('layout', $data);
  }

  public function listscountry($value=''){
		$sender = str_replace("_", " ",$value);
		$data['header']			= $sender ;
		$data['page']  			= 'lists country';
    $data['city_result']       = $this->db->query("SELECT alto FROM tregioncode")->result();
		$data['sendercountry'] 	= $this->db->query("SELECT DISTINCT sendercity, sendercity,sendercountry From tcleandatasource1 WHERE sendercountry='$sender'")->result_array();
		$data['content'] = $this->load->view('utilities/list_country', $data, TRUE);
		$this->load->view('layout', $data);
	}
  function uscity()
	{
		$id = $this->input->post('id');
		$name = $this->input->post('sender');
		$contry = $this->input->post('contry');
		$data['sendercity'] = $name;
		$this->db->trans_start();
		$this->db->where('sendercity', $id);
		$this->db->update('tcleandatasource1', $data);
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
  function sendercountry($value=''){
		$sender = str_replace("_", " ",$value);
		$data['sendercountry'] 	= $this->db->query("SELECT sendercountry FROM tcleandatasource1 WHERE sendercountry = '$sender' LIMIT 1")->result_array();
		$data['country']		= $this->db->query("SELECT name FROM tcountrycode")->result();
		$data['content'] = $this->load->view('utilities/sender_country', $data, TRUE);
		$this->load->view('layout', $data);
	}
  function uscountry()
	{
		$id = $this->input->post('id');
		$name = $this->input->post('name');
		$data['sendercountry'] = $name;
		$this->db->trans_start();
		$this->db->where('sendercountry', $id);
		$this->db->update('tcleandatasource1', $data);
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
		$data['receiptcountry']	= $this->db->query("SELECT DISTINCT receiptcity, receiptcountry From tcleandatasource1 WHERE receiptcountry='$receipt'")->result_array();
    $data['receipt'] = $this->db->query("SELECT alto FROM tregioncode")->result();
		$data['content'] = $this->load->view('utilities/listreceipt', $data, TRUE);
		$this->load->view('layout', $data);
  }
  public function urcity()
	{
		$id = $this->input->post('id');
		$name = $this->input->post('name');
		$contry = $this->input->post('contry');
		$data['receiptcity'] = $name;
		$this->db->trans_start();
		$this->db->where('receiptcity', $id);
		$this->db->update('tcleandatasource1', $data);
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
		$data['receiptcountry'] = $name;
		$this->db->trans_start();
		$this->db->where('receiptcountry', $id);
		$this->db->update('tcleandatasource1', $data);
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
    $data['campaign'] = $this->M_campaign->get()->result();
    $data['content'] = $this->load->view('utilities/auto_clean', $data, TRUE);
		$this->load->view('layout', $data);
  }
	public function ajax_raw_data()
	{
		$campaign = $this->input->post('campaign');
		$status = $this->input->post('status');
		$this->db->where('campaign', $campaign);
		if($status != 'all'){
			$this->db->where('status', $status);
		}else{
			$this->db->where_in('status', array('new', 'rollback'));
		}
    $list = $this->M_raw_data->get_datatables();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
      $row = array();
      $row[] = date('d-m-Y', strtotime($item->trxdate));
      $row[] = strtoupper($item->status);
      $row[] = $item->sendercountry;
      $row[] = $item->sendercity;
			$row[] = $item->receiptcountry;
      $row[] = $item->receiptcity;
      $row[] = $item->sendername;
      $row[] = $item->receiptname;
      $row[] = $this->lib->rupiah($item->nominal);
      $data[] = $row;
    }
		$this->db->where('campaign', $campaign);
		if($status != 'all'){
			$this->db->where('status', $status);
		}else{
			$this->db->where_in('status', array('new', 'rollback'));
		}
    $recordsTotal = $this->M_raw_data->count_all();
		$this->db->where('campaign', $campaign);
		if($status != 'all'){
			$this->db->where('status', $status);
		}else{
			$this->db->where_in('status', array('new', 'rollback'));
		}
    $recordsFiltered = $this->M_raw_data->count_filtered();
    

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
		$campaign  			= $this->input->post('campaign');
		$status  			= $this->input->post('status');
		if($status != 'all'){
			$test = $this->db->query("SELECT * FROM tdatasource1 WHERE campaign = '".$campaign."' AND status = '".$status."' ")->result_array();
		}else{
			$test = $this->db->query("SELECT * FROM tdatasource1 WHERE status IN ('new', 'rollback') AND campaign = '".$campaign."' ")->result_array();
		}
		$datestamp = date("Ymd");
		$success = 0;
		$false = 0;
		
		foreach($test as $SheetDataKey) {
			$id 						= $SheetDataKey['id'];
			$trxdate 				= $SheetDataKey['trxdate'];
			$sendercountry 	= strtolower($SheetDataKey['sendercountry']);
			$sendercity 		= strtolower($SheetDataKey['sendercity']);
			$receiptcountry = strtolower($SheetDataKey['receiptcountry']);
			$receiptcity 		= strtolower($SheetDataKey['receiptcity']);
			$sendername 		= strtoupper($SheetDataKey['sendername']);
			$receiptname 		= strtoupper($SheetDataKey['receiptname']);
			$senderphone 		= $SheetDataKey['senderphone'];
			$receiptphone 	= $SheetDataKey['receiptphone'];
			$senderwn 			= $SheetDataKey['senderwn'];
			$receiptwn 			= $SheetDataKey['receiptwn'];
			$description 		= $SheetDataKey['description'];
			$nominal 				= $SheetDataKey['nominal'];
			
			//Cleanser sendercountry
			if($sendercountry=="indonesia" || $sendercountry=="86" || $sendercountry=="62"){
				$countrySFil							= "ID-Indonesia";
				$sqlcity								= "SELECT * FROM tregioncode WHERE id='$sendercity' OR name='$sendercity'";
				$row_city								= $this->db->query($sqlcity)->row();
				$citySFil								= $row_city->alto;
				if($citySFil==NULL){
					$citySFil							= $sendercity;
				}
			} else {
				$countrySFil 			= $sendercountry;
				$citySFil				= $sendercity;
			}
			
			// Cleanser receiptcountry
			if($receiptcountry=="indonesia" || $sendercountry=="86" || $sendercountry=="62"){
				$countryRFil							= "ID-Indonesia";
				$sqlcity								= "SELECT * FROM tregioncode WHERE id='$receiptcity' OR name='$receiptcity'";
				$row_city								= $this->db->query($sqlcity)->row();
				$cityRFil								= $row_city->alto;
				if($cityRFil==NULL){
					$cityRFil							= $receiptcity;
				}
			} else {
				$countryRFil 			= $receiptcountry;
				$cityRFil				= $receiptcity;
			}
			
			$fetchData = array(
							'id_data_source'	=> $id,
							'campaign'				=> $campaign,
							'trxdate' 				=> $trxdate, 
							'sendercountry' 	=> $countrySFil, 
							'sendercity' 			=> $citySFil,
							'receiptcountry' 	=> $countryRFil,
							'receiptcity' 		=> $cityRFil,
							'sendername' 			=> $sendername,
							'receiptname' 		=> $receiptname,
							'senderphone' 		=> $senderphone,
							'receiptphone' 		=> $receiptphone,
							'senderwn' 				=> $countrySFil,
							'receiptwn' 			=> $countryRFil,
							'description' 		=> $description,
							'nominal' 				=> $nominal,
							'datestamp'				=> $datestamp,
							'status'					=> "unverified"
							);
			
				$insert_layanan = $this->db->insert('tcleandatasource1',$fetchData);
			 	if($insert_layanan==TRUE){
					 if($status = 'all'){
							$update_layanan = $this->db->query("UPDATE tdatasource1 SET status = 'old' WHERE id='".$id."' AND status IN ('new', 'rollback') ");
					 }else{
							$update_layanan = $this->db->query("UPDATE tdatasource1 SET status = 'old' WHERE id='".$id."' AND status='".$status."'");
					 }
					 $success++;
				}else{
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
    $data['campaign'] = $this->M_campaign->get()->result();
		$data['sendercountry'] = $this->db->query("SELECT DISTINCT tcleandatasource1.sendercountry FROM tcleandatasource1 WHERE status='unverified'")->result_array();
		$data['receiptcountry'] = $this->db->query("SELECT DISTINCT tcleandatasource1.receiptcountry FROM tcleandatasource1 WHERE status='unverified'")->result_array();
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
	

		$list = $this->M_clean_data->get_datatables();
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
			$row[] = date('d-m-Y', strtotime($raw_data->trxdate));
			$row[] = $raw_data->campaign;
			$row[] = $raw_data->sendercountry;
			$row[] = $raw_data->sendercity;
			$row[] = $raw_data->receiptcountry;
			$row[] = $raw_data->receiptcity;
			$row[] = $raw_data->sendername;
			$row[] = $raw_data->receiptcity;
			$row[] = $this->lib->rupiah($raw_data->nominal);
			$data[] = $row;
		}
		if($this->input->post('campaign') != ''){
			$this->db->where('campaign', $this->input->post('campaign'));
		}
		if($this->input->post('daterange') != ''){
			$start_date = date('Y-m-d', strtotime(substr($this->input->post('daterange'),0,10)));
			$end_date =  date('Y-m-d', strtotime(substr($this->input->post('daterange'),13,23)));
			$this->db->where('DATE(datestamp) >=', $start_date);
			$this->db->where('DATE(datestamp) <=', $end_date);
		}
		$recordsTotal = $this->M_clean_data->count_all();

		if($this->input->post('campaign') != ''){
			$this->db->where('campaign', $this->input->post('campaign'));
		}
		if($this->input->post('daterange') != ''){
			$start_date = date('Y-m-d', strtotime(substr($this->input->post('daterange'),0,10)));
			$end_date =  date('Y-m-d', strtotime(substr($this->input->post('daterange'),13,23)));
			$this->db->where('DATE(datestamp) >=', $start_date);
			$this->db->where('DATE(datestamp) <=', $end_date);
		}
		$recordsFiltered = $this->M_clean_data->count_filtered();
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
    $data['source'] =	$this->M_clean_data->get(['md5(id)' => $id])->row();
    $data['content'] = $this->load->view('utilities/edit_manual', $data, TRUE);
		$this->load->view('layout', $data);
	}
	public function udata(){
		$rollback = $this->input->post('rollback');
		$id 						= $this->input->post('id');
		$sendercity 		= $this->input->post('sendercity');
		$sendercountry 	= $this->input->post('sendercountry');
		$receiptcity 		= $this->input->post('receiptcity');
		$receiptcountry = $this->input->post('receiptcountry');
		$sendername			= $this->input->post('sendername');
		$receiptname 		= $this->input->post('receiptname');
		$senderphone 		= $this->input->post('senderphone');
		$receiptphone 	= $this->input->post('receiptphone');
		$description 		= $this->input->post('description');
		$status 				= $this->input->post('status');
		if($rollback == 'Y'){
			$this->db->update('tdatasource1', ['status' => 'rollback'], ['id' => $id]);
			$this->db->where_in('id', $id);
			$this->db->delete('tcleandatasource1');
		}else{
			/* $update = "status";
			$data2 = array(
				'status' => $update;
				);	
			$where = array('id' => $id);
			$this->corelib->update($where,$data2,'tdatasource1'); */
			$dataInsert = array(
				'sendercity' 			=> $sendercity,
				'sendercountry' 	=> $sendercountry,
				'receiptcity' 		=> $receiptcity,
				'receiptcountry' 	=> $receiptcountry,
				'sendername' 			=> $sendername,
				'receiptname' 		=> $receiptname,
				'senderphone' 		=> $senderphone,
				'receiptphone' 		=> $receiptphone,
				'description' 		=> $description,
				'status' 					=> $status
				);	
			$where = array('id' => $id);
			$this->db->update('tcleandatasource1',$dataInsert,$where);
			//die(print_r($dataInsert));
			//$insertdata  = $this->corelib->input_data($dataInsert,'tcleandatasource1');
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
				$this->M_clean_data->delete_by_id($id);
		}
		echo json_encode(array("status" => TRUE));
	}
	public function ajax_bulk_rollback()
	{
		$list_id = $this->input->post('id');
		$update_source_data = [];
		$delete_clean_data = [];
		foreach ($list_id as $id) {
			$result = $this->db->query("SELECT * FROM tcleandatasource1 WHERE id = '".$id."'")->row();
			$update_source_data[] = array(
				'id'				=> $result->id_data_source,
				'status'		=> 'rollback'
			);
			$delete_clean_data[] = $id;

		}
		$this->db->update_batch('tdatasource1', $update_source_data, 'id');
		$this->db->where_in('id', $delete_clean_data);
		$this->db->delete('tcleandatasource1');
		echo json_encode(['status' => true, 'rollback' => count($update_source_data)]);
	}
	public function ajax_delete_manual_clean()
	{
		$id = $this->input->post('id');
		$this->db->delete('tcleandatasource1', ['id' => $id]);
		echo json_encode(['status' => true]);
	}
	// END :: MANUAL CLEAN
}