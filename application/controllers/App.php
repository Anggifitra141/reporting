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
    $sqltoday								  = "SELECT COUNT(*) as reportcount FROM t3calendar WHERE datestamp = CURRENT_DATE();";
    $row_today								= $this->db->query($sqltoday)->row();
		$data['totaltoday']				= $row_today->reportcount;
		
		$sqlunprocessed						= "SELECT COUNT(*) as reportcount  FROM t3calendar WHERE datestamp < CURRENT_DATE() and status <>'printed'";
    $row_unprocessed					= $this->db->query($sqlunprocessed)->row();
		$data['totalunprocessed'] = $row_unprocessed->reportcount;
		
		$sqlnext								  = "SELECT COUNT(*) as reportcount FROM t3calendar WHERE datestamp > CURRENT_DATE() AND MONTH(datestamp) = MONTH(CURRENT_DATE()) AND status <>'printed'";
    $row_next							    = $this->db->query($sqlnext)->row();
		$data['totalnext']				= $row_next->reportcount;
		
		$sqlmonth								  = "SELECT COUNT(*) as reportcount FROM t3calendar WHERE MONTH(datestamp) = MONTH(CURRENT_DATE());";
        $row_month						= $this->db->query($sqlmonth)->row();
		$data['totalmonth'] 			= $row_month->reportcount;
		
		$belum = $row_unprocessed->reportcount;
		$bulan = $row_month->reportcount;
		$data['hasil'] = $bulan - $belum;
		
		// $data['activity'] = $this->db->query("SELECT username,actcategory, actlog,datestamp FROM tlogact JOIN user ON tlogact.uid = user.user_id WHERE MONTH(datestamp) = MONTH(CURRENT_DATE()) ORDER BY id DESC LIMIT 5")->result_array();
		
		$data['result'] = $this->db->get("t3calendar")->result();
    foreach ($data['result'] as $key => $value) {
    $data['calender'][$key]['start'] = $value->datestamp;
		$data['calender'][$key]['end'] = $value->datestamp;
    $data['calender'][$key]['title'] = $value->tcal_message;
		$data['calender'][$key]['url'] = "report/in/".$value->datestamp;
		$status = $value->status;
		$today = date("Y-m-d"); 
		if ($status == "unverified"){
        $data['calender'][$key]['backgroundColor'] = "#fc544b";
      }elseif($status == "verified"){
        $data['calender'][$key]['backgroundColor'] = "#63ed7a";
      }elseif($status == "printed"){
        $data['calender'][$key]['backgroundColor'] = "#ffa426";	
      }else{
        $data['calender'][$key]['backgroundColor'] = "#7fffc4";	
      }
    }
    $data['content'] = $this->load->view('dashboard/dashboard', $data, TRUE);
		$this->load->view('layout', $data);
	}


   // START :: REPORT DASHBOARD
	 public function today()
	 {
			$data['title'] 	 = 'sourceAll';
			$data['sourceAll'] = $this->db->query("SELECT a.datestamp as date ,a.tcal_message as name ,
			b.regulator as regulator, c.period_name as period, a.status as status, b.status as status_rep , b.link
			FROM t3calendar a INNER JOIN t3report_settings b ON a.trepid = b.id INNER JOIN t3report_period c ON b.period = c.period_code 
			WHERE a.datestamp = CURRENT_DATE()")->result_array();
			$data['content'] = $this->load->view('dashboard/reminder', $data, TRUE);
			$this->load->view('layout', $data);
	 }
   public function unprocessed()
   {
		$data['title'] 	 = 'Unprocess';
     $data['sourceAll'] = $this->db->query("SELECT a.`datestamp` as date ,a.`tcal_message` as name , 
     b.regulator as regulator, c.period_name as period, a.`status` as status, b.status as status_rep, b.link 
     FROM t3calendar a INNER JOIN t3report_settings b ON a.trepid = b.id INNER JOIN t3report_period c ON b.period = c.period_code 
     WHERE a.datestamp < CURRENT_DATE() and a.status <>'printed';")->result_array();
     $data['content'] = $this->load->view('dashboard/reminder', $data, TRUE);
     $this->load->view('layout', $data);
   }
	public function next()
	{
		$data['title'] 	 = 'Next';
		$data['sourceAll'] = $this->db->query("SELECT a.`datestamp` as date ,a.`tcal_message` as name , 
		b.regulator as regulator, c.period_name as period, a.`status` as status , b.status as status_rep, b.link
		FROM t3calendar a INNER JOIN t3report_settings b ON a.trepid = b.id INNER JOIN t3report_period c ON b.period = c.period_code 
		WHERE a.datestamp > CURRENT_DATE() AND MONTH(a.datestamp) = MONTH(CURRENT_DATE()) AND a.status <>'printed'")->result_array();
		$data['content'] = $this->load->view('dashboard/reminder', $data, TRUE);
		$this->load->view('layout', $data);
	}
	public function month()
	{
		$data['title'] 	 = 'Month';
		$data['sourceAll'] = $this->db->query("SELECT a.`datestamp` as date ,a.`tcal_message` as name ,
		b.regulator as regulator, c.period_name as period, a.`status` as status , b.status as status_rep, b.link
		FROM t3calendar a INNER JOIN t3report_settings b ON a.trepid = b.id INNER JOIN t3report_period c ON b.period = c.period_code
		WHERE MONTH(a.datestamp) = MONTH(CURRENT_DATE())")->result_array();
		$data['content'] = $this->load->view('dashboard/reminder', $data, TRUE);
		$this->load->view('layout', $data);
	}

  function download_today($value)
  {
		$this->load->helper('file');
		//AND a.status = 'verified'
		//die(print_r($value));
		if($value=="cetakg1"){
			$test = $this->db->query("SELECT A.sender_city, A.recept_country, A.recept_name, 
			A.sender_name, COUNT(A.trx_amount) as trxvolume, SUM(A.trx_amount) as trxnominal FROM t1clean_ltdbb A 
			WHERE A.sender_country = 'INDONESIA' AND not A.recept_country='INDONESIA' 
			GROUP BY A.sender_city, A.recept_country, A.recept_name, A.sender_name");
		}elseif($value == "cetakg2"){
			$test = $this->db->query("SELECT A.sender_city, A.recept_country, A.recept_name, 
			A.sender_name, COUNT(A.trx_amount) as trxvolume, SUM(A.trx_amount) as trxnominal FROM t1clean_ltdbb A 
			WHERE not A.sender_country = 'INDONESIA' AND A.recept_country='INDONESIA' 
			GROUP BY A.sender_city, A.recept_country, A.recept_name, A.sender_name");
		}elseif($value == "cetakg3"){
			$test = $this->db->query("SELECT A.sender_city, A.recept_country, A.recept_name,
			A.sender_name, COUNT(A.trx_amount) as trxvolume, SUM(A.trx_amount) as trxnominal 
			FROM t1clean_ltdbb A 
			WHERE A.sender_country='INDONESIA' AND A.recept_country='INDONESIA' 
			GROUP BY A.sender_city, A.recept_country, A.recept_name, A.sender_name");	
		}
		$datestamp = date("Ymd");
		$dateFile = "".$datestamp.".txt";
		$dataContent = array();
		$indeks=0;
		$i = 1;
		
		foreach($test->result() as $dat){	
			$dataContent[$i] = "".str_pad($dat->sender_city, 35)." ".str_pad($dat->recept_country, 20)." ".str_pad($dat->recept_name, 40)." ".str_pad($dat->sender_name, 40)." ".str_pad($dat->trxvolume, 3)." ".str_pad($dat->trxnominal, 10).".\n";
			$indeks++;
			$i++;
		}
		file_put_contents($dateFile,$dataContent);
		header('Content-Type: application/text');
		header('Content-Disposition: attachment; filename="'.$dateFile);
		echo file_get_contents($dateFile);
	}
   // END :: REPORT DASHBOARD

	public function generate_report()
	{
		$query_get_report_setting = $this->db->get('t3report_settings')->result();

		foreach ($query_get_report_setting as $row){
			if($row->period  == '1D'){
				$last_generate = $row->last_generate;		
				$generate = date('Y-m-d', strtotime($last_generate . ' +1 day'));

				$data = array (
					'id_user'     	=> '1',
					'trepid'      	=> $row->id,
					'datestamp'    	=> $generate,
					'tcal_message'	=> $row->code,
					'status'       	=> 'unverified'
				);

				$this->db->insert('t3calendar', $data);
				echo json_encode(array("status" => TRUE));

			}else if($row->period == '1W'){
				$last_generate = $row->last_generate;
				$generate = date('Y-m-d', strtotime($last_generate . ' +7 day'));

				$data = array(
					'id_user'     	=> '1',
					'trepid'      	=> $row->id,
					'datestamp'    	=> $generate,
					'tcal_message'	=> $row->code,
					'status'       	=> 'unverified'
				);
				$this->db->insert('t3calendar', $data);
				echo json_encode(array("status" => TRUE));

			}else if($row->period == '1M'){

				$last_generate = $row->last_generate;
				$generate = date('Y-m-d', strtotime($last_generate . ' +30 day'));

				$data = array(
					'id_user'     	=> '1',
					'trepid'      	=> $row->id,
					'datestamp'    	=> $generate,
					'tcal_message'	=> $row->code,
					'status'       	=> 'unverified'
				);
				$this->db->insert('t3calendar', $data);
				echo json_encode(array("status" => TRUE));

			}else{

			}
		}
	} 
 
}
