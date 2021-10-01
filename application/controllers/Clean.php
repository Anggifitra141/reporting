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
    $this->load->model(['M_tltdbb_clean', 'M_tltdbb_clean', 'M_danafloat_clean', 'M_sipesat_clean', 'M_ltkl_clean', 'M_lkpbu', 'M_qris_clean', 'M_sys_availability']);
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
  public function ltkl()
	{
    $data= [];
    $data['content'] = $this->load->view('clean/ltkl', $data, TRUE);
		$this->load->view('layout', $data);
	}
  // START :: AJAX LTDBB
  public function ajax_list_tltdbb_clean()
   {
     $type_report = $this->input->post('type_report');
     $this->db->where('status', "cleaned");
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
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));
    $this->db->where('trx_date >=', $start_date);
    $this->db->where('trx_date <=', $end_date);
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
        $row[] = $raw_data->trx_freq;
        $row[] = $this->lib->rupiah($raw_data->trx_amount);
        $row[] = '3-Non Usaha – Lainnya';
      }else if($type_report == 'G002') {
        $row[] = $raw_data->sender_country;
        $row[] = $raw_data->recept_city;
        $row[] = $raw_data->recept_name;
        $row[] = $raw_data->sender_name;
        $row[] = $raw_data->trx_freq;
        $row[] = $this->lib->rupiah($raw_data->trx_amount);
      }else if($type_report == 'G003'){
        $row[] = $raw_data->sender_city;
        $row[] = $raw_data->recept_city;
        $row[] = $raw_data->recept_name;
        $row[] = $raw_data->sender_name;
        $row[] = $raw_data->trx_freq;
        $row[] = $this->lib->rupiah($raw_data->trx_amount);
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
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));

    $this->db->where('trx_date >=', $start_date);
    $this->db->where('trx_date <=', $end_date);
    $recordsTotal = $this->M_tltdbb_clean->count_all();

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
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));

    $this->db->where('trx_date >=', $start_date);
    $this->db->where('trx_date <=', $end_date);
    $recordsFiltered = $this->M_tltdbb_clean->count_filtered();
     $output = array(
               "draw" => $_POST['draw'],
               "recordsTotal" => $recordsTotal,
               "recordsFiltered" => $recordsFiltered,
               "data" => $data,
             );
     echo json_encode($output);
   }

   

   public function ajax_bulk_delete_ltdbb()
   {
     $list_id = $this->input->post('id');
     foreach ($list_id as $id) {
         $this->M_tltdbb_clean->delete_by_id($id);
     }
     echo json_encode(array("status" => TRUE));
   }
   
   public function ajax_bulk_rollback_ltdbb()
   {
     $list_id = $this->input->post('id');
     $update_source_data = [];
     $delete_clean_data = [];
     foreach ($list_id as $id) {
       $result = $this->db->query("SELECT * FROM t1clean_ltdbb WHERE id = '".$id."'")->row();
       $update_source_data[] = array(
         'id'				=> $result->id_source,
         'status'		=> 'new'
       );
       $delete_clean_data[] = array(
        'id'				=> $id,
        'status'		=> 'deleted'
      );

     }
     $this->db->update_batch('t0source_ltdbb', $update_source_data, 'id');
     $this->db->update_batch('t1clean_ltdbb', $delete_clean_data, 'id');
     echo json_encode(['status' => true, 'rollback' => count($update_source_data)]);
   }

   public function ajax_delete_ltdbb()
   {
     $id = $this->input->post('id');
     $this->db->update('t1clean_ltdbb', ['status' => 'deleted'], ['id' => $id]);
     echo json_encode(['status' => true]);
   }

   public function get_ltdbb_by_id($id)
   {
     $data = $this->db->get_where('t1clean_ltdbb', ['id' => $id])->row();
     echo json_encode($data);
   }

   public function update_clean_ltdbb()
   {
    $data = [
      'sender_country'    => $this->input->post('sender_country'),
      'sender_city'    => $this->input->post('sender_city'),
      'sender_name'    => $this->input->post('sender_name'),
      'sender_phone'    => $this->input->post('sender_phone'),
      'trx_amount'    => $this->input->post('trx_amount'),
      'recept_country'    => $this->input->post('recept_country'),
      'recept_city'    => $this->input->post('recept_city'),
      'recept_name'    => $this->input->post('recept_name'),
      'recept_phone'    => $this->input->post('recept_phone'),
      'description'    => $this->input->post('description'),
    ];
    $this->db->update('t1clean_ltdbb', $data, ['id' => $this->input->post('id')]);
    echo json_encode(['status' => true]);
   }

  public function update_ltdbb()
  {
    $data = array(
      'bi_code'            => $this->input->post('bi_code'),
      'city'            => $this->input->post('city'),
      'bi_city'         => $this->input->post('bi_city')
    );
    $this->M_master->update_ltdbb_bi_city(array('id' => $this->input->post('id')), $data);
    echo json_encode(array("status" => TRUE));
  }

  // END :: AJAX LTDBB

  // START :: AJAX DANA FLOAT
  public function ajax_list_dana_float()
  {
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));
    $this->db->where('DATE_FORMAT(trx_datetime, "%Y%m%d") >=', $start_date);
    $this->db->where('DATE_FORMAT(trx_datetime, "%Y%m%d") <=', $end_date);
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
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));
    $this->db->where('DATE_FORMAT(trx_datetime, "%Y%m%d") >=', $start_date);
    $this->db->where('DATE_FORMAT(trx_datetime, "%Y%m%d") <=', $end_date);
    $recordsTotal = $this->M_danafloat_clean->count_all();
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));
    $this->db->where('DATE_FORMAT(trx_datetime, "%Y%m%d") >=', $start_date);
    $this->db->where('DATE_FORMAT(trx_datetime, "%Y%m%d") <=', $end_date);
    $recordsFiltered = $this->M_danafloat_clean->count_filtered();

    $output = array(
              "draw" => $_POST['draw'],
              "recordsTotal" => $recordsTotal,
              "recordsFiltered" => $recordsFiltered,
              "data" => $data,
            );
    echo json_encode($output);
  }
  public function ajax_bulk_delete_dana_float()
   {
     $list_id = $this->input->post('id');
     foreach ($list_id as $id) {
         $this->M_danafloat_clean->delete_by_id($id);
     }
     echo json_encode(array("status" => TRUE));
   }
   
   public function ajax_bulk_rollback_dana_float()
   {
     $list_id = $this->input->post('id');
     $update_source_data = [];
     $delete_clean_data = [];
     foreach ($list_id as $id) {
       $result = $this->db->query("SELECT * FROM t1clean_danafloat WHERE id = '".$id."'")->row();
       $update_source_data[] = array(
         'id'				=> $result->id_source,
         'status'		=> 'new'
       );
       $delete_clean_data[] = array(
        'id'				=> $id,
        'status'		=> 'deleted'
      );

     }
     $this->db->update_batch('t0source_danafloat', $update_source_data, 'id');
     $this->db->update_batch('t1clean_danafloat', $delete_clean_data, 'id');
     echo json_encode(['status' => true, 'rollback' => count($update_source_data)]);
   }

   public function ajax_delete_dana_float()
   {
     $id = $this->input->post('id');
     $this->db->update('t1clean_danafloat', ['status' => 'deleted'], ['id' => $id]);
     echo json_encode(['status' => true]);
   }

   public function get_danafloat_by_id($id)
   {
     $data = $this->db->get_where('t1clean_danafloat', ['id' => $id])->row();
     echo json_encode($data);
   }

   public function update_clean_danafloat()
   {
    $data = [
      'id'          => $this->input->post('id'),
      'wallet_code' => $this->input->post('wallet_code'),
      'trx_code'    => $this->input->post('trx_code'),
      'trx_id'      => $this->input->post('trx_id'),
      'trx_type'    => $this->input->post('trx_type'),
      'trx_value'   => $this->input->post('trx_value'),
      'description' => $this->input->post('description'),
      'credit'      => $this->input->post('credit'),
      'debit'       => $this->input->post('debit'),
      'syslogno'    => $this->input->post('syslogno'),
      'channel_id'  => $this->input->post('channel_id'),
      'srac'        => $this->input->post('srac'),
      'dsac'        => $this->input->post('dsac')
    ];
    $this->db->update('t1clean_danafloat', $data, ['id' => $this->input->post('id')]);
    echo json_encode(['status' => true]);
   }
  // END :: AJAX DANA FLOAT

  // START :: AJAX SI PESAT
  public function ajax_list_si_pesat()
  {
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));
    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
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
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));
    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
    $recordsTotal = $this->M_sipesat_clean->count_all();

    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));
    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
    $recordsFiltered = $this->M_sipesat_clean->count_filtered();

    $output = array(
              "draw" => $_POST['draw'],
              "recordsTotal" => $recordsTotal,
              "recordsFiltered" => $recordsFiltered,
              "data" => $data,
            );
    echo json_encode($output);
  }

  public function get_sipesat_by_id($id)
  {
    $data = $this->db->get_where('t1clean_sipesat', ['id' => $id])->row();
    echo json_encode($data);
  }

  public function update_clean_sipesat()
  {
    $data = [
      'customer_code'  => $this->input->post('customer_code'),
      'customer_name'     => $this->input->post('customer_name'),
      'birth_place'     => $this->input->post('birth_place'),
      'birth_date'    => $this->input->post('birth_date'),
      'address'      => $this->input->post('address'),
      'id_card_number'  => $this->input->post('id_card_number'),
      'id_card_number_other'     => $this->input->post('id_card_number_other'),
      'customer_cif'     => $this->input->post('customer_cif'),
    ];
    $this->db->update('t1clean_sipesat', $data, ['id' => $this->input->post('id')]);
    echo json_encode(['status' => true]);
  }

  public function ajax_bulk_delete_sipesat()
  {
    $list_id = $this->input->post('id');
    foreach ($list_id as $id) {
      $this->M_sipesat_clean->delete_by_id($id);
    }
    echo json_encode(array("status" => TRUE));
  }

  public function ajax_delete_sipesat()
  {
    $id = $this->input->post('id');
    $this->db->update('t1clean_sipesat', ['status' => 'deleted'], ['id' => $id]);
    echo json_encode(['status' => true]);
  }

  // END :: AJAX SI PESAT


  // / START :: AJAX SI LTKL
  public function ajax_list_ltkl()
  {
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));
    $this->db->where('trx_date >=', $start_date);
    $this->db->where('trx_date <=', $end_date);
    $list = $this->M_ltkl_clean->get_datatables();
    $data = array();
    $no = $_POST['start'];
    foreach ($list as $raw_data) {
      $no++;
      $row = array();
      $row[] = $no;
      $row[] = 'Local ID';
      $row[] = $raw_data->sender_name;
      $row[] = $raw_data->sender_country;
      $row[] = '';
      $row[] = '';
      $row[] = '';
      $row[] = 'Person';
      $row[] = $raw_data->recept_name;
      $row[] = $raw_data->destbankacc;
      $row[] = 'ini dari kode swfit';
      $row[] = 'account';
      $row[] = $raw_data->recept_name;
      $row[] = $raw_data->destamount;
      $row[] = 'TRM';
      $row[] = 'UT';
      $row[] = 'REK';
      $data[] = $row;
    }
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));
    $this->db->where('trx_date >=', $start_date);
    $this->db->where('trx_date <=', $end_date);
    $recordsTotal = $this->M_ltkl_clean->count_all();
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));
    $this->db->where('trx_date >=', $start_date);
    $this->db->where('trx_date <=', $end_date);
    $recordsFiltered = $this->M_ltkl_clean->count_filtered();
    
    $output = array(
              "draw" => $_POST['draw'],
              "recordsTotal" => $recordsTotal,
              "recordsFiltered" => $recordsFiltered,
              "data" => $data,
            );
    echo json_encode($output);
  }

  public function get_ltkl_by_id($id)
  {
    $data = $this->db->get_where('t1clean_ltkl', ['id' => $id])->row();
    echo json_encode($data);
  }

  public function update_clean_ltkl()
  {
    $data = [
      'customer_code'  => $this->input->post('customer_code'),
      'customer_name'     => $this->input->post('customer_name'),
      'birth_place'     => $this->input->post('birth_place'),
      'birth_date'    => $this->input->post('birth_date'),
      'address'      => $this->input->post('address'),
      'id_card_number'  => $this->input->post('id_card_number'),
      'id_card_number_other'     => $this->input->post('id_card_number_other'),
      'customer_cif'     => $this->input->post('customer_cif'),
    ];
    $this->db->update('t1clean_ltkl', $data, ['id' => $this->input->post('id')]);
    echo json_encode(['status' => true]);
  }

  public function ajax_bulk_delete_ltkl()
  {
    $list_id = $this->input->post('id');
    foreach ($list_id as $id) {
      $this->M_ltkl_clean->delete_by_id($id);
    }
    echo json_encode(array("status" => TRUE));
  }

  public function ajax_delete_ltkl()
  {
    $id = $this->input->post('id');
    $this->db->update('t1clean_ltkl', ['status' => 'deleted'], ['id' => $id]);
    echo json_encode(['status' => true]);
  }
  public function ajax_bulk_rollback_ltkl()
   {
     $list_id = $this->input->post('id');
     $update_source_data = [];
     $delete_clean_data = [];
     foreach ($list_id as $id) {
       $result = $this->db->query("SELECT * FROM t1clean_ltkl WHERE id = '".$id."'")->row();
       $update_source_data[] = array(
         'id'				=> $result->id_source,
         'status'		=> 'new'
       );
       $delete_clean_data[] = array(
        'id'				=> $id,
        'status'		=> 'deleted'
      );

     }
     $this->db->update_batch('t0source_ltkl', $update_source_data, 'id');
     $this->db->update_batch('t1clean_ltkl', $delete_clean_data, 'id');
     echo json_encode(['status' => true, 'rollback' => count($update_source_data)]);
   }

  // END :: AJAX LTKL

    //  START :: QRIS
    public function qris_merchant(){
      $data= [];
      $data['mcc'] = $this->db->get('tqris_mcc')->result();
      $data['merchant_criteria'] = $this->db->get('tqris_merchant_criteria')->result();
      $data['content'] = $this->load->view('clean/qris_merchant', $data, TRUE);
      $this->load->view('layout', $data);
    }
    public function qris_trx(){
      $data= [];
      $data['content'] = $this->load->view('clean/qris_trx', $data, TRUE);
      $this->load->view('layout', $data);
    }
    public function ajax_list_qris_merchant_clean()
    {
      $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
      $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));
  
      $this->db->where('datestamp >=', $start_date);
      $this->db->where('datestamp <=', $end_date);
      $list = $this->M_qris_clean->get_datatables_merchant();
      $data = array();
      $no = $_POST['start'];
      foreach ($list as $raw_data) {
       $no++;
       $row = array();
       $row[] = $no; 
       $row[] = '<a href="#" onclick="get_qris_merchant('.$raw_data->id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>
                  <a href="#" onclick="delete_qris_merchant('.$raw_data->id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
       $row[] = $raw_data->merchant_name;
       $row[] = $raw_data->city;
       $row[] = $raw_data->mcc;
       $row[] = $raw_data->merchant_criteria;
       $row[] = $raw_data->merchant_status;
       $row[] = date('d/m/Y', strtotime($raw_data->activation_peroid));
       $row[] = date('d/m/Y', strtotime($raw_data->datestamp));
  
       $data[] = $row;
       
      } 
      $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
      $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));
      $this->db->where('datestamp >=', $start_date);
      $this->db->where('datestamp <=', $end_date);
      $recordsTotal = $this->M_qris_clean->count_all_merchant();

      $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
      $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));
      $this->db->where('datestamp >=', $start_date);
      $this->db->where('datestamp <=', $end_date);
      $recordsFiltered = $this->M_qris_clean->count_filtered_merchant();
      $output = array(
                "draw" => $_POST['draw'],
                "recordsTotal" => $recordsTotal,
                "recordsFiltered" => $recordsFiltered,
                "data" => $data,
              );
      echo json_encode($output);
    }
    public function ajax_list_qris_trx_clean()
    {
      $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
      $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));
      $this->db->where('trx_date >=', $start_date);
      $this->db->where('trx_date <=', $end_date);
      $list = $this->M_qris_clean->get_datatables_trx();
      $data = array();
      $no = $_POST['start'];
      foreach ($list as $raw_data) {
       $no++;
       $row = array();
       $row[] = $no; 
       $row[] = $raw_data->city;
       $row[] = $raw_data->pjsp;
       $row[] = $raw_data->mcc;
       $row[] = $raw_data->merchant_criteria;
       $row[] = $raw_data->vol_trx;
       $row[] = $this->lib->rupiah($raw_data->amount_trx);
       $row[] = date('d/m/Y', strtotime($raw_data->trx_date));
       $row[] = date('d/m/Y', strtotime($raw_data->datestamp));
  
       $data[] = $row;
       
      } 
      $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
      $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));
      $this->db->where('trx_date >=', $start_date);
      $this->db->where('trx_date <=', $end_date);
      $recordsTotal = $this->M_qris_clean->count_all_trx();

      $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
      $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));
      $this->db->where('trx_date >=', $start_date);
      $this->db->where('trx_date <=', $end_date);
      $recordsFiltered = $this->M_qris_clean->count_filtered_trx();
      $output = array(
                "draw" => $_POST['draw'],
                "recordsTotal" => $recordsTotal,
                "recordsFiltered" => $recordsFiltered,
                "data" => $data,
              );
      echo json_encode($output);
    }
    
    public function get_qrismcc(){
      $mcc = $this->db->get('tqris_mcc')->result();
      echo json_encode($mcc);
    }
    public function get_merchant_criteria(){
      $result = $this->db->get('tqris_merchant_criteria')->result();
      echo json_encode($result);
    }

  public function get_qris_merchant($id)
  {
      $result = $this->M_qris_clean->get_qris_merchant($id);
      $data = [
        'id'             => $result->id,
        'merchant_name'      => $result->merchant_name,
        'city'  => $result->city,
        'mcc'        => $result->mcc,
        'merchant_criteria'        => $result->merchant_criteria,
        'merchant_status'        => $result->merchant_status,
        'activation_peroid'       => date('Y-m-d', strtotime($result->activation_peroid))
      ];
      echo json_encode($data);
  }

    public function add_qris_merchant()
    {
      $ACT = 'add';
      $this->_validate_qris_merchant($ACT);
      $data = array(
        'merchant_name'      => $this->input->post('merchant_name'),
          'city'  => $this->input->post('city'),
          'mcc'        => $this->input->post('mcc'),
          'merchant_criteria'        => $this->input->post('merchant_criteria'),
          'merchant_status'        => $this->input->post('merchant_status'),
          'activation_peroid'       => date('Ymd', strtotime($this->input->post('activation_peroid'))),
        'datestamp'         => date('Ymd'),
        'status'            => 'cleaned'
      );
      $this->db->insert('t0source_qris_merchant', $data);
      $id_source = $this->db->insert_id();
      $data['id_source'] = $id_source;
      $this->M_qris_clean->add_qris_merchant($data);
      echo json_encode(array("status" => TRUE ));
    }

    public function update_qris_merchant()
    {
      $ACT = 'update';
      $this->_validate_qris_merchant($ACT);
      $data = array(
        'merchant_name'      => $this->input->post('merchant_name'),
          'city'  => $this->input->post('city'),
          'mcc'        => $this->input->post('mcc'),
          'merchant_criteria'        => $this->input->post('merchant_criteria'),
          'merchant_status'        => $this->input->post('merchant_status'),
          'activation_peroid'       => date('Ymd', strtotime($this->input->post('activation_peroid'))),
        'datestamp'         => date('Ymd')
      );
      $this->M_qris_clean->update_qris_merchant(array('id' => $this->input->post('id')), $data);
      echo json_encode(array("status" => TRUE ));
    }

    public function delete_qris_merchant($id)
    {
      $this->M_qris_clean->delete_qris_merchant($id);
      echo json_encode(array("status" => TRUE));
    }

    private function _validate_qris_merchant($event)
    {
      $data = array();
      $data['error_string'] = array();
      $data['inputerror'] = array();
      $data['status'] = TRUE;
      $actions = explode('#', $this->session->userdata('action'));
      $data['action'] = $actions;

      if(!in_array($event, $actions))
      {
          $data['inputerror'][] = 'sess_act';
          $data['error_string'][] = 'Error! You have no right to this action.';
          $data['status'] = FALSE;
      }
      if($this->input->post('merchant_name') == '')
      {
          $data['inputerror'][] = 'merchant_name';
          $data['error_string'][] = 'merchant_name is required';
          $data['status'] = FALSE;
      }
      if($this->input->post('city') == '')
      {
          $data['inputerror'][] = 'city';
          $data['error_string'][] = 'Ticket Status is required';
          $data['status'] = FALSE;
      }
      if($this->input->post('mcc') == '')
      {
          $data['inputerror'][] = 'mcc';
          $data['error_string'][] = 'mcc is required';
          $data['status'] = FALSE;
      }
      if($this->input->post('merchant_criteria') == '')
      {
          $data['inputerror'][] = 'merchant_criteria';
          $data['error_string'][] = 'merhant criteria is required';
          $data['status'] = FALSE;
      }
      if($this->input->post('activation_peroid') == '')
      {
          $data['inputerror'][] = 'activation_peroid';
          $data['error_string'][] = 'activation period is required';
          $data['status'] = FALSE;
      }
    
      if($data['status'] === FALSE)
      {
          echo json_encode($data);
          exit();
      }
    }

    public function import_qris_merchant(){
      $this->_validate_import_309_310_311();
      $config['upload_path'] = './assets/';
      $config['allowed_types'] = 'xls|xlsx';
      $config['overwrite'] = true;
      $this->load->library('upload', $config);
      if($this->upload->do_upload('file_import')){
        $file = $this->upload->data();
        include APPPATH.'third_party/PHPExcel/PHPExcel.php';
        // if($file['file_ext'] == 'xls'){
        //   $excelreader = new PHPExcel_Reader_Excel5();
        // }else{
        // }
          $excelreader = new PHPExcel_Reader_Excel2007();

        // $excelreader = new PHPExcel_Reader_Excel5();

        $loadexcel   = $excelreader->load('assets/'.$file['file_name']);
        $sheet       = $loadexcel->getActiveSheet()->toArray(null, true, true ,true);

        $data = [];
        $data_update = [];

        $numrow = 1;
        foreach($sheet as $row){
          if($numrow > 1){
            $data = [
              'merchant_name'     =>   $row['A'],
              'city'              =>   $row['B'],
              'mcc'               =>   $row['C'],
              'merchant_criteria' =>   $row['D'],
              'merchant_status'   =>   $row['E'],
              'activation_peroid'         =>   date('Ymd', strtotime($row['F'])),
              'datestamp'         =>   date('Ymd'),
            ];
            $data_source = $data;
            $data_source['status'] = 'old';
            $this->db->insert('t0source_qris_merchant', $data_source);
            $id_source = $this->db->insert_id();
            $data['id_source'] = $id_source;
            $data['status'] = 'cleaned';
            $this->db->insert('t1clean_qris_merchant', $data);

          }
          $numrow++;
        }
        unlink('./assets/'.$file['file_name']);
        
      }
      echo json_encode(['status' => true, 'message' => 'Import data berhasil']);
    }
    // END :: QRIS

  // START :: FORM 302
  public function form_302()
  {
    $data= [];
    $data['content'] = $this->load->view('clean/lkpbu/form_302', $data, TRUE);
		$this->load->view('layout', $data);
  }
  public function ajax_list_lkpbu_card()
  {
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));

    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
    $list = $this->M_lkpbu->get_datatables302_card();
    $data = array();
    $no = $_POST['start'];
    foreach ($list as $raw_data) {
     $no++;
     $row = array();
     $row[] = $no; 
     $row[] = $raw_data->cust_code;
     $row[] = $raw_data->cust_type_id;
     $row[] = $raw_data->city_id;
     $row[] = $raw_data->status_card;
     $row[] = date('d/m/Y', strtotime($raw_data->register_date));

     $data[] = $row;
     
    } 
    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
   $recordsTotal = $this->M_lkpbu->count_all302_card();
   $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
   $recordsFiltered = $this->M_lkpbu->count_filtered302_card();
    $output = array(
              "draw" => $_POST['draw'],
              "recordsTotal" => $recordsTotal,
              "recordsFiltered" => $recordsFiltered,
              "data" => $data,
            );
    echo json_encode($output);
  }

  public function ajax_list_lkpbu_dana_float()
  {
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));

    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
    $list = $this->M_lkpbu->get_datatables302_dana_float();
    $data = array();
    $no = $_POST['start'];
    foreach ($list as $raw_data) {
     $no++;
     $row = array();
     $row[] = $no; 
     $row[] = $raw_data->cust_code;
     $row[] = $raw_data->cust_type_id;
     $row[] = $raw_data->city_id;
     $row[] = $raw_data->curr_balance;
     $row[] = date('d/m/Y H:i:s', strtotime($raw_data->trx_datetime));

     $data[] = $row;
     
    } 
    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
   $recordsTotal = $this->M_lkpbu->count_all302_dana_float();
   $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
   $recordsFiltered = $this->M_lkpbu->count_filtered302_dana_float();
    $output = array(
              "draw" => $_POST['draw'],
              "recordsTotal" => $recordsTotal,
              "recordsFiltered" => $recordsFiltered,
              "data" => $data,
            );
    echo json_encode($output);
  }
  public function ajax_list_lkpbu_trx()
  {
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));

    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
    $list = $this->M_lkpbu->get_datatables302_trx();
    $data = array();
    $no = $_POST['start'];
    foreach ($list as $raw_data) {
     $no++;
     $row = array();
     $row[] = $no; 
     $row[] = $raw_data->cust_code;
     $row[] = $raw_data->cust_type_id;
     $row[] = $raw_data->city_id;
     $row[] = $this->lib->rupiah($raw_data->trx_value);
     $row[] = $raw_data->trx_code;
     $row[] = $raw_data->wstransfertype;
     $row[] = date('d/m/Y H:i:s', strtotime($raw_data->trx_datetime));

     $data[] = $row;
     
    } 
    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
   $recordsTotal = $this->M_lkpbu->count_all302_trx();
   $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
   $recordsFiltered = $this->M_lkpbu->count_filtered302_trx();
    $output = array(
              "draw" => $_POST['draw'],
              "recordsTotal" => $recordsTotal,
              "recordsFiltered" => $recordsFiltered,
              "data" => $data,
            );
    echo json_encode($output);
  }
  public function ajax_list_lkpbu_vol()
  {
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));

    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
    $list = $this->M_lkpbu->get_datatables302_vol();
    $data = array();
    $no = $_POST['start'];
    foreach ($list as $raw_data) {
     $no++;
     $row = array();
     $row[] = $no; 
     $row[] = $raw_data->cust_code;
     $row[] = $raw_data->cust_type_id;
     $row[] = $raw_data->city_id;
     $row[] = $this->lib->rupiah($raw_data->trx_value);
     $row[] = $raw_data->init_amount;
     $row[] = date('d/m/Y H:i:s', strtotime($raw_data->trx_datetime));

     $data[] = $row;
     
    } 
    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
   $recordsTotal = $this->M_lkpbu->count_all302_vol();
   $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
   $recordsFiltered = $this->M_lkpbu->count_filtered302_vol();
    $output = array(
              "draw" => $_POST['draw'],
              "recordsTotal" => $recordsTotal,
              "recordsFiltered" => $recordsFiltered,
              "data" => $data,
            );
    echo json_encode($output);
  }
  // END :: FORM 302
  
  // START :: FORM 304
	public function form_304()
	{
    $data= [];
    $data['machine_type'] = $this->db->get('tlkpbu_304_machine_type')->result();
    $data['content'] = $this->load->view('clean/lkpbu/form_304', $data, TRUE);
		$this->load->view('layout', $data);
	}

	public function ajax_list_304()
  {
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));

    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);

    $list = $this->M_lkpbu->Get_All304();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
				$row[] = '<a href="#" onclick="get_form_304('.$item->id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>
                  <a href="#" onclick="delete_form_304('.$item->id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
        $row[] = date('d/m/Y', strtotime($item->trx_date));
				$row[] = $item->machine;
        $row[] = $item->total_machine;
        $row[] = $item->total_seller;
        $row[] = $item->description;
        $data[] = $row;
    }

    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $this->M_lkpbu->count_all304(),
                    "recordsFiltered" => $this->M_lkpbu->count_filtered304(),
                    "data" => $data,
            );
    echo json_encode($output);
  }

  public function get_form_304($id)
  {
      $result = $this->M_lkpbu->get_lkpbu304($id);
      $data = [
        'id'    => $result->id,
        'machine_code'    => $result->machine_code,
        'total_machine'    => $result->total_machine,
        'total_seller'    => $result->total_seller,
        'trx_date'    => date('Y-m-d', strtotime($result->trx_date))
      ];

      echo json_encode($data);
  }

  public function add_form_304()
  {
    $ACT = 'add';
    $this->_validate_form304($ACT);
    $data = array(
      'machine_code'      => $this->input->post('machine_code'),
      'total_machine'            => $this->input->post('total_machine'),
      'total_seller'            => $this->input->post('total_seller'),
      'trx_date'          => date('Ymd', strtotime($this->input->post('trx_date'))),
      'datestamp'         => date('Ymd'),
      'status'            => 'cleaned'
    );
    $this->M_lkpbu->add_lkpbu304($data);
    echo json_encode(array("status" => TRUE ));
  }

  public function update_form_304()
  {
    $ACT = 'update';
    $this->_validate_form304($ACT);
    $data = array(
      'machine_code'      => $this->input->post('machine_code'),
      'total_machine'            => $this->input->post('total_machine'),
      'total_seller'            => $this->input->post('total_seller'),
      'datestamp'         => date('Ymd'),
      'trx_date'          => date('Ymd', strtotime($this->input->post('trx_date')))
    );
     $this->M_lkpbu->update_lkpbu304(array('id' => $this->input->post('id')), $data);
     echo json_encode(array("status" => TRUE ));
  }

  public function delete_form_304($id)
  {
    $this->M_lkpbu->delete_lkpbu304($id);
    echo json_encode(array("status" => TRUE));
  }

  private function _validate_form304($event)
  {
    $data = array();
    $data['error_string'] = array();
    $data['inputerror'] = array();
    $data['status'] = TRUE;
    $actions = explode('#', $this->session->userdata('action'));
    $data['action'] = $actions;

    if(!in_array($event, $actions))
    {
        $data['inputerror'][] = 'sess_act';
        $data['error_string'][] = 'Error! You have no right to this action.';
        $data['status'] = FALSE;
    }
    if($this->input->post('machine_code') == '')
    {
        $data['inputerror'][] = 'machine_code';
        $data['error_string'][] = 'Jenis Mesin is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('total_machine') == '')
    {
        $data['inputerror'][] = 'total_machine';
        $data['error_string'][] = 'Jumlah Mesin is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('total_seller') == '')
    {
        $data['inputerror'][] = 'total_seller';
        $data['error_string'][] = 'Total seller is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('trx_date') == '')
    {
        $data['inputerror'][] = 'trx_date';
        $data['error_string'][] = 'Trx date is required';
        $data['status'] = FALSE;
    }
    if($data['status'] === FALSE)
    {
        echo json_encode($data);
        exit();
    }
  }
  // END :: FORM 304



  // START :: FORM 306
  public function form_306()
	{
    $data= [];
    $data['fraud_type'] = $this->db->get('tlkpbu_306_fraud_type')->result();
    $data['content'] = $this->load->view('clean/lkpbu/form_306', $data, TRUE);
		$this->load->view('layout', $data);
	}

	public function ajax_list_306()
  {
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));

    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
    
    $list = $this->M_lkpbu->Get_All306();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
				$row[] = '<a href="#" onclick="get_form_306('.$item->id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>
                  <a href="#" onclick="delete_form_306('.$item->id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
        $row[] = date('d/m/Y', strtotime($item->trx_date));
				$row[] = $item->fraud_code;
        $row[] = $item->actual_loss_vol;
        $row[] = $this->lib->rupiah($item->actual_loss_nominal);
        $row[] = $item->potential_loss_vol;
        $row[] = $this->lib->rupiah($item->potential_loss_nominal);
        $row[] = '<a href="'.$item->file_location.'" target="_blank">'.$item->file_location.'</a>';
        $data[] = $row;
    }

    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $this->M_lkpbu->count_all306(),
                    "recordsFiltered" => $this->M_lkpbu->count_filtered306(),
                    "data" => $data,
            );
    echo json_encode($output);
  }

  public function get_form_306($id)
  {
      $result = $this->M_lkpbu->get_lkpbu306($id);
      $data = [
        'id'                      => $result->id,
        'fraud_code'              => $result->fraud_code,
        'actual_loss_vol'         => $result->actual_loss_vol,
        'actual_loss_nominal'     => $result->actual_loss_nominal,
        'potential_loss_vol'      => $result->potential_loss_vol,
        'potential_loss_nominal'  => $result->potential_loss_nominal,
        'file_location'  => $result->file_location,
        'trx_date'                => date('Y-m-d', strtotime($result->trx_date))
      ];
      echo json_encode($data);
  }

  public function add_form_306()
  {
    $ACT = 'add';
    $this->_validate_form306($ACT);
    $file_location = $this->_do_upload('file_location');
    $data = array(
      'fraud_code'      => $this->input->post('fraud_code'),
      'actual_loss_vol'     => $this->input->post('actual_loss_vol'),
      'actual_loss_nominal'      => $this->lib->convert_to_number($this->input->post('actual_loss_nominal')),
      'potential_loss_vol'      => $this->input->post('potential_loss_vol'),
      'potential_loss_nominal'      => $this->lib->convert_to_number($this->input->post('potential_loss_nominal')),
      'trx_date'          => date('Ymd', strtotime($this->input->post('trx_date'))),
      'datestamp'         => date('Ymd'),
      'status'            => 'cleaned',
      'file_location'     => $file_location
    );
    $this->M_lkpbu->add_lkpbu306($data);
    echo json_encode(array("status" => TRUE ));
  }

  public function update_form_306()
  {
    $ACT = 'update';
    $this->_validate_form306($ACT);
    $data = array(
      'fraud_code'      => $this->input->post('fraud_code'),
      'actual_loss_vol'     => $this->input->post('actual_loss_vol'),
      'actual_loss_nominal'      => $this->lib->convert_to_number($this->input->post('actual_loss_nominal')),
      'potential_loss_vol'      => $this->input->post('potential_loss_vol'),
      'potential_loss_nominal'      => $this->lib->convert_to_number($this->input->post('potential_loss_nominal')),
      'datestamp'         => date('Ymd'),
      'trx_date'          => date('Ymd', strtotime($this->input->post('trx_date')))
    );
    if($_FILES['file_location']['name']){
      $data['file_location'] = $this->_do_upload('file_location');
    }
     $this->M_lkpbu->update_lkpbu306(array('id' => $this->input->post('id')), $data);
     echo json_encode(array("status" => TRUE ));
  }

  public function delete_form_306($id)
  {
    $this->M_lkpbu->delete_lkpbu306($id);
    echo json_encode(array("status" => TRUE));
  }

  private function _validate_form306($event)
  {
    $data = array();
    $data['error_string'] = array();
    $data['inputerror'] = array();
    $data['status'] = TRUE;
    $actions = explode('#', $this->session->userdata('action'));
    $data['action'] = $actions;

    if(!in_array($event, $actions))
    {
        $data['inputerror'][] = 'sess_act';
        $data['error_string'][] = 'Error! You have no right to this action.';
        $data['status'] = FALSE;
    }
    if($this->input->post('fraud_code') == '')
    {
        $data['inputerror'][] = 'fraud_code';
        $data['error_string'][] = 'Jenis Penyebab Fraud is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('actual_loss_vol') == '')
    {
        $data['inputerror'][] = 'actual_loss_vol';
        $data['error_string'][] = 'Fraud Volume is required';
        $data['status'] = FALSE;
    }
    if($this->lib->convert_to_number($this->input->post('actual_loss_nominal')) == '0')
    {
        $data['inputerror'][] = 'actual_loss_nominal';
        $data['error_string'][] = 'Fraud Nominal is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('potential_loss_vol') == '')
    {
        $data['inputerror'][] = 'potential_loss_vol';
        $data['error_string'][] = 'Fraud Volume is required';
        $data['status'] = FALSE;
    }
    if($this->lib->convert_to_number($this->input->post('potential_loss_nominal')) == '0')
    {
        $data['inputerror'][] = 'potential_loss_nominal';
        $data['error_string'][] = 'Fraud Nominal is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('trx_date') == '')
    {
        $data['inputerror'][] = 'trx_date';
        $data['error_string'][] = 'Trx date is required';
        $data['status'] = FALSE;
    }
    if($data['status'] === FALSE)
    {
        echo json_encode($data);
        exit();
    }
  }
  // END :: FORM 306

  // START :: FORM 309_310_311
  public function form_309_310_311()
	{
    $data= [];
    $data['content'] = $this->load->view('clean/lkpbu/form_309_310_311', $data, TRUE);
		$this->load->view('layout', $data);
	}

	public function ajax_list_309_310_311()
  {
    $start_date = date('Y-m-d', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Y-m-d', strtotime(substr($_POST['daterange'], 13, 23)));

    $this->db->where('DATE(opentime) >=', $start_date);
    $this->db->where('DATE(opentime) <=', $end_date);
    
    $list = $this->M_lkpbu->Get_All309_310_311();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
				$row[] = '<a href="#" onclick="get_form_309_310_311('.$item->id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>
                  <a href="#" onclick="delete_form_309_310_311('.$item->id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
				$row[] = $item->ticket_no;
        $row[] = $item->ticket_status;
        $row[] = $item->service;
        $row[] = $item->segname;
        $row[] = date('d/m/Y, H:i:s', strtotime($item->opentime));
        $row[] = date('d/m/Y, H:i:s', strtotime($item->closetime));
        $row[] = $item->code_309;
        $row[] = $item->code_310;
        $row[] = $item->code_311;
        $data[] = $row;
    }

    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $this->M_lkpbu->count_all309_310_311(),
                    "recordsFiltered" => $this->M_lkpbu->count_filtered309_310_311(),
                    "data" => $data,
            );
    echo json_encode($output);
  }

  public function get_form_309_310_311($id)
  {
      $result = $this->M_lkpbu->get_lkpbu309_310_311($id);
      $data = [
        'id'             => $result->id,
        'ticket_no'      => $result->ticket_no,
        'ticket_status'  => $result->ticket_status,
        'service'        => $result->service,
        'segname'        => $result->segname,
        'opentime'       => date('Y-m-d H:i:s', strtotime($result->opentime)),
        'closetime'      => date('Y-m-d H:i:s', strtotime($result->closetime)),
        'code_309'       => $result->code_309,
        'code_310'       => $result->code_310,
        'code_311'       => $result->code_311
      ];
      echo json_encode($data);
  }

  public function add_form_309_310_311()
  {
    $ACT = 'add';
    $this->_validate_form309_310_311($ACT);
    $data = array(
      'ticket_no'      => $this->input->post('ticket_no'),
        'ticket_status'  => $this->input->post('ticket_status'),
        'service'        => $this->input->post('service'),
        'segname'        => $this->input->post('segname'),
        'opentime'       => date('YmdHis', strtotime($this->input->post('opentime'))),
        'closetime'      => date('YmdHis', strtotime($this->input->post('closetime'))),
        'code_309'       => $this->input->post('code_309'),
        'code_310'       => $this->input->post('code_310'),
        'code_311'       => $this->input->post('code_311'),
      'datestamp'         => date('Ymd'),
      'status'            => 'cleaned'
    );
    $this->M_lkpbu->add_lkpbu309_310_311($data);
    echo json_encode(array("status" => TRUE ));
  }

  public function update_form_309_310_311()
  {
    $ACT = 'update';
    $this->_validate_form309_310_311($ACT);
    $data = array(
      'ticket_no'      => $this->input->post('ticket_no'),
        'ticket_status'  => $this->input->post('ticket_status'),
        'service'        => $this->input->post('service'),
        'segname'        => $this->input->post('segname'),
        'opentime'       => date('YmdHis', strtotime($this->input->post('opentime'))),
        'closetime'      => date('YmdHis', strtotime($this->input->post('closetime'))),
        'code_309'       => $this->input->post('code_309'),
        'code_310'       => $this->input->post('code_310'),
        'code_311'       => $this->input->post('code_311'),
      'datestamp'         => date('Ymd')
    );
     $this->M_lkpbu->update_lkpbu309_310_311(array('id' => $this->input->post('id')), $data);
     echo json_encode(array("status" => TRUE ));
  }

  public function delete_form_309_310_311($id)
  {
    $this->M_lkpbu->delete_lkpbu309_310_311($id);
    echo json_encode(array("status" => TRUE));
  }

  private function _validate_form309_310_311($event)
  {
    $data = array();
    $data['error_string'] = array();
    $data['inputerror'] = array();
    $data['status'] = TRUE;
    $actions = explode('#', $this->session->userdata('action'));
    $data['action'] = $actions;

    if(!in_array($event, $actions))
    {
        $data['inputerror'][] = 'sess_act';
        $data['error_string'][] = 'Error! You have no right to this action.';
        $data['status'] = FALSE;
    }
    if($this->input->post('ticket_no') == '')
    {
        $data['inputerror'][] = 'ticket_no';
        $data['error_string'][] = 'ticket_no is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('ticket_status') == '')
    {
        $data['inputerror'][] = 'ticket_status';
        $data['error_string'][] = 'Ticket Status is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('service') == '')
    {
        $data['inputerror'][] = 'service';
        $data['error_string'][] = 'Service is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('segname') == '')
    {
        $data['inputerror'][] = 'segname';
        $data['error_string'][] = 'Segname is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('opentime') == '')
    {
        $data['inputerror'][] = 'opentime';
        $data['error_string'][] = 'Opentime is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('closetime') == '')
    {
        $data['inputerror'][] = 'closetime';
        $data['error_string'][] = 'Close Time is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('code_309') == '')
    {
        $data['inputerror'][] = 'code_309';
        $data['error_string'][] = 'Code 309 is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('code_310') == '')
    {
        $data['inputerror'][] = 'code_310';
        $data['error_string'][] = 'Code 310 is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('code_311') == '')
    {
        $data['inputerror'][] = 'code_311';
        $data['error_string'][] = 'Code 311 is required';
        $data['status'] = FALSE;
    }
    if($data['status'] === FALSE)
    {
        echo json_encode($data);
        exit();
    }
  }
  
  public function  _validate_import_309_310_311()
  {
    $data = array();
    $data['error_string'] = array();
    $data['inputerror'] = array();
    $data['status'] = TRUE;

    if($_FILES['file_import']['name'] == '')
    {
      $data['inputerror'][] = 'file_import';
      $data['error_string'][] = 'File harus di isi';
      $data['status'] = FALSE;
    }
    if($data['status'] === FALSE)
    {
      echo json_encode($data);
      exit();
    }
  }
  public function import_309_310_311(){
    $this->_validate_import_309_310_311();
    $config['upload_path'] = './assets/';
    $config['allowed_types'] = 'xls|xlsx';
    $config['overwrite'] = true;
    $this->load->library('upload', $config);
    if($this->upload->do_upload('file_import')){
      $file = $this->upload->data();
      include APPPATH.'third_party/PHPExcel/PHPExcel.php';
      // if($file['file_ext'] == 'xls'){
      //   $excelreader = new PHPExcel_Reader_Excel5();
      // }else{
      // }
        $excelreader = new PHPExcel_Reader_Excel2007();

      // $excelreader = new PHPExcel_Reader_Excel5();

      $loadexcel   = $excelreader->load('assets/'.$file['file_name']);
      $sheet       = $loadexcel->getActiveSheet()->toArray(null, true, true ,true);

      $data = [];
      $data_update = [];

      $numrow = 1;
      foreach($sheet as $row){
        if($numrow > 1){
          $data[] = [
            'ticket_no'   =>   $row['A'],
            'ticket_status'   =>   $row['B'],
            'service'   =>   $row['C'],
            'segname'   =>   $row['D'],
            'opentime'   =>   date('YmdHis', strtotime($row['E'])),
            'closetime'   =>   date('YmdHis', strtotime($row['F'])),
            'code_309'   =>   $row['G'],
            'code_310'   =>   $row['H'],
            'code_311'   =>   $row['I'],
            'datestamp'   =>   date('Ymd'),
            'status'   =>   'cleaned'
          ];
        }
        $numrow++;
      }
      unlink('./assets/'.$file['file_name']);
      if($data){
        $this->db->insert_batch('t1clean_lkpbu_309_310_311', $data);
      }
    }
    echo json_encode(['status' => true, 'message' => 'Import data berhasil']);
  }
  // END :: FORM 309_310_311

  // START ::FORM 312
  public function form_312()
	{
    $data= [];
    $data['publication_type'] = $this->db->get('tlkpbu_312_publication_type')->result();
    $data['content'] = $this->load->view('clean/lkpbu/form_312', $data, TRUE);
		$this->load->view('layout', $data);
	}

	public function ajax_list_312()
  {
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));

    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
    
    $list = $this->M_lkpbu->Get_All312();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
				$row[] = '<a href="#" onclick="get_form_312('.$item->id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>
                  <a href="#" onclick="delete_form_312('.$item->id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
        $row[] = date('d/m/Y', strtotime($item->trx_date));
				$row[] = $item->publication;
        $row[] = $item->description;
        $data[] = $row;
    }

    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $this->M_lkpbu->count_all312(),
                    "recordsFiltered" => $this->M_lkpbu->count_filtered312(),
                    "data" => $data,
            );
    echo json_encode($output);
  }

  public function get_form_312($id)
  {
      $result = $this->M_lkpbu->get_lkpbu312($id);
      $data = [
        'id'                      => $result->id,
        'publication_code'              => $result->publication_code,
        'description'         => $result->description,
        'trx_date'                => date('Y-m-d', strtotime($result->trx_date))
      ];
      echo json_encode($data);
  }

  public function add_form_312()
  {
    $ACT = 'add';
    $this->_validate_form312($ACT);
    $data = array(
      'publication_code'      => $this->input->post('publication_code'),
      'description'     => $this->input->post('description'),
      'trx_date'          => date('Ymd', strtotime($this->input->post('trx_date'))),
      'datestamp'         => date('Ymd'),
      'status'            => 'cleaned'
    );
    $this->M_lkpbu->add_lkpbu312($data);
    echo json_encode(array("status" => TRUE ));
  }

  public function update_form_312()
  {
    $ACT = 'update';
    $this->_validate_form312($ACT);
    $data = array(
      'publication_code'      => $this->input->post('publication_code'),
      'description'     => $this->input->post('description'),
      'datestamp'         => date('Ymd'),
      'trx_date'          => date('Ymd', strtotime($this->input->post('trx_date')))
    );
     $this->M_lkpbu->update_lkpbu312(array('id' => $this->input->post('id')), $data);
     echo json_encode(array("status" => TRUE ));
  }

  public function delete_form_312($id)
  {
    $this->M_lkpbu->delete_lkpbu312($id);
    echo json_encode(array("status" => TRUE));
  }

  private function _validate_form312($event)
  {
    $data = array();
    $data['error_string'] = array();
    $data['inputerror'] = array();
    $data['status'] = TRUE;
    $actions = explode('#', $this->session->userdata('action'));
    $data['action'] = $actions;

    if(!in_array($event, $actions))
    {
        $data['inputerror'][] = 'sess_act';
        $data['error_string'][] = 'Error! You have no right to this action.';
        $data['status'] = FALSE;
    }
    if($this->input->post('trx_date') == '')
    {
        $data['inputerror'][] = 'trx_date';
        $data['error_string'][] = 'Trx Date is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('publication_code') == '')
    {
        $data['inputerror'][] = 'publication_code';
        $data['error_string'][] = 'Jenis Publikasi is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('description') == '')
    {
        $data['inputerror'][] = 'description';
        $data['error_string'][] = 'Description is required';
        $data['status'] = FALSE;
    }
    if($data['status'] === FALSE)
    {
        echo json_encode($data);
        exit();
    }
  }
  // END :: FORM 312

  // START :: FORM 313
  public function form_313()
	{
    $data= [];
    $data['publication_type'] = $this->db->get('tlkpbu_313_publication_type')->result();
    $data['content'] = $this->load->view('clean/lkpbu/form_313', $data, TRUE);
		$this->load->view('layout', $data);
	}

	public function ajax_list_313()
  {
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));

    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
    
    $list = $this->M_lkpbu->Get_All313();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
				$row[] = '<a href="#" onclick="get_form_313('.$item->id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>
                  <a href="#" onclick="delete_form_313('.$item->id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
        $row[] = date('d/m/Y', strtotime($item->trx_date));
				$row[] = $item->publication;
        $row[] = $item->description;
        $row[] = '<a href="'.$item->file_location.'" target="_blank">'.$item->file_location.'</a>';
        $data[] = $row;
    }

    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $this->M_lkpbu->count_all313(),
                    "recordsFiltered" => $this->M_lkpbu->count_filtered313(),
                    "data" => $data,
            );
    echo json_encode($output);
  }

  public function get_form_313($id)
  {
      $result = $this->M_lkpbu->get_lkpbu313($id);
      $data = [
        'id'                      => $result->id,
        'publication_code'              => $result->publication_code,
        'description'         => $result->description,
        'file_location'         => $result->file_location,
        'trx_date'                => date('Y-m-d', strtotime($result->trx_date))
      ];
      echo json_encode($data);
  }

  public function add_form_313()
  {
    $ACT = 'add';
    $this->_validate_form313($ACT);
    $file_location = $this->_do_upload('file_location');
    $data = array(
      'publication_code'      => $this->input->post('publication_code'),
      'description'     => $this->input->post('description'),
      'trx_date'          => date('Ymd', strtotime($this->input->post('trx_date'))),
      'datestamp'         => date('Ymd'),
      'status'            => 'cleaned',
      'file_location'     => $file_location
    );
    $this->M_lkpbu->add_lkpbu313($data);
    echo json_encode(array("status" => TRUE ));
  }

  public function update_form_313()
  {
    $ACT = 'update';
    $id = $this->input->post('id');
    $this->_validate_form313($ACT);
    $data = array(
      'publication_code'      => $this->input->post('publication_code'),
      'description'     => $this->input->post('description'),
      'datestamp'         => date('Ymd'),
      'trx_date'          => date('Ymd', strtotime($this->input->post('trx_date')))
    );
    if($_FILES['file_location']['name']){
      $data['file_location'] = $this->_do_upload('file_location');
    }
  
      $this->M_lkpbu->update_lkpbu313(array('id' => $id), $data);
      echo json_encode(array("status" => TRUE ));
  }

  public function delete_form_313($id)
  { 
    $this->M_lkpbu->delete_lkpbu313($id);
    echo json_encode(array("status" => TRUE));
  }

  private function _validate_form313($event)
  {
    $data = array();
    $data['error_string'] = array();
    $data['inputerror'] = array();
    $data['status'] = TRUE;
    $actions = explode('#', $this->session->userdata('action'));
    $data['action'] = $actions;

    if(!in_array($event, $actions))
    {
        $data['inputerror'][] = 'sess_act';
        $data['error_string'][] = 'Error! You have no right to this action.';
        $data['status'] = FALSE;
    }
    if($this->input->post('trx_date') == '')
    {
        $data['inputerror'][] = 'trx_date';
        $data['error_string'][] = 'Trx Date is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('publication_code') == '')
    {
        $data['inputerror'][] = 'publication_code';
        $data['error_string'][] = 'Jenis Publikasi is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('description') == '')
    {
        $data['inputerror'][] = 'description';
        $data['error_string'][] = 'Description is required';
        $data['status'] = FALSE;
    }
  
    if($data['status'] === FALSE)
    {
        echo json_encode($data);
        exit();
    }
  }
  private function _do_upload($name)
  {
      $config['upload_path']          = './assets/uploads/';
      $config['allowed_types']        = 'gif|jpg|png|jpeg|pdf';
      $config['max_size']             = 2048;
      $config['file_name']            = round(microtime(true) * 1000);
      $this->load->library('upload', $config);
      $this->upload->initialize($config);
      if (!$this->upload->do_upload($name)) {
          $data['inputerror'][] = $name;
          $data['error_string'][] = 'Upload error: ' . $this->upload->display_errors('', '');
          $data['status'] = FALSE;
          echo json_encode($data);
          exit();
      }
      $file = $this->upload->data('file_name');
      return base_url('assets/uploads/') . $file ;
  }

  // // START :: QRIS
  public function sys_availability()
  {

    $data = [];
    $data['content'] = $this->load->view('clean/sys_availability', $data, TRUE);
    $this->load->view('layout', $data);
  }

  // AJAX PIC
  public function ajax_availability_pic()
  { 
    $list = $this->M_sys_availability->get_datatables_pic();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
				$row[] = '<a href="#" onclick="get_form_pic('.$item->id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>
                  <a href="#" onclick="delete_form_pic('.$item->id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
				$row[] = $item->name;
        $row[] = $item->division;
        $row[] = $item->email;
        $row[] = $item->phone_number;
        $data[] = $row;
    }

    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $this->M_sys_availability->count_all_pic(),
                    "recordsFiltered" => $this->M_sys_availability->count_filtered_pic(),
                    "data" => $data,
            );
    echo json_encode($output);
  }
  public function get_availability_pic($id)
  {
      $result = $this->M_sys_availability->get_availability_pic($id);
      echo json_encode($result);
  }
  

    public function add_availability_pic()
    {
      $ACT = 'add';
      $this->_validate_avalability_pic($ACT);
      $data = array(
        'name'           => $this->input->post('name'),
        'division'       => $this->input->post('division'),
        'email'          => $this->input->post('email'),
        'phone_number'   => $this->input->post('phone_number')
      );
      $this->M_sys_availability->add_availability_pic($data);
      echo json_encode(array("status" => TRUE ));
    }

    public function update_availability_pic()
    {
      $ACT = 'update';
      $this->_validate_avalability_pic($ACT);
      $data = array(
        'name'           => $this->input->post('name'),
        'division'       => $this->input->post('division'),
        'email'          => $this->input->post('email'),
        'phone_number'   => $this->input->post('phone_number')
      );
      $this->M_sys_availability->update_availability_pic(array('id' => $this->input->post('id')), $data);
      echo json_encode(array("status" => TRUE ));
    }

    public function delete_availability_pic($id)
    {
      $this->M_sys_availability->delete_availability_pic($id);
      echo json_encode(array("status" => TRUE));
    }

    private function _validate_avalability_pic($event)
    {
      $data = array();
      $data['error_string'] = array();
      $data['inputerror'] = array();
      $data['status'] = TRUE;
      $actions = explode('#', $this->session->userdata('action'));
      $data['action'] = $actions;

      if(!in_array($event, $actions))
      {
          $data['inputerror'][] = 'sess_act';
          $data['error_string'][] = 'Error! You have no right to this action.';
          $data['status'] = FALSE;
      }
      if($this->input->post('name') == '')
      {
          $data['inputerror'][] = 'name';
          $data['error_string'][] = 'name is required';
          $data['status'] = FALSE;
      }
      if($this->input->post('division') == '')
      {
          $data['inputerror'][] = 'division';
          $data['error_string'][] = 'Division is required';
          $data['status'] = FALSE;
      }
      if($this->input->post('email') == '')
      {
          $data['inputerror'][] = 'email';
          $data['error_string'][] = 'email is required';
          $data['status'] = FALSE;
      }
      if($this->input->post('phone_number') == '')
      {
          $data['inputerror'][] = 'phone_number';
          $data['error_string'][] = 'Phone Number is required';
          $data['status'] = FALSE;
      }
    
      if($data['status'] === FALSE)
      {
          echo json_encode($data);
          exit();
      }
    }
  
    public function add_availability_system()
    {
      $ACT = 'add';
      $this->_validate_avalability_system($ACT);
      $data = array(
        'id_service'           => $this->input->post('id_service'),
        'id_pic'       => $this->input->post('id_pic'),
        'threshold'          => $this->input->post('threshold'),
        'availibility'          => $this->input->post('availibility'),
        'notes'          => $this->input->post('notes'),
        'datestamp'          => date('Ymd'),
        'status'          => 'cleaned'
      );
      $id_trx = $this->M_sys_availability->add_availability_system($data);
      $this->db->insert('tsysavailability_problem', [
        'id_trx'    => $id_trx,
        'problem_category'    => $this->input->post('problem_category'),
        'problem_datetime'    => $this->input->post('problem_datetime'),
        'result'    => $this->input->post('result'),
        'repair'    => $this->input->post('repair'),
        'repair_notes'    => $this->input->post('repair_notes'),
        'repair_duration'    => $this->input->post('repair_duration'),
        'repair_status'    => $this->input->post('repair_status'),
        'severity_level'    => $this->input->post('severity_level'),
        'problem_impact'    => $this->input->post('problem_impact'),
        'notes'    => $this->input->post('notes_problem')
      ]);
      echo json_encode(array("status" => TRUE ));
    }
    public function delete_availability_system($id)
    {
      $this->M_sys_availability->delete_availability_system($id);
      $this->db->delete('tsysavailability_problem', ['id_trx' => $id]);
      echo json_encode(array("status" => TRUE));
    }


    public function update_availability_system()
    {
      $ACT = 'update';
      $this->_validate_avalability_system($ACT);
      $threshold = $this->input->post('threshold');
      $availibility = $this->input->post('availibility');
      $data = array(
        'id_service'           => $this->input->post('id_service'),
        'id_pic'       => $this->input->post('id_pic'),
        'threshold'          => $this->input->post('threshold'),
        'availibility'          => $this->input->post('availibility'),
        'notes'          => $this->input->post('notes'),
        'datestamp'          => date('Ymd'),
        'status'          => 'cleaned'
      );
      $id_trx = $this->M_sys_availability->update_availability_system(array('id' => $this->input->post('id_system')), $data);
      if($threshold > 0 && $availibility > 0 ){
        if($threshold > $availibility){
          $cek_system = $this->db->get('tsysavailability_problem', ['id_trx' => $this->input->post('id_system')])->num_rows();
          if($cek_system > 0 ){
            $this->db->update('tsysavailability_problem', [
              'id_trx'    => $id_trx,
              'problem_category'    => $this->input->post('problem_category'),
              'problem_datetime'    => $this->input->post('problem_datetime'),
              'result'    => $this->input->post('result'),
              'repair'    => $this->input->post('repair'),
              'repair_notes'    => $this->input->post('repair_notes'),
              'repair_duration'    => $this->input->post('repair_duration'),
              'repair_status'    => $this->input->post('repair_status'),
              'severity_level'    => $this->input->post('severity_level'),
              'problem_impact'    => $this->input->post('problem_impact'),
              'notes'    => $this->input->post('notes_problem')
            ], ['id_trx' => $this->input->post('id_system')]);
          }else{
            $this->db->insert('tsysavailability_problem', [
              'id_trx'    => $this->input->post('id_system'),
              'problem_category'    => $this->input->post('problem_category'),
              'problem_datetime'    => $this->input->post('problem_datetime'),
              'result'    => $this->input->post('result'),
              'repair'    => $this->input->post('repair'),
              'repair_notes'    => $this->input->post('repair_notes'),
              'repair_duration'    => $this->input->post('repair_duration'),
              'repair_status'    => $this->input->post('repair_status'),
              'severity_level'    => $this->input->post('severity_level'),
              'problem_impact'    => $this->input->post('problem_impact'),
              'notes'    => $this->input->post('notes_problem')
            ]);
          }
        }
      }
      echo json_encode(array("status" => TRUE ));
    }

    public function ajax_availability_system()
  { 
    $this->db->where('status', 'cleaned');
    
    $start_date = date('Ymd', strtotime(substr($_POST['daterange'], 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($_POST['daterange'], 13, 23)));

    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);
    $list = $this->M_sys_availability->get_datatables_system();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
				$row[] = '<a href="#" onclick="get_form_system('.$item->id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>
                  <a href="#" onclick="delete_form_system('.$item->id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
				$row[] = $item->service . ' - '. $item->infrastructure;
        $row[] = $item->name;
        $row[] = $item->threshold;
        $row[] = $item->availibility;
        $row[] = $item->notes;
        $row[] = date('d/M/Y', strtotime($item->datestamp));
        $data[] = $row;
    }
    $this->db->where('status', 'cleaned');
    $recordsTotal = $this->M_sys_availability->count_all_system();
    $this->db->where('status', 'cleaned');
    $recordsFiltered = $this->M_sys_availability->count_filtered_system();
    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $recordsTotal,
                    "recordsFiltered" => $recordsFiltered,
                    "data" => $data,
            );
    echo json_encode($output);
  }
  public function get_availability_system($id)
  {
      $system = $this->M_sys_availability->get_availability_system($id);
      $data['problem'] = $this->db->get_where('tsysavailability_problem', ['id_trx' => $system->id])->row();
      $data['system'] = $system;
      echo json_encode($data);
  }
    private function _validate_avalability_system($event)
    {
      $data = array();
      $data['error_string'] = array();
      $data['inputerror'] = array();
      $data['status'] = TRUE;
      $actions = explode('#', $this->session->userdata('action'));
      $data['action'] = $actions;

      $threshold = $this->input->post('threshold');
      $availibility = $this->input->post('availibility');
      if(!in_array($event, $actions))
      {
          $data['inputerror'][] = 'sess_act';
          $data['error_string'][] = 'Error! You have no right to this action.';
          $data['status'] = FALSE;
      }
      if($this->input->post('id_service') == '')
      {
          $data['inputerror'][] = 'id_service';
          $data['error_string'][] = 'Service is required';
          $data['status'] = FALSE;
      }
      if($this->input->post('id_pic') == '')
      {
          $data['inputerror'][] = 'id_pic';
          $data['error_string'][] = 'PIC is required';
          $data['status'] = FALSE;
      }
      if($threshold == '')
      {
          $data['inputerror'][] = 'threshold';
          $data['error_string'][] = 'Threshold is required';
          $data['status'] = FALSE;
      }
      if($availibility == '')
      {
          $data['inputerror'][] = 'availibility';
          $data['error_string'][] = 'availibility is required';
          $data['status'] = FALSE;
      }
      if($threshold > $availibility){
        if($this->input->post('problem_category') == '')
        {
            $data['inputerror'][] = 'problem_category';
            $data['error_string'][] = 'Kategori Gangguan is required';
            $data['status'] = FALSE;
        } 
        if($this->input->post('problem_datetime') == '')
        {
            $data['inputerror'][] = 'problem_datetime';
            $data['error_string'][] = 'Waktu Kejadian is required';
            $data['status'] = FALSE;
        }
        if($this->input->post('result') == '')
        {
            $data['inputerror'][] = 'result';
            $data['error_string'][] = 'Hasil Investigasi Permasalahan is required';
            $data['status'] = FALSE;
        }
        if($this->input->post('repair') == '')
        {
            $data['inputerror'][] = 'repair';
            $data['error_string'][] = 'Upaya Perbaikan is required';
            $data['status'] = FALSE;
        }
        if($this->input->post('repair_notes') == '')
        {
            $data['inputerror'][] = 'repair_notes';
            $data['error_string'][] = 'Keterangan Upaya is required';
            $data['status'] = FALSE;
        }
        if($this->input->post('repair_duration') == '')
        {
            $data['inputerror'][] = 'repair_duration';
            $data['error_string'][] = 'Durasi Penyelesaian is required';
            $data['status'] = FALSE;
        }
        if($this->input->post('repair_status') == '')
        {
            $data['inputerror'][] = 'repair_status';
            $data['error_string'][] = 'Status Penyelesaian is required';
            $data['status'] = FALSE;
        }
        if($this->input->post('severity_level') == '')
        {
            $data['inputerror'][] = 'severity_level';
            $data['error_string'][] = 'Severity Level is required';
            $data['status'] = FALSE;
        }
        if($this->input->post('problem_impact') == '')
        {
            $data['inputerror'][] = 'problem_impact';
            $data['error_string'][] = 'Dampak Insiden / Gangguan is required';
            $data['status'] = FALSE;
        }
        if($this->input->post('notes_problem') == '')
        {
            $data['inputerror'][] = 'notes_problem';
            $data['error_string'][] = 'Notes is required';
            $data['status'] = FALSE;
        }
      }
    
      if($data['status'] === FALSE)
      {
          echo json_encode($data);
          exit();
      }
    }

  // END :: SYSTEM AVAILABILITY 
}