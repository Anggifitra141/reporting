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
    $this->load->model(['M_report', 'M_danafloat_clean', 'M_ltkl_clean']);
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
    $data['country'] = $this->db->get('tltdbb_bi_country')->result();
     $data['city'] = $this->db->get('tltdbb_bi_city')->result();
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
      $row[] = '<input type="checkbox" class="data-check" value="'.$raw_data->id.'">';
			$row[] = '
				<a href="javascript:void(0)" onClick="edit_ltdbb('.$raw_data->id.')"  class="btn btn-primary btn-sm"> <i class="far fa-edit"></i></a>
				<a href="javascript:void(0)" onclick="delete_row('.$raw_data->id.')"  class="btn btn-danger btn-sm"> <i class="fas fa-trash"></i></a>
			';
      if ($type_report == 'G001') {
        $row[] = $raw_data->recept_city;
        $row[] = $raw_data->recept_country;
        $row[] = $raw_data->recept_name;
        $row[] = $raw_data->sender_name;
        $row[] = '1';
        $row[] = $this->lib->rupiah($raw_data->trx_amount);
        $row[] = '3-Non Usaha – Lainnya';
      } else if ($type_report == 'G002') {
        $row[] = $raw_data->sender_country;
        $row[] = $raw_data->recept_city;
        $row[] = $raw_data->recept_name;
        $row[] = $raw_data->sender_name;
        $row[] = '1';
        $row[] = $this->lib->rupiah($raw_data->trx_amount);
      } else if ($type_report == 'G003') {
        $row[] = $raw_data->sender_city;
        $row[] = $raw_data->recept_city;
        $row[] = $raw_data->recept_name;
        $row[] = $raw_data->sender_name;
        $row[] = '1';
        $row[] = $this->lib->rupiah($raw_data->trx_amount);
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

  public function download_excel_ltdbb()
  {


    include APPPATH . 'third_party/PHPExcel/PHPExcel.php';
    // $type_report = $this->input->post('type_report');

    $start_date = date('Ymd', strtotime(substr($_GET['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_GET['daterange'], 13, 23)));
    $type_report = $_GET['type_report'];

    $this->db->where('status', "cleaned");
    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);

    if ($type_report == 'G001') {
      $this->db->where_in('sender_country', array('INDONESIA', '86'));
      $this->db->where_not_in('recept_country', array('INDONESIA', '86'));
    } else if ($type_report == 'G002') {
      $this->db->where_not_in('sender_country', array('INDONESIA', '86'));
      $this->db->where_in('recept_country', array('INDONESIA', '86'));
    } else if ($type_report == 'G003') {
      $this->db->where_in('sender_country', array('INDONESIA', '86'));
      $this->db->where_in('recept_country', array('INDONESIA', '86'));
    }
    $list = $this->db->get('t1clean_ltdbb')->result();


    $report_setting = $this->M_report->get_report_setting($type_report);
    //$recordsFiltered = $this->M_report->count_filtered_ltdbb();

    $data = array();
    $no = 1;
    $baris = 6;
    //$objPHPExcel    = new PHPExcel();

    if ($type_report == 'G001') {
      $objPHPExcel = PHPExcel_IOFactory::load("./assets/template-excel/template-ltdbb-g001.xlsx");
    }else if ($type_report == 'G002'){
      $objPHPExcel = PHPExcel_IOFactory::load("./assets/template-excel/template-ltdbb-g002.xlsx");
    }else{
      $objPHPExcel = PHPExcel_IOFactory::load("./assets/template-excel/template-ltdbb-g003.xlsx");
    }

    foreach ($list as $row) {
        if ($type_report == 'G001') {
          $objPHPExcel->setActiveSheetIndex(0)
          ->setCellValue('A'. $baris, $no)
          ->setCellValue('B'. $baris, $row->recept_city)
          ->setCellValue('C'. $baris, $row->recept_country)
          ->setCellValue('D'. $baris, $row->recept_name)
          ->setCellValue('E'. $baris, $row->sender_name)
          ->setCellValue('F'. $baris, $row->trx_traffic)
          ->setCellValue('G'. $baris, $row->trx_amount)
          ->setCellValue('H'. $baris, "3-Non Usaha – Lainnya");
          $baris++;
          $no++;
        } else if ($type_report == 'G002') {
          $tgl_code = date('Ymd').substr($report_setting->code, 1);
          $format_code = $report_setting->header2.'M'.date('Ymd').$report_setting->code.str_pad(count($list), 9, "0", STR_PAD_LEFT);
          $objPHPExcel->setActiveSheetIndex(0)

          ->setCellValue('C'. 2, $report_setting->header2)
          ->setCellValue('C'. 4, date('Y'))
          ->setCellValue('D'. 4, date('M'))
          ->setCellValue('J'. 3, $report_setting->code)
          ->setCellValue('J'. 4, '')
          ->setCellValue('L'. 3, $tgl_code)
          ->setCellValue('L'. 4, $format_code)

          ->setCellValue('A'. $baris, $no)
          ->setCellValue('B'. $baris, $row->sender_country)
          ->setCellValue('C'. $baris, $row->recept_city)
          ->setCellValue('D'. $baris, $row->recept_name)
          ->setCellValue('E'. $baris, $row->sender_name)
          ->setCellValue('F'. $baris, $row->trx_traffic)
          ->setCellValue('G'. $baris, $row->trx_amount);


          $baris++;
          $no++;

          $baris++;
          $no++;
        } else {
          $tgl_code = date('Ym') . substr($report_setting->code, 1);
          $report_code = $report_setting->header2.'M'.date('Ymd').$report_setting->code.str_pad(count($list), 9, "0", STR_PAD_LEFT);
          $objPHPExcel->setActiveSheetIndex(0)

          ->setCellValue('C'. 2, $report_setting->header2)
          ->setCellValue('C'. 4, date('Y'))
          ->setCellValue('D'. 4, date('m'))
          ->setCellValue('K'. 2, $report_setting->code)
          ->setCellValue('K'. 3, count($list)) //jumlah record
          ->setCellValue('M'. 2,  $tgl_code) // tglcode
          ->setCellValue('M'. 3, $report_code) // reportcode

          ->setCellValue('A'. $baris, $no)
          ->setCellValue('B'. $baris, $row->sender_country)
          ->setCellValue('C'. $baris, $row->recept_city)
          ->setCellValue('D'. $baris, $row->recept_name)
          ->setCellValue('E'. $baris, $row->sender_name)
          ->setCellValue('F'. $baris, $row->trx_traffic)
          ->setCellValue('G'. $baris, $row->trx_amount)
          ->setCellValue('H'. $baris, "3-Non Usaha – Lainnya");
          $baris++;
          $no++;
        }
        $data[] = $row;


    }

    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="Laporan LTDBB ' . $report_setting->code . ' - ' . date('Y-m-d') . '.xlsx"');
    header('Cache-Control: max-age=0');
    $objWriter->save('php://output');

    set_time_limit(0);
    ini_set('memory_limit', '1G');
    
    exit;
  }


  //SIPESAT

  public function sipesat()
  {

    $data = [];
    $data['content'] = $this->load->view('report/sipesat', $data, TRUE);
    $this->load->view('layout', $data);
  }

  public function ajax_list_sipesat()
  {

    $list = $this->M_report->get_datatables_t1clean_sipesat();
    $data = array();
    $no = $_POST['start'];
    foreach ($list as $raw_data) {
      $no++;
      $row = array();
      $row[] = '<input type="checkbox" class="data-check" value="'.$raw_data->id.'">';
			$row[] = '
				<a href="javascript:void(0)" onClick="edit_sipesat('.$raw_data->id.')"  class="btn btn-primary btn-sm"> <i class="far fa-edit"></i></a>
				<a href="javascript:void(0)" onclick="delete_row('.$raw_data->id.')"  class="btn btn-danger btn-sm"> <i class="fas fa-trash"></i></a>
			';
      $row[] = $raw_data->customer_code;
      $row[] = $raw_data->customer_name;
      $row[] = $raw_data->birth_place;
      $row[] = $raw_data->birth_date;
      $row[] = $raw_data->address;
      $row[] = $raw_data->id_card_number;
      $row[] = $raw_data->id_card_number_other;
      $row[] = $raw_data->customer_cif;

      $data[] = $row;
    }
    $output = array(
      "draw" => $_POST['draw'],
      "recordsTotal" => $this->M_report->count_all_t1clean_sipesat(),
      "recordsFiltered" => $this->M_report->count_filtered_t1clean_sipesat(),
      "data" => $data,
    );
    echo json_encode($output);
  }

  public function download_excel_sipesat()
  {
 
 
    include APPPATH . 'third_party/PHPExcel/PHPExcel.php';
    //$type_report = $this->input->post('type_report');
 
    $start_date = date('Ymd', strtotime(substr($_GET['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_GET['daterange'], 13, 23)));
 
    $this->db->where('status', "cleaned");
    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
 
 
    $list = $this->db->get('t1clean_sipesat')->result();
    $type_report = "SIPESAT";
    $report_setting = $this->M_report->get_report_setting($type_report);
 
    $data = array();
    $no = 1;
    $baris = 3;
    //$objPHPExcel    = new PHPExcel();
 
 
    $objPHPExcel = PHPExcel_IOFactory::load("./assets/template-excel/template-sipesat.xlsx");
 
 
    foreach ($list as $row) {
 
      $objPHPExcel->setActiveSheetIndex(0)
        ->setCellValue('A' . $baris, $row->customer_code)
        ->setCellValue('B' . $baris, $row->customer_name)
        ->setCellValue('C' . $baris, $row->birth_place)
        ->setCellValue('D' . $baris, $row->birth_date)
        ->setCellValue('E' . $baris, $row->address)
        ->setCellValue('F' . $baris, $row->id_card_number)
        ->setCellValue('G' . $baris, $row->id_card_number_other)
        ->setCellValue('H' . $baris, $row->customer_cif);
      $baris++;
      $no++;
 
      $data[] = $row;
    }

    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="SIPESAT_41740_TW ' . ceil(date("n") / 3) . date('Y') . '_' . date('dmY') . '_1.xlsx"');
    header('Cache-Control: max-age=0');
    $objWriter->save('php://output');
 
    //set_time_limit(0);
   // ini_set('memory_limit', '1G');
    //
    exit;
  }



  // START :: DANA FLOAT
  public function dana_float()
  {

    $data = [];
    $data['content'] = $this->load->view('report/dana_float', $data, TRUE);
    $this->load->view('layout', $data);
  }

  public function ajax_list_dana_float()
  {
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));

    $this->db->where('status', "cleaned");
    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
    $list = $this->M_danafloat_clean->get_datatables();
    $data = array();
    $no = $_POST['start'];
    foreach ($list as $raw_data) {
      $no++;
      $row = array();
      $row[] = '<input type="checkbox" class="data-check" value="'.$raw_data->id.'">';
			$row[] = '
				<a href="javascript:void(0)" onClick="edit_danafloat('.$raw_data->id.')"  class="btn btn-primary btn-sm"> <i class="far fa-edit"></i></a>
				<a href="javascript:void(0)" onclick="delete_row('.$raw_data->id.')"  class="btn btn-danger btn-sm"> <i class="fas fa-trash"></i></a>
			';
      $row[] = date('d-m-Y', strtotime($raw_data->trx_datetime));
      $row[] = date('H:i:s', strtotime($raw_data->trx_datetime));
      $row[] =  $raw_data->wallet_code;
      $row[] =  $raw_data->trx_type;
      $row[] =  $raw_data->description;
      $row[] =  $raw_data->trx_value;
      $row[] =  $raw_data->trx_code;
      $row[] =  $raw_data->trx_id;
      $row[] =  $raw_data->credit;
      $row[] =  $raw_data->debit;
      $row[] =  $raw_data->syslogno;
      $row[] =  $raw_data->channel_id;
      $row[] =  $raw_data->srac;
      $row[] =  $raw_data->dsac;;

      $data[] = $row;
    }
    $output = array(
      "draw" => $_POST['draw'],
      "recordsTotal" => $this->M_danafloat_clean->count_all(),
      "recordsFiltered" => $this->M_danafloat_clean->count_filtered(),
      "data" => $data,
    );
    echo json_encode($output);
  }

  public function download_excel_dana_float()
  {


    include APPPATH . 'third_party/PHPExcel/PHPExcel.php';
    //$type_report = $this->input->post('type_report');

    $start_date = date('Ymd', strtotime(substr($_GET['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_GET['daterange'], 13, 23)));
    $this->db->where('status', "cleaned");
    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);


    $list = $this->db->get('t1clean_danafloat')->result();

    $type_report = "DANA FLOAT";
    $report_setting = $this->M_report->get_report_setting($type_report);

    $data = array();
    $no = 1;
    $baris = 3;
    //$objPHPExcel    = new PHPExcel();


    $objPHPExcel = PHPExcel_IOFactory::load("./assets/template-excel/template-dana-float.xlsx");


    foreach ($list as $row) {

      $objPHPExcel->setActiveSheetIndex(0)
        ->setCellValue('A' . $baris, date('d-m-Y', strtotime($row->trx_datetime)))
        ->setCellValue('B' . $baris, date('H:i:s', strtotime($row->trx_datetime)))
        ->setCellValue('C' . $baris, $row->wallet_code)
        ->setCellValue('D' . $baris, $row->trx_type)
        ->setCellValue('E' . $baris, $row->description)
        ->setCellValue('F' . $baris, $row->trx_value)
        ->setCellValue('G' . $baris, $row->trx_code)
        ->setCellValue('H' . $baris, $row->trx_id)
        ->setCellValue('I' . $baris, $row->credit)
        ->setCellValue('J' . $baris, $row->debit)
        ->setCellValue('K' . $baris, $row->syslogno)
        ->setCellValue('L' . $baris, $row->channel_id)
        ->setCellValue('M' . $baris, $row->srac)
        ->setCellValue('N' . $baris, $row->dsac);

      $baris++;
      $no++;

      $data[] = $row;
    }
    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="Dana Float' . date('d-m-Y', strtotime($start_date)) . ' S/d ' . date('d-m-Y', strtotime($start_date))  . '.xlsx"');
    header('Cache-Control: max-age=0');
    $objWriter->save('php://output');

    set_time_limit(0);
    ini_set('memory_limit', '1G');
    
    exit;
  }
  // END :: DANA FLOAT

  
  // START :: LTKL
  public function ltkl()
  {

    $data = [];
    $data['content'] = $this->load->view('report/ltkl', $data, TRUE);
    $this->load->view('layout', $data);
  }

  public function ajax_list_ltkl()
  {
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));

    $this->db->where('status', "cleaned");
    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
    $list = $this->M_ltkl_clean->get_datatables();
    $data = array();
    $no = $_POST['start'];
    foreach ($list as $raw_data) {
      $no++;
      $row = array();
      $row[] = '<input type="checkbox" class="data-check" value="'.$raw_data->id.'">';
			$row[] = '
				<a href="javascript:void(0)" onclick="delete_row('.$raw_data->id.')"  class="btn btn-danger btn-sm"> <i class="fas fa-trash"></i></a>
			';
      // <a href="javascript:void(0)" onClick="edit_ltkl('.$raw_data->id.')"  class="btn btn-primary btn-sm"> <i class="far fa-edit"></i></a>
      $row[] = 'Local ID';
      $row[] = $raw_data->sender_name;
      $row[] = $raw_data->sender_country;
      $row[] = '';
      $row[] = '';
      $row[] = '';
      $row[] = 'Person';
      $row[] = $raw_data->recept_name;
      $row[] = $raw_data->destbankacc;
      $row[] = $raw_data->notes;
      $row[] = 'ini dari kode swfit';
      $row[] = 'account';
      $row[] = $raw_data->recept_name;
      $row[] = $raw_data->destamount;
      $row[] = 'TRM';
      $row[] = 'UT';
      $row[] = 'REK';
      $data[] = $row;
    }
    $output = array(
      "draw" => $_POST['draw'],
      "recordsTotal" => $this->M_ltkl_clean->count_all(),
      "recordsFiltered" => $this->M_ltkl_clean->count_filtered(),
      "data" => $data,
    );
    echo json_encode($output);
  }

  public function download_excel_ltkl()
  {


    include APPPATH . 'third_party/PHPExcel/PHPExcel.php';
    //$type_report = $this->input->post('type_report');

    $start_date = date('Ymd', strtotime(substr($_GET['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_GET['daterange'], 13, 23)));
    $this->db->where('status', "cleaned");
    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);


    $list = $this->db->get('t1clean_ltkl')->result();

    $type_report = "DANA FLOAT";
    $report_setting = $this->M_report->get_report_setting($type_report);

    $data = array();
    $no = 1;
    $baris = 2;
    //$objPHPExcel    = new PHPExcel();


    $objPHPExcel = PHPExcel_IOFactory::load("./assets/template-excel/template-ltkl.xlsx");


    foreach ($list as $row) {

      $objPHPExcel->setActiveSheetIndex(0)
        ->setCellValue('A' . $baris, 'Local ID')
        ->setCellValue('B' . $baris, $row->sender_name)
        ->setCellValue('C' . $baris, $row->sender_country)
        ->setCellValue('D' . $baris, '')
        ->setCellValue('E' . $baris, '')
        ->setCellValue('F' . $baris, '')
        ->setCellValue('G' . $baris, 'Person')
        ->setCellValue('H' . $baris, $row->recept_name)
        ->setCellValue('I' . $baris, $row->destbankacc)
        ->setCellValue('J' . $baris, $row->notes)
        ->setCellValue('K' . $baris, 'Ini dari kode swift')
        ->setCellValue('L' . $baris, 'account')
        ->setCellValue('M' . $baris, $row->recept_name)
        ->setCellValue('N' . $baris, $row->destamount)
        ->setCellValue('O' . $baris, 'TRM')
        ->setCellValue('P' . $baris, 'UT')
        ->setCellValue('Q' . $baris, 'REK');

      $baris++;
      $no++;

      $data[] = $row;
    }
    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="Pelaporan LTKL' . date('d-m-Y', strtotime($start_date)) . ' S/d ' . date('d-m-Y', strtotime($start_date))  . '.xlsx"');
    header('Cache-Control: max-age=0');
    $objWriter->save('php://output');

    set_time_limit(0);
    ini_set('memory_limit', '1G');
    
    exit;
  }
  // END :: LTKL

  

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
