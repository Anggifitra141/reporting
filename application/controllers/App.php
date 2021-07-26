<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class App extends CI_Controller {

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

	public function index()
	{
    $data= [];
    $sqltoday								  = "SELECT COUNT(*) as reportcount FROM tcalendar WHERE tcal_date = CURRENT_DATE();";
    $row_today								= $this->db->query($sqltoday)->row();
		$data['totaltoday']				= $row_today->reportcount;
		
    $data['campaign']				  = $this->db->query("SELECT COUNT(campaign_id) tot FROM campaign ")->row()->tot;
		$sqlunprocessed						= "SELECT COUNT(*) as reportcount  FROM tcalendar WHERE tcal_date < CURRENT_DATE() and status <>'printed'";
    $row_unprocessed					= $this->db->query($sqlunprocessed)->row();
		$data['totalunprocessed'] = $row_unprocessed->reportcount;
		
		$sqlnext								  = "SELECT COUNT(*) as reportcount FROM tcalendar WHERE tcal_date > CURRENT_DATE() AND MONTH(tcal_date) = MONTH(CURRENT_DATE()) AND status <>'printed'";
    $row_next							    = $this->db->query($sqlnext)->row();
		$data['totalnext']				= $row_next->reportcount;
		
		$sqlmonth								  = "SELECT COUNT(*) as reportcount FROM tcalendar WHERE MONTH(tcal_date) = MONTH(CURRENT_DATE());";
        $row_month						= $this->db->query($sqlmonth)->row();
		$data['totalmonth'] 			= $row_month->reportcount;
		
		$belum = $row_unprocessed->reportcount;
		$bulan = $row_month->reportcount;
		$data['hasil'] = $bulan - $belum;
		
		$data['activity'] = $this->db->query("SELECT username, avatar,actcategory, actlog,datestamp FROM tlogact JOIN user ON tlogact.uid = user.user_id WHERE MONTH(datestamp) = MONTH(CURRENT_DATE()) ORDER BY id DESC LIMIT 5")->result_array();
		
		$data['result'] = $this->db->get("tcalendar")->result();
    foreach ($data['result'] as $key => $value) {
    $data['calender'][$key]['start'] = $value->tcal_date;
		$data['calender'][$key]['end'] = $value->tcal_date;
    $data['calender'][$key]['title'] = $value->tcal_message;
		$data['calender'][$key]['url'] = "report/in/".$value->tcal_date;
		$status = $value->status;
		$today = date("Y-m-d"); 
		if ($status == "unverified"){
        $data['calender'][$key]['backgroundColor'] = "#ff847f";
      }elseif($status == "verified"){
        $data['calender'][$key]['backgroundColor'] = "#7fff84";
      }elseif($status == "printed"){
        $data['calender'][$key]['backgroundColor'] = "#faff7f";	
      }else{
        $data['calender'][$key]['backgroundColor'] = "#7fffc4";	
      }
    }
    $data['content'] = $this->load->view('dashboard/dashboard', $data, TRUE);
		$this->load->view('layout', $data);
	}
}
