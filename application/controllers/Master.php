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




  // START :: ALL MASTER DATA
  public function page($table_name = "")
  {
    $existing_tabel = $this->db->query("SELECT count(TABLE_NAME) tot FROM information_schema.tables WHERE table_schema = 'reporting' AND table_name = '".$table_name."' LIMIT 1")->row()->tot;
    if($table_name && $existing_tabel > 0 ){
      $data= [];
      $data['content'] = $this->load->view('master/master_all', $data, TRUE);
      $this->load->view('layout', $data);
    }else{
      echo show_404();
    }
    
      
  }

  public function ajax_master_all()
  {
    $table = $this->input->post('table');
    $list = $this->M_master->Get_All_master_all($table);
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
				$row[] = $item->code;
        $row[] = $item->description;
        if($item->status == 'active'){
          $status = '<span class="badge badge-primary">Active</span>';
        }else{
          $status = '<span class="badge badge-danger">No Active</span>';
        }
        $row[] = $status;
        $data[] = $row;
    }

    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $this->M_master->count_all_master_all($table),
                    "recordsFiltered" => $this->M_master->count_filtered_master_all($table),
                    "data" => $data,
            );
    echo json_encode($output);
  }
  // END :: ALL MASTER DATA



}
