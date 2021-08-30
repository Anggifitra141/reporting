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

  public function download_excel_ltdbb()
  {


    include APPPATH . 'third_party/PHPExcel/PHPExcel.php';
    // $type_report = $this->input->post('type_report');

    $start_date = date('Ymd', strtotime(substr($_GET['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_GET['daterange'], 13, 23)));
    $type_report = $_GET['type_report'];

    $this->db->where('status', "new");
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
    $list = $this->db->get('tltdbb_source')->result();


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
          ->setCellValue('F'. $baris, "1")
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
          ->setCellValue('F'. $baris, "1")
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
          ->setCellValue('F'. $baris, "1")
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
    ob_end_clean();
    exit;
  }


  //SIPESAT

  public function sipesat()
  {

    $data = [];
    $data['content'] = $this->load->view('report/ltdbb', $data, TRUE);
    $this->load->view('layout', $data);
  }

  public function ajax_list_sipesat()
  {

    $list = $this->M_report->get_datatables_sipesat();
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
        $row[] = $raw_data->customer_code;
        $row[] = $raw_data->customer_name;
        $row[] = $raw_data->birth_place;
        $row[] = $raw_data->birth_date;
        $row[] = $raw_data->address;
        $row[] = $raw_data->id_card_number;
        $row[] = $raw_data->id_card_number_other;
        $row[] = $raw_data->customer_cif;
        $row[] = $raw_data->birth_date;
        $row[] = $raw_data->birth_date;
        $row[] = $raw_data->birth_date;
        $row[] = $raw_data->birth_date;
        $row[] = $raw_data->birth_date;


      $data[] = $row;
    }

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
