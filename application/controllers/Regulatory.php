<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Regulatory extends CI_Controller {

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
	{
		parent::__construct();
    //$this->load->model('M_app');
    if(!$this->session->userdata('logged_in'))
    {
      $data=array();
			$data['msg'] = "Maaf Anda tidak punya akses ke halaman ini !";
			$content = $this->load->view('errors/html/error_sessi', $data, TRUE);
			exit($content);
    }
	}

	public function upload_source()
	{
    $data= [];
    $data['content'] = $this->load->view('regulatory/upload_source', $data, TRUE);
		$this->load->view('layout', $data);
	}

  public function raw_data()
	{
    $data= [];
    $data['content'] = $this->load->view('regulatory/raw_data', $data, TRUE);
		$this->load->view('layout', $data);
	}

  public function data_clean()
	{
    $data= [];
    $data['content'] = $this->load->view('regulatory/data_clean', $data, TRUE);
		$this->load->view('layout', $data);
	}
}
