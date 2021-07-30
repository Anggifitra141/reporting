<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Verify extends CI_Controller {

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
    $data= [];
    $data['campaign'] = $this->M_campaign->get()->result();
    $data['content'] = $this->load->view('verify/verify', $data, TRUE);
		$this->load->view('layout', $data);
  }
  public function ajax_raw_data()
  {
    $this->db->where('campaign', $this->input->post('campaign'));
    $this->db->where('status', 'unverified');
    $list = $this->M_clean_data->get_datatables();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
      $row = array();
      $row[] = date('d-m-Y', strtotime($item->trxdate));
      $row[] = $item->sendercountry;
      $row[] = $item->sendercity;
      $row[] = $item->receiptcountry;
      $row[] = $item->receiptcity;
      $row[] = $item->sendername;
      $row[] = $item->receiptname;
      $row[] = $this->lib->rupiah($item->nominal);
      $data[] = $row;
    }
    $this->db->where('campaign', $this->input->post('campaign'));
    $this->db->where('status', 'unverified');
    $recordsTotal = $this->M_clean_data->count_all();
    $this->db->where('campaign', $this->input->post('campaign'));
    $this->db->where('status', 'unverified');
    $recordsFiltered = $this->M_clean_data->count_filtered();
    

    $output = array(
          "draw" => $_POST['draw'],
          "recordsTotal" => $recordsTotal,
          "recordsFiltered" => $recordsFiltered,
          "data" => $data,
        );
    echo json_encode($output);
  }
	public function proc_verified()
  {
		$data['page'] 	= 'displayClean';
		$campaign  			= $this->input->post('campaign');
    $count = $this->db->query("SELECT COUNT(trxdate) tot FROM tcleandatasource1 WHERE status = 'unverified' AND campaign = '".$campaign."' ")->row()->tot;
		$result = $this->db->update('tcleandatasource1', ['status' => 'verified'], ['campaign' => $campaign, 'status' => 'unverified']);
    echo json_encode(['status' => true, 'result' => $count]);
	}

    
	// END :: AUTO CLEAN
}
