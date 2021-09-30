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
    $this->db->where('trx_date >=', $start_date);
    $this->db->where('trx_date <=', $end_date);

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

    user_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LTDBB $type_report", '');
    trx_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LTDBB $type_report");
    exit;
  }

  public function download_txt_ltdbb()
  {


    include APPPATH . 'third_party/PHPExcel/PHPExcel.php';
    // $type_report = $this->input->post('type_report');

    $start_date = date('Ymd', strtotime(substr($_GET['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_GET['daterange'], 13, 23)));
    $type_report = $_GET['type_report'];

    $this->db->where('status', "cleaned");
    $this->db->where('trx_date >=', $start_date);
    $this->db->where('trx_date <=', $end_date);

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
    $header = 1;
    $baris = 2;


    foreach ($list as $row) {
      if ($type_report == 'G001') {
        $tgl_code = date('Ymd') . substr($report_setting->code, 1);
        $datarow[$header] = $report_setting->header2 . 'M' . date('Ymd') . $report_setting->code . str_pad(count($list), 9, "0", STR_PAD_LEFT) . "\n";
        $datarow[$baris] = "" . substr($row->sender_country, 0, 2) . substr($row->recept_city, 0, 4) . str_pad($row->recept_name, 50, " ") . str_pad($row->sender_name, 50, " ") . str_pad($row->trx_freq, 12, '0', STR_PAD_LEFT) . str_pad($row->trx_amount, 15, '0', STR_PAD_LEFT) . "\n";

        $baris++;
      } else if ($type_report == 'G002') {
        $tgl_code = date('Ymd') . substr($report_setting->code, 1);
        $datarow[$header] = $report_setting->header2 . 'M' . date('Ymd') . $report_setting->code . str_pad(count($list), 9, "0", STR_PAD_LEFT) . "\n";
        $datarow[$baris] = "".substr($row->sender_country, 0,2).substr($row->recept_city,0,4).str_pad($row->recept_name, 50, " ").str_pad($row->sender_name, 50, " ").str_pad($row->trx_freq, 12, '0', STR_PAD_LEFT).str_pad($row->trx_amount, 15, '0', STR_PAD_LEFT)."\n";      
        
        $baris++;
      } else {
        $tgl_code = date('Ym') . substr($report_setting->code, 1);
        $datarow[$header] = $report_setting->header2 . 'M' . date('Ymd') . $report_setting->code . str_pad(count($list), 9, "0", STR_PAD_LEFT)."\n";
        $datarow[$baris] = "".substr($row->sender_country, 0, 2).substr($row->recept_city, 0, 4) . str_pad($row->recept_name, 50, " ") . str_pad($row->sender_name, 50, " ") . str_pad($row->trx_freq, 12, '0', STR_PAD_LEFT) . str_pad($row->trx_amount, 15, '0', STR_PAD_LEFT)."\n";
        $baris++;
        
      }
      $data[] = $row;
   
    }
    $filename = "Laporan LTDBB ".$report_setting->code." - ".date('Y-m-d').".txt";
    file_put_contents($filename, $datarow);
    header('Content-Type: application/text');
    header('Content-Disposition: attachment; filename="'.$filename);
    echo file_get_contents($filename);

    user_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LTDBB $type_report", '');
    trx_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LTDBB $type_report");
  
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
    $this->db->where('trx_date >=', $start_date);
    $this->db->where('trx_date <=', $end_date);
 
 
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

    set_time_limit(0);
    ini_set('memory_limit', '1G');

    user_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report SIPESAT", '');
    trx_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report SIPESAT");

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
      $row[] =  $raw_data->dsac;

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

    $list = $this->db->query("
      SELECT *, (Saldo_Awal + Cash_In - Cash_Out) as Saldo_akhir
      From (Select `datestamp`, IFNULL((SELECT (IF(trx_type='SALDOAWAL', `trx_value`, 0) + SUM(`credit`)-SUM(`debit`) )
      FROM `t1clean_danafloat` a3 WHERE a3.`datestamp` < a.`datestamp` ORDER BY a3.`datestamp` DESC LIMIT 1) ,Saldo_Awal) as Saldo_Awal, Cash_In, Cash_Out
      FROM (SELECT `id`,`datestamp` , IF(trx_type='SALDOAWAL', `trx_value`, 0) as Saldo_Awal, SUM(`credit`) as Cash_In, SUM(`debit`) as Cash_Out,(IF(trx_type='SALDOAWAL', `trx_value`, 0) + SUM(`credit`)-SUM(`debit`) ) as Saldo_Akhir
      FROM `t1clean_danafloat` a1 GROUP BY `datestamp`) a) b WHERE datestamp BETWEEN '".$start_date."' AND '".$end_date."'
    ")->result();

    $type_report = "DANA FLOAT";
    $report_setting = $this->M_report->get_report_setting($type_report);

    $data = array();
    
    $baris = 3;
    $num_merge = 1;
    $merge=4;
    $for_cell = 1;
    $i_range=1;
    $i=0;
    // $objPHPExcel    = new PHPExcel();

    $objPHPExcel = PHPExcel_IOFactory::load("./assets/template-excel/template-dana-float-bi.xlsx");
    
    // SET HEADER
    $sheet_range = [];
     
  
    foreach ($list as $row) {
      if($row->Saldo_Awal > 0 ){
        $merge_cell = $this->cellsToMergeByColsRow($num_merge,$merge,1);
        $title_merge = explode(':', $merge_cell)[0];
        
        $objPHPExcel->getActiveSheet(0)->mergeCells($merge_cell)
        ->setCellValue($title_merge, date('d/M/Y', strtotime($row->datestamp)));
        $objPHPExcel->getActiveSheet()->getStyle($merge_cell)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $objPHPExcel->getActiveSheet()
          ->getStyle($merge_cell)
          ->getFill()
          ->setFillType(PHPExcel_Style_Fill::FILL_SOLID)
          ->getStartColor()
          ->setARGB('D9E2F3');
        $objPHPExcel->getActiveSheet()->getStyle($merge_cell)->getFont()->setBold( true );
        for ($i_range; $i_range <= $for_cell  * 4; $i_range++) { 
          $sheet_range[] = PHPExcel_Cell::stringFromColumnIndex($i_range);
        }

        


         for ($i; $i < count($sheet_range); $i++) {    
           $awal = $sheet_range[$i];
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 2, 'Saldo Awal');
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 3, number_format($row->Saldo_Awal,2));
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 4, 0);
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 5, 'Tidak Ada');
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 13, 'Tidak Ada');
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 14, 'Tidak Ada');
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 15, 'Tidak Ada');
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 16, 'Tidak Ada');
          $i++;
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 2, 'Cash In');
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 3, number_format($row->Cash_In,2));
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 4, 0);
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 5, 'Tidak Ada');
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 13, 'Tidak Ada');
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 14, 'Tidak Ada');
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 15, 'Tidak Ada');
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 16, 'Tidak Ada');
          $i++;
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 2, 'Cash Out');
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 3, number_format($row->Cash_Out,2));
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 4, 0);
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 5, 'Tidak Ada');
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 13, 'Tidak Ada');
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 14, 'Tidak Ada');
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 15, 'Tidak Ada');
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 16, 'Tidak Ada');
          $i++;
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 2, 'Saldo Akhir');
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 3, number_format($row->Saldo_akhir,2));
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 4, number_format($row->Cash_Out,2));
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 5, 'Tidak Ada');
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 8, number_format($row->Saldo_akhir + $row->Cash_Out, 2));
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 13, 'Tidak Ada');
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 14, 'Tidak Ada');
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 15, 'Tidak Ada');
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($sheet_range[$i] . 16, 'Tidak Ada');
          $akhir = $sheet_range[$i];
          $range_color =  $awal .'2:'.$akhir . 2;
          // $i++;
          $sheet = PHPExcel_Cell::stringFromColumnIndex($i);
          $objPHPExcel->getActiveSheet()
            ->getStyle($range_color)
            ->getFill()
            ->setFillType(PHPExcel_Style_Fill::FILL_SOLID)
            ->getStartColor()
            ->setARGB('D9E2F3');
          $objPHPExcel->getActiveSheet()->getStyle($range_color)->getFont()->setBold( true );
        }
       
    
        
      
        $for_cell++;
        $num_merge+=4;
        $merge+=4;     
      }
    }
    
    $bordered = "A1:". end($sheet_range) . 16;
    $objPHPExcel->getActiveSheet()
    ->getStyle($bordered)
    ->applyFromArray(
        array(
          'borders' => array(
            'allborders' => array(
                'style' => PHPExcel_Style_Border::BORDER_THIN
            )
        )
        )
    );
    
    
    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="Dana Float' . date('d-m-Y', strtotime($start_date)) . ' S/d ' . date('d-m-Y', strtotime($end_date))  . '.xlsx"');
    header('Cache-Control: max-age=0');
    $objWriter->save('php://output');

    set_time_limit(0);
    ini_set('memory_limit', '1G');

    user_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report Dana Float", '');
    trx_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report Dana Float");

    exit;
  }
  
  function cellsToMergeByColsRow($start = -1, $end = -1, $row = -1){
    $merge = 'A1:A1';
    if($start>=0 && $end>=0 && $row>=0){
        $start = PHPExcel_Cell::stringFromColumnIndex($start);
        $end = PHPExcel_Cell::stringFromColumnIndex($end);
        $merge = "$start{$row}:$end{$row}";
    }
    return $merge;
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
    $this->db->where('trx_date >=', $start_date);
    $this->db->where('trx_date <=', $end_date);
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
    $this->db->where('trx_date >=', $start_date);
    $this->db->where('trx_date <=', $end_date);


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
    header('Content-Disposition: attachment;filename="Laporan LTKL' . date('d-m-Y', strtotime($start_date)) . ' S/d ' . date('d-m-Y', strtotime($end_date))  . '.xlsx"');
    header('Cache-Control: max-age=0');
    $objWriter->save('php://output');

    set_time_limit(0);
    ini_set('memory_limit', '1G');

    user_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LTKL", '');
    trx_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LTKL");

    exit;
  }
  // END :: LTKL

   // START :: LKBPU 302
   public function lkpbu_302()
   {
     $data = [];
     $data['content'] = $this->load->view('report/lkpbu/form_302', $data, TRUE);
     $this->load->view('layout', $data);
   }
 
   public function ajax_list_lkpbu_302()
   {
     $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
     $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));
     
     $jml_kartu = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_card WHERE cust_type_id IN ('10', '11') AND DATE_FORMAT(register_date, '%Y%m%d') <'$end_date' ")->row()->tot;
     $kartu_baru = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_card WHERE cust_type_id IN ('10', '11') AND DATE_FORMAT(register_date, '%Y%m%d') BETWEEN '$start_date' AND '$end_date' ")->row()->tot;
     $kartu_tutup = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_card WHERE status_card = 0 AND cust_type_id IN ('10', '11') AND DATE_FORMAT(register_date, '%Y%m%d') BETWEEN '$start_date' AND '$end_date' ")->row()->tot;
     
     
     $registered = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_card WHERE cust_type_id IN ('11') AND register_date < '20210910' AND DATE_FORMAT(register_date, '%Y%m%d') BETWEEN '$start_date' AND '$end_date' ")->row()->tot;
     $unregis = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_card WHERE cust_type_id IN ('10') AND register_date < '20210910' AND DATE_FORMAT(register_date, '%Y%m%d') BETWEEN '$start_date' AND '$end_date' ")->row()->tot;
     $dana_float = $this->db->query("SELECT SUM(curr_balance) tot FROM t0source_lkpbu_302_danafloat WHERE cust_type_id IN ('10', '11') AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date' ")->row()->tot;
     $server_based = $registered + $unregis;
     $vol_trx_blnj_domestik = $this->db->query("
                          SELECT COUNT(id) tot FROM t1clean_lkpbu_302_trx 
                          WHERE trx_code IN ('MCS_BILL_PMT','WS_TRX_TRANSFER','MCS_AIRTIME_REFILL') 
                          AND wstransfertype IN ('CASHIN','CASHINREMITTANCEBANK','CASH-OUT','DEBET MANUAL','CASHOUT','BIAYAUPGRADE','CASHBACKREMITTANCEBANK','BIAYAREG','REFUND','TRANSFER') 
                          AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'
                        ")->row()->tot;
    $vol_transfer_antar_ue = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_trx WHERE trx_code IN ('WS_TRX_TRANSFER') AND wstransfertype IN ('CASHIN','TRANSFER') AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;
    $vol_inisial = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_vol WHERE init_amount = 0 AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;
    $vol_top_up = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_vol WHERE cust_type_id IN ('10', '11') AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;

    $nilai_trx_blnj_domestik = $this->db->query("
                                              SELECT sum(trx_value) tot FROM t1clean_lkpbu_302_trx 
                                              WHERE trx_code IN ('MCS_BILL_PMT','WS_TRX_TRANSFER','MCS_AIRTIME_REFILL') 
                                              AND wstransfertype IN ('CASHIN','CASHINREMITTANCEBANK','CASH-OUT','DEBET MANUAL','CASHOUT','BIAYAUPGRADE','CASHBACKREMITTANCEBANK','BIAYAREG','REFUND','TRANSFER') 
                                              AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'
                                        ")->row()->tot;
    $nilai_transfer_antar_ue = $this->db->query("SELECT SUM(trx_value) tot FROM t1clean_lkpbu_302_trx WHERE trx_code IN ('WS_TRX_TRANSFER') AND wstransfertype IN ('CASHIN','TRANSFER') AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;
    $nilai_inisial = $this->db->query("SELECT SUM(trx_value) tot FROM t1clean_lkpbu_302_vol WHERE init_amount = 0 AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;
    $nilai_top_up = $this->db->query("SELECT SUM(trx_value) tot FROM t1clean_lkpbu_302_vol WHERE cust_type_id IN ('10', '11') AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;
     $output = array(
       'jml_kartu'    => $jml_kartu,
       'kartu_baru'    => $kartu_baru,
       'kartu_tutup'    => $kartu_tutup,
       'server_based'    => $server_based,
       'registered'    => $registered,
       'unregis'    => $unregis,
       'dana_float'    => $dana_float,

       'vol_trx_blnj_domestik'    => $vol_trx_blnj_domestik,
       'vol_transfer_antar_ue'    => $vol_transfer_antar_ue,
       'vol_inisial'    => $vol_inisial,
       'vol_top_up'    => $vol_top_up,

       'nilai_trx_blnj_domestik'    => $nilai_trx_blnj_domestik,
       'nilai_transfer_antar_ue'    => $nilai_transfer_antar_ue,
       'nilai_inisial'    => $nilai_inisial,
       'nilai_top_up'    => $nilai_top_up,
     );
     echo json_encode($output);
   }
 
   public function download_excel_lkpbu_302()
   {
     include APPPATH . 'third_party/PHPExcel/PHPExcel.php';
     //$type_report = $this->input->post('type_report');
 
     $start_date = date('Ymd', strtotime(substr($_GET['daterange'], 0, 10)));
     $end_date =  date('Ymd', strtotime(substr($_GET['daterange'], 13, 23)));

     $type_report = "302";
     $report_setting = $this->M_report->get_report_setting($type_report);
 
     $data = array();
     $no = 1;
     $baris = 12;
     
     $objPHPExcel = PHPExcel_IOFactory::load("./assets/template-excel/template-lkpbu-302.xlsx");
 
     $date_now = $this->lib->date_indonesia(date('Y-m-d'));
     
     $jml_kartu = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_card WHERE cust_type_id IN ('10', '11') AND DATE_FORMAT(register_date, '%Y%m%d') < '$end_date' ")->row()->tot;
     $kartu_baru = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_card WHERE cust_type_id IN ('10', '11') AND DATE_FORMAT(register_date, '%Y%m%d') BETWEEN '$start_date' AND '$end_date' ")->row()->tot;
     $kartu_tutup = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_card WHERE status_card = 0 AND cust_type_id IN ('10', '11') AND DATE_FORMAT(register_date, '%Y%m%d') BETWEEN '$start_date' AND '$end_date' ")->row()->tot;
     
     $registered = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_card WHERE cust_type_id IN ('11') AND register_date < '20210910' AND DATE_FORMAT(register_date, '%Y%m%d') BETWEEN '$start_date' AND '$end_date' ")->row()->tot;
     $unregis = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_card WHERE cust_type_id IN ('10') AND register_date < '20210910' AND DATE_FORMAT(register_date, '%Y%m%d') BETWEEN '$start_date' AND '$end_date' ")->row()->tot;
     $dana_float = $this->db->query("SELECT SUM(curr_balance) tot FROM t0source_lkpbu_302_danafloat WHERE cust_type_id IN ('10', '11') AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date' ")->row()->tot;
     $server_based = $registered + $unregis;

     $vol_trx_blnj_domestik = $this->db->query("
                          SELECT COUNT(id) tot FROM t1clean_lkpbu_302_trx 
                          WHERE trx_code IN ('MCS_BILL_PMT','WS_TRX_TRANSFER','MCS_AIRTIME_REFILL') 
                          AND wstransfertype IN ('CASHIN','CASHINREMITTANCEBANK','CASH-OUT','DEBET MANUAL','CASHOUT','BIAYAUPGRADE','CASHBACKREMITTANCEBANK','BIAYAREG','REFUND','TRANSFER') 
                          AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'
                        ")->row()->tot;
    $vol_transfer_antar_ue = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_trx WHERE trx_code IN ('WS_TRX_TRANSFER') AND wstransfertype IN ('CASHIN','TRANSFER') AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;
    $vol_inisial = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_vol WHERE init_amount = 0 AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;
    $vol_top_up = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_vol WHERE cust_type_id IN ('10', '11') AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;

    $nilai_trx_blnj_domestik = $this->db->query("
                                              SELECT sum(trx_value) tot FROM t1clean_lkpbu_302_trx 
                                              WHERE trx_code IN ('MCS_BILL_PMT','WS_TRX_TRANSFER','MCS_AIRTIME_REFILL') 
                                              AND wstransfertype IN ('CASHIN','CASHINREMITTANCEBANK','CASH-OUT','DEBET MANUAL','CASHOUT','BIAYAUPGRADE','CASHBACKREMITTANCEBANK','BIAYAREG','REFUND','TRANSFER') 
                                              AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'
                                        ")->row()->tot;
    $nilai_transfer_antar_ue = $this->db->query("SELECT SUM(trx_value) tot FROM t1clean_lkpbu_302_trx WHERE trx_code IN ('WS_TRX_TRANSFER') AND wstransfertype IN ('CASHIN','TRANSFER') AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;
    $nilai_inisial = $this->db->query("SELECT SUM(trx_value) tot FROM t1clean_lkpbu_302_vol WHERE init_amount = 0 AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;
    $nilai_top_up = $this->db->query("SELECT SUM(trx_value) tot FROM t1clean_lkpbu_302_vol WHERE cust_type_id IN ('10', '11') AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;

 
     
 
       
    $objPHPExcel->setActiveSheetIndex(0)
      ->setCellValue('A' . 4, substr($this->lib->date_indonesia(date("-m-")) ,1)) 
      ->setCellValue('D' . 9, date("m"))
      ->setCellValue('A' . 47, "Jakarta, $date_now")
      
      ->setCellValue('G12', $jml_kartu)
      ->setCellValue('G13', $kartu_baru)
      ->setCellValue('G14', $kartu_tutup)
      ->setCellValue('G26', $server_based)
      ->setCellValue('G27', $registered)
      ->setCellValue('G28', $unregis)
      ->setCellValue('G29', $dana_float)
      
      ->setCellValue('G31', $vol_trx_blnj_domestik)
      ->setCellValue('G32', $vol_transfer_antar_ue)
      ->setCellValue('G33', $vol_inisial)
      ->setCellValue('G34', $vol_top_up)
      
      ->setCellValue('G38', $nilai_trx_blnj_domestik)
      ->setCellValue('G39', $nilai_transfer_antar_ue)
      ->setCellValue('G40', $nilai_inisial)
      ->setCellValue('G41', $nilai_top_up);
 
    
 
     $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
     header('Content-Type: application/vnd.ms-excel');
     header('Content-Disposition: attachment;filename="Report LKPBU F302 bulan '.date('M').'.xlsx"');
     header('Cache-Control: max-age=0');
     $objWriter->save('php://output');
 
     set_time_limit(0);
     ini_set('memory_limit', '1G');
 
     user_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LKPBU Form 302", '');
     trx_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LKPBU Form 302");
     exit;
 
     
   }
   // END :: LKBPU 302

    // START :: LKBPU 303
    public function lkpbu_303()
    {
      $data = [];
      $data['content'] = $this->load->view('report/lkpbu/form_303', $data, TRUE);
      $this->load->view('layout', $data);
    }
  
    public function ajax_list_lkpbu_303()
    {
      $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
      $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));
      

      $vol_trx_blnj_domestik = $this->db->query("
                           SELECT COUNT(id) tot FROM t1clean_lkpbu_302_trx 
                           WHERE trx_code IN ('MCS_BILL_PMT','WS_TRX_TRANSFER','MCS_AIRTIME_REFILL') 
                           AND wstransfertype IN ('CASHIN','CASHINREMITTANCEBANK','CASH-OUT','DEBET MANUAL','CASHOUT','BIAYAUPGRADE','CASHBACKREMITTANCEBANK','BIAYAREG','REFUND','TRANSFER') 
                           AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'
                         ")->row()->tot;
     $vol_transfer_antar_ue = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_trx WHERE trx_code IN ('WS_TRX_TRANSFER') AND wstransfertype IN ('CASHIN','TRANSFER') AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;
     $vol_inisial = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_vol WHERE init_amount = 0 AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;
     $vol_top_up = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_vol WHERE cust_type_id IN ('10', '11') AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;
 
     $nilai_trx_blnj_domestik = $this->db->query("
                                               SELECT sum(trx_value) tot FROM t1clean_lkpbu_302_trx 
                                               WHERE trx_code IN ('MCS_BILL_PMT','WS_TRX_TRANSFER','MCS_AIRTIME_REFILL') 
                                               AND wstransfertype IN ('CASHIN','CASHINREMITTANCEBANK','CASH-OUT','DEBET MANUAL','CASHOUT','BIAYAUPGRADE','CASHBACKREMITTANCEBANK','BIAYAREG','REFUND','TRANSFER') 
                                               AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'
                                         ")->row()->tot;
     $nilai_transfer_antar_ue = $this->db->query("SELECT SUM(trx_value) tot FROM t1clean_lkpbu_302_trx WHERE trx_code IN ('WS_TRX_TRANSFER') AND wstransfertype IN ('CASHIN','TRANSFER') AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;
     $nilai_inisial = $this->db->query("SELECT SUM(trx_value) tot FROM t1clean_lkpbu_302_vol WHERE init_amount = 0 AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;
     $nilai_top_up = $this->db->query("SELECT SUM(trx_value) tot FROM t1clean_lkpbu_302_vol WHERE cust_type_id IN ('10', '11') AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;
      $output = array(
        'volume'    => $vol_trx_blnj_domestik + $vol_transfer_antar_ue + $vol_inisial + $vol_top_up,
        'nilai'    => $nilai_trx_blnj_domestik + $nilai_transfer_antar_ue + $nilai_inisial + $nilai_top_up,
      );
      echo json_encode($output);
    }
  
    public function download_excel_lkpbu_303()
    {
      include APPPATH . 'third_party/PHPExcel/PHPExcel.php';
      //$type_report = $this->input->post('type_report');
  
      $start_date = date('Ymd', strtotime(substr($_GET['daterange'], 0, 10)));
      $end_date =  date('Ymd', strtotime(substr($_GET['daterange'], 13, 23)));
 
      $type_report = "303";
      $report_setting = $this->M_report->get_report_setting($type_report);
  
      $data = array();
      $no = 1;
      $baris = 12;
      $date_now = $this->lib->date_indonesia(date('Y-m-d'));
      $objPHPExcel = PHPExcel_IOFactory::load("./assets/template-excel/template-lkpbu-303.xlsx");
      $vol_trx_blnj_domestik = $this->db->query("
                           SELECT COUNT(id) tot FROM t1clean_lkpbu_302_trx 
                           WHERE trx_code IN ('MCS_BILL_PMT','WS_TRX_TRANSFER','MCS_AIRTIME_REFILL') 
                           AND wstransfertype IN ('CASHIN','CASHINREMITTANCEBANK','CASH-OUT','DEBET MANUAL','CASHOUT','BIAYAUPGRADE','CASHBACKREMITTANCEBANK','BIAYAREG','REFUND','TRANSFER') 
                           AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'
                         ")->row()->tot;
     $vol_transfer_antar_ue = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_trx WHERE trx_code IN ('WS_TRX_TRANSFER') AND wstransfertype IN ('CASHIN','TRANSFER') AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;
     $vol_inisial = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_vol WHERE init_amount = 0 AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;
     $vol_top_up = $this->db->query("SELECT COUNT(id) tot FROM t1clean_lkpbu_302_vol WHERE cust_type_id IN ('10', '11') AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;
 
     $nilai_trx_blnj_domestik = $this->db->query("
                                               SELECT sum(trx_value) tot FROM t1clean_lkpbu_302_trx 
                                               WHERE trx_code IN ('MCS_BILL_PMT','WS_TRX_TRANSFER','MCS_AIRTIME_REFILL') 
                                               AND wstransfertype IN ('CASHIN','CASHINREMITTANCEBANK','CASH-OUT','DEBET MANUAL','CASHOUT','BIAYAUPGRADE','CASHBACKREMITTANCEBANK','BIAYAREG','REFUND','TRANSFER') 
                                               AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'
                                         ")->row()->tot;
     $nilai_transfer_antar_ue = $this->db->query("SELECT SUM(trx_value) tot FROM t1clean_lkpbu_302_trx WHERE trx_code IN ('WS_TRX_TRANSFER') AND wstransfertype IN ('CASHIN','TRANSFER') AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;
     $nilai_inisial = $this->db->query("SELECT SUM(trx_value) tot FROM t1clean_lkpbu_302_vol WHERE init_amount = 0 AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;
     $nilai_top_up = $this->db->query("SELECT SUM(trx_value) tot FROM t1clean_lkpbu_302_vol WHERE cust_type_id IN ('10', '11') AND DATE_FORMAT(trx_datetime, '%Y%m%d') BETWEEN '$start_date' AND '$end_date'")->row()->tot;
 
  
      
  
        
     $objPHPExcel->setActiveSheetIndex(0)
       ->setCellValue('A' . 4, substr($this->lib->date_indonesia(date("-m-")) ,1)) 
       ->setCellValue('D' . 8, date("m"))
       ->setCellValue('A' . 47, "Jakarta, $date_now")
       
       ->setCellValue('E12', $vol_trx_blnj_domestik + $vol_transfer_antar_ue + $vol_inisial + $vol_top_up)
       ->setCellValue('F12', $nilai_trx_blnj_domestik + $nilai_transfer_antar_ue + $nilai_inisial + $nilai_top_up);
  
       
     
      
      $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
      header('Content-Type: application/vnd.ms-excel');
      header('Content-Disposition: attachment;filename="Report LKPBU F303 bulan '.date('M').'.xlsx"');
      header('Cache-Control: max-age=0');
      $objWriter->save('php://output');
  
      set_time_limit(0);
      ini_set('memory_limit', '1G');
  
      user_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LKPBU Form 303", '');
      trx_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LKPBU Form 303");
      exit;
  
      
    }
    // END :: LKBPU 303
 

  // START :: LKBPU 304
  public function lkpbu_304()
  {

    $data = [];
    $data['content'] = $this->load->view('report/lkpbu/form_304', $data, TRUE);
    $this->load->view('layout', $data);
  }

  public function ajax_list_lkpbu_304()
  {
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));

    $machine_type = $this->db->query("SELECT CONCAT(CODE, '-', machine) as machine_type, code FROM tlkpbu_304_machine_type")->result();
    
    $data = array();
    $no = $_POST['start'];
    foreach ($machine_type as $raw_data) {
      $sum_query = $this->db->query("SELECT IFNULL(SUM(total_machine), '-') as total_machine, IFNULL(SUM(total_seller), '-') as total_seller FROM t1clean_lkpbu_304 WHERE trx_date BETWEEN '$start_date' AND '$end_date' AND machine_code='$raw_data->code' AND status='cleaned'")->result();
      foreach ($sum_query as $sum) {

      
      $no++;
      $row = array();
      $row[] = $no++;
      $row[] = $raw_data->machine_type;
      $row[] = $sum->total_machine;
      $row[] = $sum->total_seller;

      $data[] = $row;
      }
    }
    $output = array(
      "draw" => $_POST['draw'],
      "data" => $data,
    );
    echo json_encode($output);
  }

  public function download_excel_lkpbu_304()
  {
    


    include APPPATH . 'third_party/PHPExcel/PHPExcel.php';
    //$type_report = $this->input->post('type_report');

    $start_date = date('Ymd', strtotime(substr($_GET['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_GET['daterange'], 13, 23)));

    $machine_type = $this->db->query("SELECT CONCAT(CODE, '-', machine) as machine_type, code FROM tlkpbu_304_machine_type")->result();

    $type_report = "302";
    $report_setting = $this->M_report->get_report_setting($type_report);

    $data = array();
    $no = 1;
    $baris = 12;
    //$objPHPExcel    = new PHPExcel();


    $objPHPExcel = PHPExcel_IOFactory::load("./assets/template-excel/template-lkpbu-304.xlsx");

    $date_now = $this->lib->date_indonesia(date('Y-m-d'));

    foreach ($machine_type as $row) {
      $sum_query = $this->db->query("SELECT IFNULL(SUM(total_machine), '-') as total_machine, IFNULL(SUM(total_seller), '-') as total_seller FROM t1clean_lkpbu_304 WHERE trx_date BETWEEN '$start_date' AND '$end_date' AND machine_code='$row->code' AND status='cleaned'")->result();
      foreach ($sum_query as $sum ) {

      
      $objPHPExcel->setActiveSheetIndex(0)
        ->setCellValue('A' . 4, substr($this->lib->date_indonesia(date("-m-")) ,1)) 
        ->setCellValue('D' . 10, date("m"))
        ->setCellValue('A' . 19, "Jakarta, $date_now")
         
        ->setCellValue('A' . $baris, $row->machine_type)
        ->setCellValue('C' . $baris, $sum->total_machine)
        ->setCellValue('D' . $baris, $sum->total_seller);

      $baris++;
      $no++;

      $data[] = $row;
      }
    }


    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="Report LKPBU F304 bulan '.date('M').'.xlsx"');
    header('Cache-Control: max-age=0');
    $objWriter->save('php://output');

    set_time_limit(0);
    ini_set('memory_limit', '1G');

    user_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LKPBU Form 304", '');
    trx_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LKPBU Form 304");
    exit;

    
  }
  // END :: LKBPU 304

  // START :: LKPBU 306
  public function lkpbu_306()
  {
    $data = [];
    $data['content'] = $this->load->view('report/lkpbu/form_306', $data, TRUE);
    $this->load->view('layout', $data);
  }

  public function ajax_list_lkpbu_306()
  {
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));

    $fraud_type = $this->db->query("SELECT CONCAT(CODE, '-', fraud) as fraud_type, code FROM tlkpbu_306_fraud_type")->result();
    
    $data = array();
    $no = $_POST['start'];
    foreach ($fraud_type as $raw_data) {
      $sum_query = $this->db->query("SELECT 
                                    IF(COUNT(actual_loss_vol) > 0, COUNT(actual_loss_vol) , '-')  AS actual_loss_vol,
                                    IFNULL(SUM(actual_loss_nominal), '-')  AS actual_loss_nominal,
                                    IF(COUNT(potential_loss_vol) > 0, COUNT(potential_loss_vol) , '-')  AS potential_loss_vol,
                                    IFNULL(SUM(potential_loss_nominal), '-') AS potential_loss_nominal
                                    FROM t1clean_lkpbu_306
                                    WHERE trx_date BETWEEN '$start_date' AND '$end_date' AND fraud_code='$raw_data->code' AND status='cleaned'")->result();
      foreach ($sum_query as $sum) {

      
      $no++;
      $row = array();
      $row[] = $no++;
      $row[] = "500-Uang Elektronik";
      $row[] = $raw_data->fraud_type;
      $row[] = $sum->actual_loss_vol;
      $row[] = $sum->actual_loss_nominal;
      $row[] = $sum->potential_loss_vol;
      $row[] = $sum->potential_loss_nominal;

      $data[] = $row;
      }
    }
    $output = array(
      "draw" => $_POST['draw'],
      "data" => $data,
    );
    echo json_encode($output);
  }

  public function download_excel_lkpbu_306()
  {

    include APPPATH . 'third_party/PHPExcel/PHPExcel.php';
    //$type_report = $this->input->post('type_report');

    $start_date = date('Ymd', strtotime(substr($_GET['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_GET['daterange'], 13, 23)));

    $fraud_type = $this->db->query("SELECT CONCAT(CODE, '-', fraud) as fraud_type, code FROM tlkpbu_306_fraud_type")->result();

    $type_report = "306";
    $report_setting = $this->M_report->get_report_setting($type_report);

    $data = array();
    $no = 1;
    $baris = 14;
    //$objPHPExcel    = new PHPExcel();


    $objPHPExcel = PHPExcel_IOFactory::load("./assets/template-excel/template-lkpbu-306.xlsx");

    $date_now = $this->lib->date_indonesia(date('Y-m-d'));

    foreach ($fraud_type as $row) {
      $sum_query = $this->db->query("SELECT 
                                    IF(COUNT(actual_loss_vol) > 0, COUNT(actual_loss_vol) , '-')  AS actual_loss_vol,
                                    IFNULL(SUM(actual_loss_nominal), '-')  AS actual_loss_nominal,
                                    IF(COUNT(potential_loss_vol) > 0, COUNT(potential_loss_vol) , '-')  AS potential_loss_vol,
                                    IFNULL(SUM(potential_loss_nominal), '-') AS potential_loss_nominal
                                    FROM t1clean_lkpbu_306
                                    WHERE trx_date BETWEEN '$start_date' AND '$end_date' AND fraud_code='$row->code' AND status='cleaned'")->result();
      foreach ($sum_query as $sum ) {

      
      $objPHPExcel->setActiveSheetIndex(0)
        ->setCellValue('A' . 7, substr($this->lib->date_indonesia(date("Y-m-d")) , 3)) 
        ->setCellValue('E' . 11, date("m"))
        ->setCellValue('B' . 23, "Jakarta, $date_now")
         
        ->setCellValue('C' . $baris, $row->fraud_type)
        ->setCellValue('E' . $baris, $sum->actual_loss_vol)
        ->setCellValue('G' . $baris, $sum->actual_loss_nominal)
        ->setCellValue('I' . $baris, $sum->potential_loss_vol)
        ->setCellValue('K' . $baris, $sum->potential_loss_nominal);

      $baris++;
      $no++;

      $data[] = $row;
      }
    }


    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="Report LKPBU F306 bulan '.date('M').'.xlsx"');
    header('Cache-Control: max-age=0');
    $objWriter->save('php://output');

    set_time_limit(0);
    ini_set('memory_limit', '1G');

    user_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LKPBU Form 306", '');
    trx_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LKPBU Form 306");
    exit;

    
  }
  // END :: LKBPU 306

  // START :: LKPBU 309
  public function lkpbu_309()
  {
    $data = [];
    $data['content'] = $this->load->view('report/lkpbu/form_309', $data, TRUE);
    $this->load->view('layout', $data);
  }

  public function ajax_list_lkpbu_309()
  {
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));
    $date_type = $this->input->post('date_type');


    $count = $this->db->query("SELECT COUNT(id) AS count FROM t1clean_lkpbu_309_310_311 WHERE code_309='999' AND $date_type BETWEEN '$start_date".'000000'." ' AND '$end_date".'235959'."' AND status='cleaned'")->row();

    echo json_encode($count);
  }

  public function download_excel_lkpbu_309()
  {

    include APPPATH . 'third_party/PHPExcel/PHPExcel.php';
    //$type_report = $this->input->post('type_report');

    $start_date = date('Ymd', strtotime(substr($_GET['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_GET['daterange'], 13, 23)));
    $date_type = $_GET['date_type'];

    $count = $this->db->query("SELECT COUNT(id) AS count FROM t1clean_lkpbu_309_310_311 WHERE code_309='999' AND $date_type BETWEEN '$start_date".'000000'."' AND '$end_date".'235959'."' AND status='cleaned'")->row();

    $type_report = "309";
    $report_setting = $this->M_report->get_report_setting($type_report);

    $quarter =ceil(date("n", strtotime($start_date)) / 3);
    if ($quarter ==  "1"){
      $triwulan = "I";
      $periode  = "1";
    }else if ($quarter == "2"){
      $triwulan = "II";
      $periode  = "4";
    }else if ($quarter == "3"){
      $triwulan = "III";
      $periode  = "7";
    }else{
      $triwulan = "IV";
      $periode  = "10";
    }

    $data = array();
    $no = 1;
    $baris = 14;
    //$objPHPExcel    = new PHPExcel();


    $objPHPExcel = PHPExcel_IOFactory::load("./assets/template-excel/template-lkpbu-309.xlsx");

    $date_now = $this->lib->date_indonesia(date('Y-m-d'));


        $objPHPExcel->setActiveSheetIndex(0)
        ->setCellValue('A' . 4, "Triwulan $triwulan Tahun ".date('Y')."")
        ->setCellValue('E' . 8, $periode)
        ->setCellValue('B' . 19, "Jakarta, $date_now")

        ->setCellValue('J' . 15, $count->count)
        ->setCellValue('K' . 15, $count->count);



    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="Report LKPBU F309 Triwulan ' . $triwulan . '.xlsx"');
    header('Cache-Control: max-age=0');
    $objWriter->save('php://output');

    set_time_limit(0);
    ini_set('memory_limit', '1G');

    user_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LKPBU Form 309", '');
    trx_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LKPBU Form 309");
    exit;
  }
  // END :: LKBPU 309

  // START :: LKPBU 310
  public function lkpbu_310()
  {
    $data = [];
    $data['content'] = $this->load->view('report/lkpbu/form_310', $data, TRUE);
    $this->load->view('layout', $data);
  }

  public function ajax_list_lkpbu_310()
  {
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));
    $date_type = $this->input->post('date_type');


    $count = $this->db->query("SELECT COUNT(id) AS count FROM t1clean_lkpbu_309_310_311 WHERE code_310='201' AND $date_type BETWEEN '$start_date" . '000000' . " ' AND '$end_date" . '235959' . "' AND status='cleaned'")->row();

    echo json_encode($count);
  }

  public function download_excel_lkpbu_310()
  {

    include APPPATH . 'third_party/PHPExcel/PHPExcel.php';
    //$type_report = $this->input->post('type_report');

    $start_date = date('Ymd', strtotime(substr($_GET['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_GET['daterange'], 13, 23)));
    $date_type = $_GET['date_type'];

    $count = $this->db->query("SELECT COUNT(id) AS count FROM t1clean_lkpbu_309_310_311 WHERE code_310='201' AND $date_type BETWEEN '$start_date" . '000000' . "' AND '$end_date" . '235959' . "' AND status='cleaned'")->row();

    $type_report = "310";
    $report_setting = $this->M_report->get_report_setting($type_report);

    $quarter = ceil(date("n", strtotime($start_date)) / 3);
    if ($quarter ==  "1") {
      $triwulan = "I";
      $periode  = "1";
    } else if ($quarter == "2") {
      $triwulan = "II";
      $periode  = "4";
    } else if ($quarter == "3") {
      $triwulan = "III";
      $periode  = "7";
    } else {
      $triwulan = "IV";
      $periode  = "10";
    }

    $data = array();
    $no = 1;
    $baris = 14;
    //$objPHPExcel    = new PHPExcel();


    $objPHPExcel = PHPExcel_IOFactory::load("./assets/template-excel/template-lkpbu-310.xlsx");

    $date_now = $this->lib->date_indonesia(date('Y-m-d'));


    $objPHPExcel->setActiveSheetIndex(0)
      ->setCellValue('A' . 4, "Triwulan $triwulan Tahun " . date('Y') . "")
      ->setCellValue('E' . 8, $periode)
      ->setCellValue('B' . 21, "Jakarta, $date_now")

      ->setCellValue('K' . 14, $count->count);



    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="Report LKPBU F310 Triwulan ' . $triwulan . '.xlsx"');
    header('Cache-Control: max-age=0');
    $objWriter->save('php://output');

    set_time_limit(0);
    ini_set('memory_limit', '1G');

    user_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LKPBU Form 310", '');
    trx_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LKPBU Form 310");
    exit;
  }
  // END :: LKBPU 310

  // START :: LKPBU 311
  public function lkpbu_311()
  {
    $data = [];
    $data['content'] = $this->load->view('report/lkpbu/form_311', $data, TRUE);
    $this->load->view('layout', $data);
  }

  public function ajax_list_lkpbu_311()
  {
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));
    $date_type = $this->input->post('date_type');


    $count = $this->db->query("SELECT COUNT(id) AS count FROM t1clean_lkpbu_309_310_311 WHERE code_311='999' AND $date_type BETWEEN '$start_date" . '000000' . " ' AND '$end_date" . '235959' . "' AND status='cleaned'")->row();

    echo json_encode($count);
  }

  public function download_excel_lkpbu_311()
  {

    include APPPATH . 'third_party/PHPExcel/PHPExcel.php';
    //$type_report = $this->input->post('type_report');

    $start_date = date('Ymd', strtotime(substr($_GET['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_GET['daterange'], 13, 23)));
    $date_type = $_GET['date_type'];

    $count = $this->db->query("SELECT COUNT(id) AS count FROM t1clean_lkpbu_309_310_311 WHERE code_311='999' AND $date_type BETWEEN '$start_date" . '000000' . "' AND '$end_date" . '235959' . "' AND status='cleaned'")->row();

    $type_report = "311";
    $report_setting = $this->M_report->get_report_setting($type_report);

    $quarter = ceil(date("n", strtotime($start_date)) / 3);
    if ($quarter ==  "1") {
      $triwulan = "I";
      $periode  = "1";
    } else if ($quarter == "2") {
      $triwulan = "II";
      $periode  = "4";
    } else if ($quarter == "3") {
      $triwulan = "III";
      $periode  = "7";
    } else {
      $triwulan = "IV";
      $periode  = "10";
    }

    $data = array();
    $no = 1;
    $baris = 14;
    //$objPHPExcel    = new PHPExcel();
 

    $objPHPExcel = PHPExcel_IOFactory::load("./assets/template-excel/template-lkpbu-311.xlsx");

    $date_now = $this->lib->date_indonesia(date('Y-m-d'));


    $objPHPExcel->setActiveSheetIndex(0)
      ->setCellValue('A' . 4, "Triwulan $triwulan Tahun " . date('Y') . "")
      ->setCellValue('E' . 8, $periode)
      ->setCellValue('B' . 22, "Jakarta, $date_now")

      ->setCellValue('K' . 18, $count->count);



    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="Report LKPBU F311 Triwulan ' . $triwulan . '.xlsx"');
    header('Cache-Control: max-age=0');
    $objWriter->save('php://output');

    set_time_limit(0);
    ini_set('memory_limit', '1G');

    user_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LKPBU Form 311", '');
    trx_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LKPBU Form 311");
    exit;
  }
  // END :: LKBPU 310

  // START :: LKBPU 312
  public function lkpbu_312()
  {

    $data = [];
    $data['content'] = $this->load->view('report/lkpbu/form_312', $data, TRUE);
    $this->load->view('layout', $data);
  }

  public function ajax_list_lkpbu_312()
  {
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));

    $publication = $this->db->query("SELECT CONCAT(CODE, '-', publication) as publication, code FROM tlkpbu_312_publication_type")->result();
    
    $data = array();
    $no = $_POST['start'];

    $quarter = ceil(date("n", strtotime($start_date)) / 3);
    if ($quarter ==  "1") {
      $triwulan = "I";
      $periode  = "1";
    } else if ($quarter == "2") {
      $triwulan = "II";
      $periode  = "4";
    } else if ($quarter == "3") {
      $triwulan = "III";
      $periode  = "7";
    } else {
      $triwulan = "IV";
      $periode  = "10";
    }

    foreach ($publication as $raw_data) {
      $count_query = $this->db->query("SELECT IF(COUNT(publication_code) > 0, COUNT(publication_code) , '-')  AS total FROM t1clean_lkpbu_312 
                                    WHERE trx_date BETWEEN '$start_date'AND '$end_date' AND publication_code='$raw_data->code' AND status='cleaned'")->result();

      foreach ($count_query as $raw_data2) {


        $no++;
        $row = array();
        $row[] = $no++;
        $row[] = $raw_data->publication;
        $row[] = "";
        $row[] = $raw_data2->total;

        $data[] = $row;
      }
    }
    $output = array(
      "draw" => $_POST['draw'],
      "data" => $data,
    );
    echo json_encode($output);
  }

  public function download_excel_lkpbu_312()
  {



    include APPPATH . 'third_party/PHPExcel/PHPExcel.php';
    //$type_report = $this->input->post('type_report');

    $start_date = date('Ymd', strtotime(substr($_GET['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_GET['daterange'], 13, 23)));

    $publication = $this->db->query("SELECT CONCAT(CODE, '-', publication) as publication, code FROM tlkpbu_312_publication_type")->result();

    $type_report = "312";
    $report_setting = $this->M_report->get_report_setting($type_report);

    $data = array();
    $no = 1;
    $baris = 10;
    //$objPHPExcel    = new PHPExcel();
    

    $objPHPExcel = PHPExcel_IOFactory::load("./assets/template-excel/template-lkpbu-312.xlsx");

    $quarter = ceil(date("n", strtotime($start_date)) / 3);
    if ($quarter ==  "1") {
      $triwulan = "I";
      $periode  = "1";
    } else if ($quarter == "2") {
      $triwulan = "II";
      $periode  = "4";
    } else if ($quarter == "3") {
      $triwulan = "III";
      $periode  = "7";
    } else {
      $triwulan = "IV";
      $periode  = "10";
    }

    $date_now = $this->lib->date_indonesia(date('Y-m-d'));

    foreach ($publication as $raw_data) {
      $count_query = $this->db->query("SELECT IF(COUNT(publication_code) > 0, COUNT(publication_code) , '-')  AS total FROM t1clean_lkpbu_312 
                                    WHERE trx_date BETWEEN '$start_date'AND '$end_date' AND publication_code='$raw_data->code' AND status='cleaned'")->result();
      foreach ($count_query as $raw_data2) {


        $objPHPExcel->setActiveSheetIndex(0)
          ->setCellValue('A' . 4, "Triwulan $triwulan Tahun ".date('Y')."")
          ->setCellValue('E' . 8, $periode)
          ->setCellValue('B' . 18, "Jakarta, $date_now")

          ->setCellValue('B' . $baris, $raw_data->publication)
          ->setCellValue('C' . $baris, "")
          ->setCellValue('K' . $baris, $raw_data2->total);

        $baris++;
        $no++;

        $data[] = $raw_data;
      }
    }


    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="Report LKPBU F312 Triwulan '.$triwulan.'.xlsx"');
    header('Cache-Control: max-age=0');
    $objWriter->save('php://output');

    set_time_limit(0);
    ini_set('memory_limit', '1G');

    user_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LKPBU Form 312", '');
    trx_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LKPBU Form 312");
    exit;
  }
  // END :: LKBPU 312

  // START :: LKBPU 313
  public function lkpbu_313()
  {

    $data = [];
    $data['content'] = $this->load->view('report/lkpbu/form_313', $data, TRUE);
    $this->load->view('layout', $data);
  }

  public function ajax_list_lkpbu_313()
  {
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));

    $publication = $this->db->query("SELECT CONCAT(CODE, '-', publication) as publication, code FROM tlkpbu_313_publication_type")->result();

    $data = array();
    $no = $_POST['start'];

    $quarter = ceil(date("n", strtotime($start_date)) / 3);
    if ($quarter ==  "1") {
      $triwulan = "I";
      $periode  = "1";
    } else if ($quarter == "2") {
      $triwulan = "II";
      $periode  = "4";
    } else if ($quarter == "3") {
      $triwulan = "III";
      $periode  = "7";
    } else {
      $triwulan = "IV";
      $periode  = "10";
    }

    foreach ($publication as $raw_data) {
      $count_query = $this->db->query("SELECT IF(COUNT(publication_code) > 0, COUNT(publication_code) , '-')  AS total FROM t1clean_lkpbu_313 
                                    WHERE trx_date BETWEEN '$start_date'AND '$end_date' AND publication_code='$raw_data->code' AND status='cleaned'")->result();

      foreach ($count_query as $raw_data2) {


        $no++;
        $row = array();
        $row[] = $no++;
        $row[] = $raw_data->publication;
        $row[] = "";
        $row[] = $raw_data2->total;

        $data[] = $row;
      }
    }
    $output = array(
      "draw" => $_POST['draw'],
      "data" => $data,
    );
    echo json_encode($output);
  }

  public function download_excel_lkpbu_313()
  {



    include APPPATH . 'third_party/PHPExcel/PHPExcel.php';
    //$type_report = $this->input->post('type_report');

    $start_date = date('Ymd', strtotime(substr($_GET['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_GET['daterange'], 13, 23)));

    $publication = $this->db->query("SELECT CONCAT(CODE, '-', publication) as publication, code FROM tlkpbu_313_publication_type")->result();

    $type_report = "313";
    $report_setting = $this->M_report->get_report_setting($type_report);

    $data = array();
    $no = 1;
    $baris = 10;
    //$objPHPExcel    = new PHPExcel();


    $objPHPExcel = PHPExcel_IOFactory::load("./assets/template-excel/template-lkpbu-313.xlsx");

    $quarter = ceil(date("n", strtotime($start_date)) / 3);
    if ($quarter ==  "1") {
      $triwulan = "I";
      $periode  = "1";
    } else if ($quarter == "2") {
      $triwulan = "II";
      $periode  = "4";
    } else if ($quarter == "3") {
      $triwulan = "III";
      $periode  = "7";
    } else {
      $triwulan = "IV";
      $periode  = "10";
    }

    $date_now = $this->lib->date_indonesia(date('Y-m-d'));

    foreach ($publication as $raw_data) {
      $count_query = $this->db->query("SELECT IF(COUNT(publication_code) > 0, COUNT(publication_code) , '-')  AS total FROM t1clean_lkpbu_313 
                                    WHERE trx_date BETWEEN '$start_date'AND '$end_date' AND publication_code='$raw_data->code' AND status='cleaned'")->result();
      foreach ($count_query as $raw_data2) {


        $objPHPExcel->setActiveSheetIndex(0)
          ->setCellValue('A' . 4, "Triwulan $triwulan Tahun " . date('Y') . "")
          ->setCellValue('E' . 8, $periode)
          ->setCellValue('B' . 18, "Jakarta, $date_now")

          ->setCellValue('B' . $baris, $raw_data->publication)
          ->setCellValue('C' . $baris, "")
          ->setCellValue('K' . $baris, $raw_data2->total);

        $baris++;
        $no++;

        $data[] = $raw_data;
      }
    }


    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="Report LKPBU F313 Triwulan ' . $triwulan . '.xlsx"');
    header('Cache-Control: max-age=0');
    $objWriter->save('php://output');

    set_time_limit(0);
    ini_set('memory_limit', '1G');

    user_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LKPBU Form 313", '');
    trx_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report LKPBU Form 313");
    exit;
  }
  // END :: LKBPU 312

  // START :: QRIS
  public function qris()
  {

    $data = [];
    $data['mcc'] = $this->db->get('tqris_mcc')->result();
      $data['merchant_criteria'] = $this->db->get('tqris_merchant_criteria')->result();
    $data['content'] = $this->load->view('report/qris', $data, TRUE);
    $this->load->view('layout', $data);
  }
  public function download_excel_qris()
  {
    include APPPATH . 'third_party/PHPExcel/PHPExcel.php';
    //$type_report = $this->input->post('type_report');

    $start_date = date('Ymd', strtotime(substr($_GET['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_GET['daterange'], 13, 23)));

    $city = $this->db->query("SELECT DISTINCT city FROM t1clean_qris_merchant")->result();

    $type_report = "306";
    $report_setting = $this->M_report->get_report_setting($type_report);

    
    //$objPHPExcel    = new PHPExcel();


    $objPHPExcel = PHPExcel_IOFactory::load("./assets/template-excel/template-qris.xlsx");

    $date_now = $this->lib->date_indonesia(date('Y-m-d'));
    $document_excel = $objPHPExcel->getActiveSheet()->toArray(null, true, true, true);
    $line_value = 8;
    for ($i=8; $i <= 556; $i++) {
      // MERCHANT
      $merchant = $this->db->query("
        SELECT
          SUM(if(merchant_status = 'Not Active', 1, 0)) AS merchant_not_active,
          COUNT(id) AS total_merchant,
          SUM(if(merchant_criteria = 'UMI', 1, 0)) AS merchant_usaha_mikro,
          SUM(if(merchant_criteria = 'UKE', 1, 0)) AS merchant_usaha_kecil,
          SUM(if(merchant_criteria = 'UME', 1, 0)) AS merchant_usaha_menengah,
          SUM(if(merchant_criteria = 'UBE', 1, 0)) AS merchant_usaha_besar
        FROM t1clean_qris_merchant WHERE city = '".$document_excel[$i]['C']."'
      ")->row();
      $category_merchant = $this->db->query("
        SELECT 
        (
          SELECT COUNT(id)  FROM t1clean_qris_merchant WHERE mcc IN (SELECT mcc FROM tqris_mcc WHERE category = 'Regular') AND city = '".$document_excel[$i]['C']."'
        ) AS regular,
        (
          SELECT COUNT(id)  FROM t1clean_qris_merchant WHERE mcc IN (SELECT mcc FROM tqris_mcc WHERE category = 'Pendidikan') AND city = '".$document_excel[$i]['C']."'
        ) AS pendidikan,
        (
          SELECT COUNT(id)  FROM t1clean_qris_merchant WHERE mcc IN (SELECT mcc FROM tqris_mcc WHERE category = 'SPBU') AND city = '".$document_excel[$i]['C']."'
        ) AS spbu,
        (
          SELECT COUNT(id)  FROM t1clean_qris_merchant WHERE mcc IN (SELECT mcc FROM tqris_mcc WHERE category = 'G2P') AND city = '".$document_excel[$i]['C']."'
        ) AS g2p,
        (
          SELECT COUNT(id)  FROM t1clean_qris_merchant WHERE mcc IN (SELECT mcc FROM tqris_mcc WHERE category = 'P2G Nasional & Daerah') AND city = '".$document_excel[$i]['C']."'
        ) AS p2g,
        (
          SELECT COUNT(id)  FROM t1clean_qris_merchant WHERE mcc IN (SELECT mcc FROM tqris_mcc WHERE category = 'Donasi Sosial') AND city = '".$document_excel[$i]['C']."'
        ) AS donasi_sosial,
        (
          SELECT COUNT(id)  FROM t1clean_qris_merchant WHERE t1clean_qris_merchant.activation_peroid > '".$end_date."' AND city = '".$document_excel[$i]['C']."'
        ) AS merchant_baru
      ")->row();


      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('D'.$i, $merchant->merchant_not_active > 0 ? $merchant->merchant_not_active : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('E'.$i, $merchant->total_merchant > 0 ? $merchant->total_merchant : '0');
      // MERCHANT BARU
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('F'.$i, $category_merchant->merchant_baru > 0 ? $category_merchant->merchant_baru : '0');
      // MERCHANT TUTUP
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('G'.$i, '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('H'.$i, $merchant->merchant_usaha_mikro > 0 ? $merchant->merchant_usaha_mikro : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('I'.$i, $merchant->merchant_usaha_kecil > 0 ? $merchant->merchant_usaha_kecil : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('J'.$i, $merchant->merchant_usaha_menengah > 0 ? $merchant->merchant_usaha_menengah : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('K'.$i, $merchant->merchant_usaha_besar > 0 ? $merchant->merchant_usaha_besar : '0');
      // MERCHANT KATEGORI
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('L'.$i, $category_merchant->regular > 0 ? $category_merchant->regular : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('M'.$i, $category_merchant->pendidikan > 0 ? $category_merchant->pendidikan : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('N'.$i, $category_merchant->spbu > 0 ? $category_merchant->spbu : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('O'.$i, $category_merchant->g2p > 0 ? $category_merchant->g2p : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('P'.$i, $category_merchant->p2g > 0 ? $category_merchant->p2g : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('Q'.$i, $category_merchant->donasi_sosial > 0 ? $category_merchant->donasi_sosial : '0');

      // TRANSAKSI 
      $trx = $this->db->query("
        SELECT
          SUM(if(pjsp = 'ISSUER_ONUS', vol_trx, 0)) AS vol_issuer_onus,
          SUM(if(pjsp = 'ISSUER_ONUS', amount_trx, 0)) AS sum_issuer_onus,
          SUM(if(pjsp = 'ISSUER OFFUS', vol_trx, 0)) AS vol_issuer_offus,
          SUM(if(pjsp = 'ISSUER OFFUS', amount_trx, 0)) AS sum_issuer_offus,
          SUM(if(pjsp = 'ACQUIRER_OFFUS', vol_trx, 0)) AS vol_acquirer_offus,
          SUM(if(pjsp = 'ACQUIRER_OFFUS', amount_trx, 0)) AS sum_acquirer_offus,
          SUM(if(merchant_criteria = 'UMI', vol_trx, 0)) AS vol_usaha_mikro,
          SUM(if(merchant_criteria = 'UMI', amount_trx, 0)) AS sum_usaha_mikro,
          SUM(if(merchant_criteria = 'UKE', vol_trx, 0)) AS vol_usaha_kecil,
          SUM(if(merchant_criteria = 'UKE', amount_trx, 0)) AS sum_usaha_kecil,
          SUM(if(merchant_criteria = 'UME', vol_trx, 0)) AS vol_usaha_menengah,
          SUM(if(merchant_criteria = 'UME', amount_trx, 0)) AS sum_usaha_menengah,
          SUM(if(merchant_criteria = 'UBE', vol_trx, 0)) AS vol_usaha_besar,
          SUM(if(merchant_criteria = 'UBE', amount_trx, 0)) AS sum_usaha_besar
        FROM t1clean_qris_trx WHERE city = '".$document_excel[$i]['C']."'
      ")->row();
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('T'.$i, $trx->vol_issuer_onus > 0 ? $trx->vol_issuer_onus : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('U'.$i, $trx->sum_issuer_onus > 0 ? $trx->sum_issuer_onus : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('V'.$i, $trx->vol_issuer_offus > 0 ? $trx->vol_issuer_offus : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('W'.$i, $trx->sum_issuer_offus > 0 ? $trx->sum_issuer_offus : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('X'.$i, $trx->vol_acquirer_offus > 0 ? $trx->vol_acquirer_offus : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('Y'.$i, $trx->sum_acquirer_offus > 0 ? $trx->sum_acquirer_offus : '0');

      // MERCHANT CRITERIA
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('Z'.$i, $trx->vol_usaha_mikro > 0 ? $trx->vol_usaha_mikro : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('AA'.$i, $trx->sum_usaha_mikro > 0 ? $trx->sum_usaha_mikro : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('AB'.$i, $trx->vol_usaha_kecil > 0 ? $trx->vol_usaha_kecil : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('AC'.$i, $trx->sum_usaha_kecil > 0 ? $trx->sum_usaha_kecil : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('AD'.$i, $trx->vol_usaha_menengah > 0 ? $trx->vol_usaha_menengah : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('AE'.$i, $trx->sum_usaha_menengah > 0 ? $trx->sum_usaha_menengah : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('AF'.$i, $trx->vol_usaha_besar > 0 ? $trx->vol_usaha_besar : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('AG'.$i, $trx->sum_usaha_besar > 0 ? $trx->sum_usaha_besar : '0');

      // Transaksi QRIS berdasarkan Kategori Merchant	
      $category_trx = $this->db->query("
        SELECT 
          (
            SELECT SUM(vol_trx)   FROM t1clean_qris_trx WHERE mcc IN (SELECT mcc FROM tqris_mcc WHERE category = 'Regular') AND city = '".$document_excel[$i]['C']."'
          ) AS vol_merchant_reguler,
          (
            SELECT SUM(amount_trx)   FROM t1clean_qris_trx WHERE mcc IN (SELECT mcc FROM tqris_mcc WHERE category = 'Regular') AND city = '".$document_excel[$i]['C']."'
          ) AS sum_merchant_reguler,
          (
            SELECT SUM(vol_trx)   FROM t1clean_qris_trx WHERE mcc IN (SELECT mcc FROM tqris_mcc WHERE category = 'Pendidikan') AND city = '".$document_excel[$i]['C']."'
          ) AS vol_merchant_pendidikan,
          (
            SELECT SUM(amount_trx)   FROM t1clean_qris_trx WHERE mcc IN (SELECT mcc FROM tqris_mcc WHERE category = 'Pendidikan') AND city = '".$document_excel[$i]['C']."'
          ) AS sum_merchant_pendidikan,
          (
            SELECT SUM(vol_trx)   FROM t1clean_qris_trx WHERE mcc IN (SELECT mcc FROM tqris_mcc WHERE category = 'SPBU') AND city = '".$document_excel[$i]['C']."'
          ) AS vol_merchant_spbu,
          (
            SELECT SUM(amount_trx)   FROM t1clean_qris_trx WHERE mcc IN (SELECT mcc FROM tqris_mcc WHERE category = 'SPBU') AND city = '".$document_excel[$i]['C']."'
          ) AS sum_merchant_spbu,
          (
            SELECT SUM(vol_trx)   FROM t1clean_qris_trx WHERE mcc IN (SELECT mcc FROM tqris_mcc WHERE category = 'G2P') AND city = '".$document_excel[$i]['C']."'
          ) AS vol_merchant_g2p,
          (
            SELECT SUM(amount_trx)   FROM t1clean_qris_trx WHERE mcc IN (SELECT mcc FROM tqris_mcc WHERE category = 'G2P') AND city = '".$document_excel[$i]['C']."'
          ) AS sum_merchant_g2p,
          (
            SELECT SUM(vol_trx)   FROM t1clean_qris_trx WHERE mcc IN (SELECT mcc FROM tqris_mcc WHERE category = 'P2G Nasional & Daerah') AND city = '".$document_excel[$i]['C']."'
          ) AS vol_merchant_p2g,
          (
            SELECT SUM(amount_trx)   FROM t1clean_qris_trx WHERE mcc IN (SELECT mcc FROM tqris_mcc WHERE category = 'P2G Nasional & Daerah') AND city = '".$document_excel[$i]['C']."'
          ) AS sum_merchant_p2g,
          (
            SELECT SUM(vol_trx)   FROM t1clean_qris_trx WHERE mcc IN (SELECT mcc FROM tqris_mcc WHERE category = 'Donasi Sosial') AND city = '".$document_excel[$i]['C']."'
          ) AS vol_merchant_donasi_sosial,
          (
            SELECT SUM(amount_trx)   FROM t1clean_qris_trx WHERE mcc IN (SELECT mcc FROM tqris_mcc WHERE category = 'Donasi Sosial') AND city = '".$document_excel[$i]['C']."'
          ) AS sum_merchant_donasi_sosial
      ")->row();							
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('AH'.$i, $category_trx->vol_merchant_reguler > 0 ? $category_trx->vol_merchant_reguler : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('AI'.$i, $category_trx->sum_merchant_reguler > 0 ? $category_trx->sum_merchant_reguler : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('AJ'.$i, $category_trx->vol_merchant_pendidikan > 0 ? $category_trx->vol_merchant_pendidikan : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('AK'.$i, $category_trx->sum_merchant_pendidikan > 0 ? $category_trx->sum_merchant_pendidikan : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('AL'.$i, $category_trx->vol_merchant_spbu > 0 ? $category_trx->vol_merchant_spbu : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('AM'.$i, $category_trx->sum_merchant_spbu > 0 ? $category_trx->sum_merchant_spbu : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('AN'.$i, $category_trx->vol_merchant_g2p > 0 ? $category_trx->vol_merchant_g2p : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('AO'.$i, $category_trx->sum_merchant_g2p > 0 ? $category_trx->sum_merchant_g2p : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('AP'.$i, $category_trx->vol_merchant_p2g > 0 ? $category_trx->vol_merchant_p2g : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('AQ'.$i, $category_trx->sum_merchant_p2g > 0 ? $category_trx->sum_merchant_p2g : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('AR'.$i, $category_trx->vol_merchant_donasi_sosial > 0 ? $category_trx->vol_merchant_donasi_sosial : '0');
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('AS'.$i, $category_trx->sum_merchant_donasi_sosial > 0 ? $category_trx->sum_merchant_donasi_sosial : '0');

    }
    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="Report QRIS bulan '.date('M').'.xlsx"');
    header('Cache-Control: max-age=0');
    $objWriter->save('php://output');

    set_time_limit(0);
    ini_set('memory_limit', '1G');

    user_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report QRIS", '');
    trx_log($this->session->userdata('id'), 'REPORT', "DOWNLOAD", '', "Download Report QRIS");
    exit;
  }

 
  // END :: QRIS
  

  // START :: QRIS
  public function sys_availability()
  {

    $data = [];
    $data['service'] = $this->db->query("SELECT * FROM tsysavailability_service")->result();
    $data['pic'] = $this->db->query("SELECT * FROM tsysavailability_pic")->result();
    $data['content'] = $this->load->view('report/sys_availability', $data, TRUE);
    $this->load->view('layout', $data);
  }
  public function ajax_availability_pic()
  {}
  // END :: SYSTEM AVAILABILITY 

  

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
