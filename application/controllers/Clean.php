<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Clean extends CI_Controller {

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
	{
		parent::__construct();
    $this->load->model(['M_raw_data', 'M_tltdbb_clean', 'M_danafloat_clean', 'M_sipesat_clean']);
    // $this->load->model(['M_clean_data']);
    if(!$this->session->userdata('logged_in'))
    {
      $data=array();
			$data['msg'] = "Maaf Anda tidak punya akses ke halaman ini !";
			$content = $this->load->view('errors/html/error_sessi', $data, TRUE);
			exit($content);
    }
	}

	public function tltdbb_clean($type="")
	{
    if($type == ""){
      $data['msg'] = "Access Forbidden !";
			$content = $this->load->view('errors/html/error_sessi', $data, TRUE);
			exit($content);
    }
    $cek_report_type = $this->_get_header($type);
    $data= [];
    $data['header'] = $cek_report_type;
    $data['content'] = $this->load->view('clean/tltdbb_clean', $data, TRUE);
		$this->load->view('layout', $data);
	}
  private function _get_header($type)
  {
    $data = [];
    if($type == "G001"){
      $data['title']  = 'Data Ltdbb G001';
      $data['sub_title']  = 'Transaksi Pengiriman Uang Dari INDONESIA Ke Luar Negeri';
      $data['header'] = ['Kota/Kabupaten Asal Pengiriman', 'Negara Tujuan Pengiriman', 'Nama Penerima', 'Nama Pengirim', 'Volume/frekuensi transaksi', 'Nominal Transaksi', 'Tujuan Transaksi'];
    }else if($type == "G002"){
      $data['title']  = 'Data Ltdbb G002';
      $data['sub_title']  = 'Transaksi Pengiriman Uang Dari Luar Negeri Ke INDONESIA';
      $data['header'] = ['Negara Asal Pengiriman', 'Kota/Kabupaten Tujuan Pengiriman', 'Nama Penerima', 'Nama Pengirim', 'Volume/frekuensi transaksi', 'Nominal Transaksi'];
    }else{
      $data['title']  = 'Data Ltdbb G003';
      $data['sub_title']  = 'Transaksi Pengiriman Uang Di Wilayah Republik INDONESIA';
      $data['header'] = ['Kota/Kabupaten Asal Pengiriman', 'Kota/Kabupaten Tujuan Pengiriman', 'Nama Penerima', 'Nama Pengirim', 'Volume/frekuensi transaksi', 'Nominal Transaksi', 'Tujuan Transaksi'];
    }
    return $data;
  }

  public function dana_float()
	{
    $data= [];
    $data['content'] = $this->load->view('clean/dana_float', $data, TRUE);
		$this->load->view('layout', $data);
	}
  public function si_pesat()
	{
    $data= [];
    $data['content'] = $this->load->view('clean/si_pesat', $data, TRUE);
		$this->load->view('layout', $data);
	}
  // START :: AJAX LTDBB
  public function ajax_list_tltdbb_clean()
   {
     $type_report = $this->input->post('type_report');
     $this->db->where('status', "cleansing");
     if($type_report == 'G001'){
      $this->db->where_in('sender_country', array('INDONESIA', '86'));
      $this->db->where_not_in('recept_country', array('INDONESIA', '86'));
    }else if($type_report == 'G002'){
      $this->db->where_not_in('sender_country', array('INDONESIA', '86'));
      $this->db->where_in('recept_country', array('INDONESIA', '86'));
    }else if($type_report == 'G003'){
      $this->db->where_in('sender_country', array('INDONESIA', '86'));
      $this->db->where_in('recept_country', array('INDONESIA', '86'));
    }
     $list = $this->M_tltdbb_clean->get_datatables();
     $data = array();
     $no = $_POST['start'];
     foreach ($list as $raw_data) {
      $no++;
      $row = array();
      $row[] = $no; 
      if($type_report == 'G001'){
        $row[] = $raw_data->recept_city;
        $row[] = $raw_data->recept_country;
        $row[] = $raw_data->recept_name;
        $row[] = $raw_data->sender_name;
        $row[] = '1';
        $row[] = $this->lib->rupiah($raw_data->amount);
        $row[] = '3-Non Usaha – Lainnya';
      }else if($type_report == 'G002') {
        $row[] = $raw_data->sender_country;
        $row[] = $raw_data->recept_city;
        $row[] = $raw_data->recept_name;
        $row[] = $raw_data->sender_name;
        $row[] = '1';
        $row[] = $this->lib->rupiah($raw_data->amount);
      }else if($type_report == 'G003'){
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
     if($type_report == 'G001'){
      $this->db->where_in('sender_country', array('INDONESIA', '86'));
      $this->db->where_not_in('recept_country', array('INDONESIA', '86'));
    }else if($type_report == 'G002'){
      $this->db->where_not_in('sender_country', array('INDONESIA', '86'));
      $this->db->where_in('recept_country', array('INDONESIA', '86'));
    }else if($type_report == 'G003'){
      $this->db->where_in('sender_country', array('INDONESIA', '86'));
      $this->db->where_in('recept_country', array('INDONESIA', '86'));
    }
    $recordsTotal = $this->M_raw_data->count_all();

    if($type_report == 'G001'){
      $this->db->where_in('sender_country', array('INDONESIA', '86'));
      $this->db->where_not_in('recept_country', array('INDONESIA', '86'));
    }else if($type_report == 'G002'){
      $this->db->where_not_in('sender_country', array('INDONESIA', '86'));
      $this->db->where_in('recept_country', array('INDONESIA', '86'));
    }else if($type_report == 'G003'){
      $this->db->where_in('sender_country', array('INDONESIA', '86'));
      $this->db->where_in('recept_country', array('INDONESIA', '86'));
    }
    $recordsFiltered = $this->M_raw_data->count_filtered();
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
    $list = $this->M_danafloat_clean->get_datatables();
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
              "recordsTotal" => $this->M_danafloat_clean->count_all(),
              "recordsFiltered" => $this->M_danafloat_clean->count_filtered(),
              "data" => $data,
            );
    echo json_encode($output);
  }
  // END :: AJAX DANA FLOAT

  // START :: AJAX SI PESAT
  public function ajax_list_si_pesat()
  {
    $list = $this->M_sipesat_clean->get_datatables();
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
              "recordsTotal" => $this->M_sipesat_clean->count_all(),
              "recordsFiltered" => $this->M_sipesat_clean->count_filtered(),
              "data" => $data,
            );
    echo json_encode($output);
  }
  // END :: AJAX SI PESAT
}