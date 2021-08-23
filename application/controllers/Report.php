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



  public function ltdbb($type = "")
  {
    if ($type == "") {
      $data['msg'] = "Access Forbidden !";
      $content = $this->load->view('errors/html/error_sessi', $data, TRUE);
      exit($content);
    }
    $cek_type_report = $this->_get_header($type);
    $data = [];
    $data['header'] = $cek_type_report;
    $data['content'] = $this->load->view('report/ltdbb', $data, TRUE);
    $this->load->view('layout', $data);
  }

  private function _get_header($type)
  {
    $data = [];
    if ($type == "G001") {
      $data['title']  = 'Manage Report LTDBB G001';
      $data['header'] = ['Kota/Kabupaten Asal Pengiriman', 'Negara Tujuan Pengiriman', 'Nama Penerima', 'Nama Pengirim', 'Volume/frekuensi transaksi', 'Nominal Transaksi', 'Tujuan Transaksi'];
    } else if ($type == "G002") {
      $data['title']  = 'Manage Report LTDBB G002';
      $data['header'] = ['Negara Asal Pengiriman', 'Kota/Kabupaten Tujuan Pengiriman', 'Nama Penerima', 'Nama Pengirim', 'Volume/frekuensi transaksi', 'Nominal Transaksi'];
    } else {
      $data['title']  = 'Manage Report LTDBB G003';
      $data['header'] = ['Kota/Kabupaten Asal Pengiriman', 'Kota/Kabupaten Tujuan Pengiriman', 'Nama Penerima', 'Nama Pengirim', 'Volume/frekuensi transaksi', 'Nominal Transaksi', 'Tujuan Transaksi'];
    }
    return $data;
  }

  public function ajax_list_ltdbb()
  {
    $type_report = $this->input->post('type_report');

    $list = $this->M_report->get_datatables_ltdbb();
    $data = array();
    $no = $_POST['start'];
    foreach ($list as $raw_data) {
      $no++;
      $row = array();
      $row[] = $no;
      if ($type_report == 'G001') {
        $row[] = $raw_data->recept_city;
        $row[] = $raw_data->recept_country;
        $row[] = $raw_data->recept_name;
        $row[] = $raw_data->sender_name;
        $row[] = '1';
        $row[] = $this->lib->rupiah($raw_data->amount);
        $row[] = '3-Non Usaha – Lainnya';
      } else if ($type_report == 'G002') {
        $row[] = $raw_data->sender_country;
        $row[] = $raw_data->recept_city;
        $row[] = $raw_data->recept_name;
        $row[] = $raw_data->sender_name;
        $row[] = '1';
        $row[] = $this->lib->rupiah($raw_data->amount);
      } else if ($type_report == 'G003') {
        $row[] = $raw_data->sender_city;
        $row[] = $raw_data->recept_city;
        $row[] = $raw_data->recept_name;
        $row[] = $raw_data->sender_name;
        $row[] = '1';
        $row[] = $this->lib->rupiah($raw_data->amount);
        $row[] = '3-Non Usaha – Lainnya';
      }

      $data[] = $row;
    }
 
    $recordsTotal = $this->M_report->count_all_ltdbb();
    $recordsFiltered = $this->M_report->count_filtered_ltdbb();
    $output = array(
      "draw" => $_POST['draw'],
      "recordsTotal" => $recordsTotal,
      "recordsFiltered" => $recordsFiltered,
      "data" => $data,
    );
    echo json_encode($output);
  }

  public function get_report()
  {
    $report_type = $this->input->post('report_type');
    $start_date = date('Y-m-d', strtotime(substr($this->input->post('daterange'),0,10)));
    $end_date =  date('Y-m-d', strtotime(substr($this->input->post('daterange'),13,23)));
    // echo json_encode(['start_date' => $report_type, 'end_date' => $end_date]);

    $result = "";
    switch ($report_type) {
      case 'G0001':
        $result = $this->report_g1($start_date, $end_date);
        break;
      case 'G0002':
        $result = $this->report_g2($start_date, $end_date);
        break;
      case 'G0003':
        $result = $this->report_g3($start_date, $end_date);
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
		FROM tcalendar a INNER JOIN treport_settings b ON a.trepid = b.id INNER JOIN treportperiod c ON b.period = c.periodcode 
		WHERE a.tcal_date = '$value'")->result_array();
		// $this->load->view('dataSmall',$data, FALSE);
    echo json_encode($data);
    }

}
