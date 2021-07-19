<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Master extends CI_Controller {

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
	{
		parent::__construct();
    $this->load->model('M_master');
		if(!$this->session->userdata('logged_in'))
    {
      $data=array();
			$data['msg'] = "Maaf Anda tidak punya akses ke halaman ini !";
			$content = $this->load->view('errors/html/error_sessi', $data, TRUE);
			exit($content);
    }
	}

	public function region()
	{
    $data= [];
    $data['content'] = $this->load->view('master/region', $data, TRUE);
		$this->load->view('layout', $data);
	}

	public function ajax_list_region()
  {
    $list = $this->M_master->Get_All_region();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
				$row[] = $item->ltdb;
        $row[] = $item->name;
        $row[] = $item->alto;
        $data[] = $row;
    }

    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $this->M_master->count_all_region(),
                    "recordsFiltered" => $this->M_master->count_filtered_region(),
                    "data" => $data,
            );
    echo json_encode($output);
  }

  public function country()
	{
    $data= [];
    $data['content'] = $this->load->view('master/country', $data, TRUE);
		$this->load->view('layout', $data);
	}

	public function ajax_list_country()
  {
    $list = $this->M_master->Get_All_country();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
				$row[] = $item->code;
        $row[] = $item->name;
        $row[] = $item->description;
        $data[] = $row;
    }

    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $this->M_master->count_all_country(),
                    "recordsFiltered" => $this->M_master->count_filtered_country(),
                    "data" => $data,
            );
    echo json_encode($output);
  }



}
