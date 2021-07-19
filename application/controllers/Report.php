<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Report extends CI_Controller {

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
	{
		parent::__construct();
    $this->load->model(['M_report']);
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
    $data['setting'] = $this->db->query("SELECT * FROM treportsettings")->result_array();
    $data['content'] = $this->load->view('report/month', $data, TRUE);
		$this->load->view('layout', $data);
	}
  public function get_report_range()
  {
    $setting_report = $this->input->post('setting_report');
    $start_date = $this->input->post('start_date');
    $end_date = $this->input->post('end_date');
    
  }

  // START :: SETTING REPORT
  public function setting_report()
	{
    $data= [];
    $data['content'] = $this->load->view('report/setting', $data, TRUE);
		$this->load->view('layout', $data);
	}
  public function ajax_setting_report()
  {
    $list = $this->M_report->Get_All();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
				$row[] = '<a href="#" onclick="get_campaign('.$item->id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>
                  <a href="#" onclick="delete_campaign('.$item->id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
				$row[] = $item->code;
        $row[] = $item->name;
        $row[] = $item->period;
        $row[] = $item->regulator;
        $data[] = $row;
    }

    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $this->M_report->count_all(),
                    "recordsFiltered" => $this->M_report->count_filtered(),
                    "data" => $data,
            );
    echo json_encode($output);
  }
  // END :: SETTING REPORT

}
