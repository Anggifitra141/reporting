<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Regulatory extends CI_Controller {

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
	{
		parent::__construct();
    $this->load->model(['M_raw_data']);
    if(!$this->session->userdata('logged_in'))
    {
      $data=array();
			$data['msg'] = "Maaf Anda tidak punya akses ke halaman ini !";
			$content = $this->load->view('errors/html/error_sessi', $data, TRUE);
			exit($content);
    }
	}

	public function upload_source()
	{
    $data= [];
    $data['content'] = $this->load->view('regulatory/upload_source', $data, TRUE);
		$this->load->view('layout', $data);
	}

  public function raw_data()
	{
    $data= [];
    $data['content'] = $this->load->view('regulatory/raw_data', $data, TRUE);
		$this->load->view('layout', $data);
	}

  public function data_clean()
	{
    $data= [];
    $data['content'] = $this->load->view('regulatory/data_clean', $data, TRUE);
		$this->load->view('layout', $data);
	}



  // START :: UPLOAD SOURCE
  public function import_source(){
    // $this->_validate_import();
    $config['upload_path'] = './assets/';
    $config['allowed_types'] = 'xls|xlsx';
    $config['overwrite'] = true;
    $this->load->library('upload', $config);
    if($this->upload->do_upload('file_import')){
      $file = $this->upload->data();
      include APPPATH.'third_party/PHPExcel/PHPExcel.php';
      $excelreader = new PHPExcel_Reader_Excel2007();
      $loadexcel   = $excelreader->load('assets/'.$file['file_name']);
      $sheet       = $loadexcel->getActiveSheet()->toArray(null, true, true ,true);

      $data = [];
      $numrow = 1;
      foreach($sheet as $row){
        if($numrow > 1){
          $data[] = [
              'trxdate'         => $row['A'],
              'sendercountry'   => $row['B'],
              'sendercity'      => $row['C'],
              'receiptcountry'  => $row['D'],
              'receiptcity'     => $row['E'],
              'sendername'      => $row['F'],
              'receiptname'     => $row['G'],
              'senderphone'     => $row['H'],
              'receiptphone'    => $row['I'],
              'senderwn'        => $row['J'],
              'receiptwn'       => $row['K'],
              'description'     => $row['L'],
              'nominal'         => $row['M']
          ];
        }
        $numrow++;
      }
      unlink('./assets/'.$file['file_name']);
      if($data){
        $this->db->insert_batch('source', $data);
      }
     
    }
    echo json_encode(['status' => true, 'message' => 'Import data berhasil ']);
  }
  // END :: UPLOAD SOURCE

  // START :: AJAX RAW DATA
  public function ajax_list_raw_data()
   {
     $list = $this->M_raw_data->get_datatables();
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
               "recordsTotal" => $this->M_raw_data->count_all(),
               "recordsFiltered" => $this->M_raw_data->count_filtered(),
               "data" => $data,
             );
     echo json_encode($output);
   }
  // END :: AJAX RAW DATA

  

 
}
