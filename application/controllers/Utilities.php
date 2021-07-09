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
    $this->load->model(['M_campaign']);
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
    $data['content'] = $this->load->view('roles/index', $data, TRUE);
		$this->load->view('layout', $data);
  }

  public function auto_clean()
  {
    $data= [];
    $data['campaign'] = $this->M_campaign->get()->result();
    $data['content'] = $this->load->view('auto_clean/raw_data', $data, TRUE);
		$this->load->view('layout', $data);
  }
}