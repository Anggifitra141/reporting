<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class App extends CI_Controller {

  /**
   *  =======   Application By    : Anggi Fitrahandika  2019    =======
   *  =======   Version           : V.1.0                       =======
   *  =======   Contact           : anggifitra141@gmail.com     =======
   *  ===========           Copyright 2019          ===================
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

	public function index()
	{
    $data= [];
    $data['content'] = $this->load->view('dashboard/dashboard', $data, TRUE);
		$this->load->view('layout', $data);
	}
}
