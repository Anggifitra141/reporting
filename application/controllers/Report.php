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
    $data['report_type'] = $this->db->query("SELECT * FROM treportsettings")->result_array();
    $data['campaign'] = $this->db->query("SELECT * FROM campaign")->result_array();
    $data['content'] = $this->load->view('report/month', $data, TRUE);
		$this->load->view('layout', $data);
	}

  public function get_report_range()
  {
    $report_type = $this->input->post('report_type');
    $campaign = $this->input->post('campaign');
    $start_date = substr($this->input->post('monthly_date'),0,10);
    $end_date =  substr($this->input->post('monthly_date'),13,23);

    $result = "";
    switch ($report_type) {
      case 'G0001':
        $result = $this->report_g1($start_date, $end_date, $campaign);
        break;
      case 'G0002':
        $result = $this->report_g2($start_date, $end_date, $campaign);
        break;
      case 'G0003':
        $result = $this->report_g3($start_date, $end_date, $campaign);
        break;
      default:
        $result = "";
        break;
    }
    echo json_encode($result);
    
  }
  private function report_g1($start_date, $end_date){
    $query = $this->db->query("
      SELECT A.campaign, A.sendercity, A.receiptcountry, A.receiptname,
      A.sendername, COUNT(A.nominal) as trxvolume, SUM(A.nominal) as trxnominal FROM tcleandatasource1 A 
      WHERE A.sendercountry = 'ID-indonesia' AND not A.receiptcountry='ID-Indonesia' AND DATE(datestamp) BETWEEN '".$start_date."' AND '".$end_date."' AND campaign='$campaign'
      GROUP BY A.sendercity, A.receiptcountry, A.receiptname, A.sendername
    ")->result();
    return $query;
  }
  private function report_g2($start_date, $end_date)
  {
    $query = $this->db->query("
      SELECT A.campaign, A.sendercity, A.receiptcountry, A.receiptname, 
      A.sendername, COUNT(A.nominal) as trxvolume, SUM(A.nominal) as trxnominal FROM tcleandatasource1 A 
      WHERE not A.sendercountry = 'ID-indonesia' AND A.receiptcountry='ID-Indonesia' AND DATE(datestamp) BETWEEN '".$start_date."' AND '".$end_date."' AND campaign='$campaign'
      GROUP BY A.sendercity, A.receiptcountry, A.receiptname, A.sendername
    ")->result();
    return $query;
  }
  private function report_g3($start_date, $end_date)
  {
    $query = $this->db->query("
      SELECT A.campaign, A.sendercity, A.receiptcountry, A.receiptname,
      A.sendername, COUNT(A.nominal) as trxvolume, SUM(A.nominal) as trxnominal 
      FROM tcleandatasource1 A 
      WHERE A.sendercountry='ID-indonesia' AND A.receiptcountry='ID-Indonesia' AND DATE(datestamp) BETWEEN '".$start_date."' AND '".$end_date."' AND campaign='$campaign'
      GROUP BY A.sendercity, A.receiptcountry, A.receiptname, A.sendername
    ")->result();
    return $query;
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
  function in($value='')
    {
		$data['page'] 	 = 'sourceAll';
		$data['sourceAll'] = $this->db->query("SELECT a.tcal_date as date ,a.tcal_message as name , 
		b.regulator as regulator, c.periodname as period, a.status as status, b.status as status_rep , b.link
		FROM tcalendar a INNER JOIN treportsettings b ON a.trepid = b.id INNER JOIN treportperiod c ON b.period = c.periodcode 
		WHERE a.tcal_date = '$value'")->result_array();
		// $this->load->view('dataSmall',$data, FALSE);
    echo json_encode($data);
    }

}
