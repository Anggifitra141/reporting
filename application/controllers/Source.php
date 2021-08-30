<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Source extends CI_Controller {

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
	{
		parent::__construct();
    $this->load->model(['M_raw_data', 'M_tltdbb_source', 'M_danafloat_source', 'M_sipesat_source']);
    if(!$this->session->userdata('logged_in'))
    {
      $data=array();
			$data['msg'] = "Maaf Anda tidak punya akses ke halaman ini !";
			$content = $this->load->view('errors/html/error_sessi', $data, TRUE);
			exit($content);
    }
	}

	public function tltdbb_source()
	{
    $data= [];
    $data['content'] = $this->load->view('source/tltdbb_source', $data, TRUE);
		$this->load->view('layout', $data);
	}

  private function _get_header($type)
  {
    $data = [];
    if($type == "G001"){
      $data['title']  = 'Data Ltdbb G001';
      $data['sub_title']  = 'Transaksi Pengiriman Uang Dari Indonesia Ke Luar Negeri';
      $data['header'] = ['Kota/Kabupaten Asal Pengiriman', 'Negara Tujuan Pengiriman', 'Nama Penerima', 'Nama Pengirim', 'Volume/frekuensi transaksi', 'Nominal Transaksi', 'Tujuan Transaksi'];
    }else if($type == "G002"){
      $data['title']  = 'Data Ltdbb G002';
      $data['sub_title']  = 'Transaksi Pengiriman Uang Dari Luar Negeri Ke Indonesia';
      $data['header'] = ['Negara Asal Pengiriman', 'Kota/Kabupaten Tujuan Pengiriman', 'Nama Penerima', 'Nama Pengirim', 'Volume/frekuensi transaksi', 'Nominal Transaksi'];
    }else{
      $data['title']  = 'Data Ltdbb G003';
      $data['sub_title']  = 'Transaksi Pengiriman Uang Di Wilayah Republik Indonesia';
      $data['header'] = ['Kota/Kabupaten Asal Pengiriman', 'Kota/Kabupaten Tujuan Pengiriman', 'Nama Penerima', 'Nama Pengirim', 'Volume/frekuensi transaksi', 'Nominal Transaksi', 'Tujuan Transaksi'];
    }
    return $data;
  }

  public function dana_float()
	{
    $data= [];
    $data['content'] = $this->load->view('source/dana_float', $data, TRUE);
		$this->load->view('layout', $data);
	}
  public function si_pesat()
	{
    $data= [];
    $data['content'] = $this->load->view('source/si_pesat', $data, TRUE);
		$this->load->view('layout', $data);
	}
  // END :: UPLOAD SOURCE

  // START :: AJAX LTDBB
  public function ajax_list_tltdbb_source()
   {
     $list = $this->M_tltdbb_source->get_datatables();
     $data = array();
     $no = $_POST['start'];
     foreach ($list as $raw_data) {
      $no++;
      $row = array();
      $row[] = $no; 
      $row[] = $raw_data->sender_country;
      $row[] = $raw_data->sender_city;
      $row[] = $raw_data->recept_country;
      $row[] = $raw_data->recept_city;
      $row[] = $raw_data->sender_name;
      $row[] = $raw_data->recept_name;
      $row[] = $raw_data->trx_freq;
      $row[] = $this->lib->rupiah($raw_data->trx_amount);
      $row[] = '3-Non Usaha – Lainnya';

      $data[] = $row;
      
     } 
    $recordsTotal = $this->M_tltdbb_source->count_all();
    $recordsFiltered = $this->M_tltdbb_source->count_filtered();
     $output = array(
               "draw" => $_POST['draw'],
               "recordsTotal" => $recordsTotal,
               "recordsFiltered" => $recordsFiltered,
               "data" => $data,
             );
     echo json_encode($output);
   }

  // END :: AJAX LTDBB

  // START :: AJAX DANA FLOAT
  public function ajax_list_dana_float()
  {
    $list = $this->M_danafloat_source->get_datatables();
    $data = array();
    $no = $_POST['start'];
    foreach ($list as $raw_data) {
      $no++;
      $row = array();
      $row[] = $no;
      $row[] = $raw_data->wallet_code;
      $row[] = $raw_data->trx_code;
      $row[] = $raw_data->trx_id;
      $row[] = $raw_data->trx_type;
      $row[] = $raw_data->trx_value;
      $row[] = $raw_data->description;
      $row[] = $raw_data->status;
      $data[] = $row;
    } 
    $output = array(
              "draw" => $_POST['draw'],
              "recordsTotal" => $this->M_danafloat_source->count_all(),
              "recordsFiltered" => $this->M_danafloat_source->count_filtered(),
              "data" => $data,
            );
    echo json_encode($output);
  }
// END :: AJAX DANA FLOAT

// START :: AJAX SI PESAT
public function ajax_list_si_pesat()
{
  $list = $this->M_sipesat_source->get_datatables();
  $data = array();
  $no = $_POST['start'];
  foreach ($list as $raw_data) {
    $no++;
    $row = array();
    $row[] = $no;
    $row[] = strtoupper($raw_data->customer_name);
    $row[] = $raw_data->birth_place;
    $row[] = $this->lib->date_indo($raw_data->birth_date);
    $row[] = $raw_data->address;
    $row[] = $raw_data->id_card_number;
    $row[] = $raw_data->id_card_number_other;
    $row[] = $raw_data->customer_cif;
    $data[] = $row;
  } 
  $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->M_sipesat_source->count_all(),
            "recordsFiltered" => $this->M_sipesat_source->count_filtered(),
            "data" => $data,
          );
  echo json_encode($output);
}
// END :: AJAX SI PESAT

  // START :: AJAX DATA CLEAN
  public function ajax_list_clean_data()
   {
     $list = $this->M_clean_data->get_datatables();
     $data = array();
     $no = $_POST['start'];
     foreach ($list as $raw_data) {
       $no++;
       $row = array();
       $row[] = $no;
       $row[] = $raw_data->trxdate;
       $row[] = $raw_data->sendercountry;
       $row[] = $raw_data->sendercity;
       $row[] = $raw_data->receiptcountry;
       $row[] = $raw_data->receiptcity;
       $row[] = $raw_data->sendername;
       $row[] = $raw_data->receiptcity;
       $row[] = $this->lib->rupiah($raw_data->nominal);
       $data[] = $row;
     } 
     $output = array(
               "draw" => $_POST['draw'],
               "recordsTotal" => $this->M_clean_data->count_all(),
               "recordsFiltered" => $this->M_clean_data->count_filtered(),
               "data" => $data,
             );
     echo json_encode($output);
   }

   public function cleansing_data()
   {
     $data = $this->M_raw_data->get()->result();
     echo json_encode($data);
   }
  // END :: AJAX DATA CLEAN
  
 
}
