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
    $this->load->model(['M_tltdbb_clean', 'M_tltdbb_clean', 'M_danafloat_clean', 'M_sipesat_clean', 'M_ltkl_clean']);
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
    $output = array(
              "draw" => $_POST['draw'],
              "recordsTotal" => $this->M_ltkl_clean->count_all(),
              "recordsFiltered" => $this->M_ltkl_clean->count_filtered(),
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
}