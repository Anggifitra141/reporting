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

  public function roles_clean()
  {
    $data['sendercountry'] = $this->db->query("SELECT DISTINCT tcleandatasource1.sendercountry FROM tcleandatasource1 WHERE status='unverified'")->result_array();
		$data['receiptcountry'] = $this->db->query("SELECT DISTINCT tcleandatasource1.receiptcountry FROM tcleandatasource1 WHERE status='unverified'")->result_array();
    $data['country'] = $this->db->query("SELECT name FROM tcountrycode")->result();
    $data['content'] = $this->load->view('roles/index', $data, TRUE);
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
    $data['content'] = $this->load->view('auto_clean/raw_data', $data, TRUE);
		$this->load->view('layout', $data);
  }
	public function ajax_raw_data()
	{
		$campaign_id = $this->input->post('campaign_id');
		$data = $this->M_raw_data->get(['campaign' => $campaign_id, 'status' => 'new'])->result();
		echo json_encode($data);
	}
	public function proc_auto_clean()
  {
		$data['page'] 	= 'displayClean';
		$campaign  			= $this->input->post('campaign');
		$test = $this->db->query("SELECT * FROM tdatasource1 WHERE status = 'new' AND campaign = '".$campaign."' ")->result_array();
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
			 		$update_layanan = $this->db->query("UPDATE tdatasource1 SET status = 'old' WHERE id='".$id."' AND status='new'");
					 $success++;
				}else{
					$false++;
				}
			
			// $data['previewClean'] = $this->db->query("SELECT * FROM tcleandatasource1 WHERE datestamp = '$datestamp'")->result_array();
			// $this->load->view('dataSmall',$data, FALSE);
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
		$list = $this->M_clean_data->get_datatables();
		$data = array();
		$no = $_POST['start'];
		foreach ($list as $raw_data) {
			$no++;
			$row = array();
			$row[] = $no;
			$row[] = '<a href="'.base_url('utilities/edit_manual/').md5($raw_data->id).'">'.$raw_data->trxdate.'</a>';
			$row[] = $raw_data->sendercountry;
			$row[] = $raw_data->sendercity;
			$row[] = $raw_data->receiptcountry;
			$row[] = $raw_data->receiptcity;
			$row[] = $raw_data->sendername;
			$row[] = $raw_data->receiptcity;
			$row[] = $this->lib->rupiah($raw_data->nominal);
			$data[] = $row;
		} 
		$output = array(
							"draw" => $_POST['draw'],
							"recordsTotal" => $this->M_clean_data->count_all(),
							"recordsFiltered" => $this->M_clean_data->count_filtered(),
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
		$this->session->set_flashdata("msg", "<div class='alert alert-success' role='alert' style='font-size: 10px; margin:15px 0px -15px 0px;'>
		Berhasil mengubah service!
		</div><br/>");
		redirect('utilities/manual');
	}
	// END :: MANUAL CLEAN
}