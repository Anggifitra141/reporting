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
    $this->load->model(['M_raw_data']);
    $this->load->model(['M_clean_data', 'M_campaign']);
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
    $data['campaign'] = $this->M_campaign->get(['is_active' => 'Y'])->result();
    $data['content'] = $this->load->view('source/upload_source', $data, TRUE);
		$this->load->view('layout', $data);
	}

  public function raw_data()
	{
    $data= [];
    $data['content'] = $this->load->view('source/raw_data', $data, TRUE);
		$this->load->view('layout', $data);
	}

  public function data_clean()
	{
    $data= [];
    $data['content'] = $this->load->view('source/clean_data', $data, TRUE);
		$this->load->view('layout', $data);
	}

  public function report()
  {
    $data= [];
    $data['content'] = $this->load->view('source/report', $data, TRUE);
    $this->load->view('layout', $data);
  }

  public function archive()
  {
    $data= [];
    $data['content'] = $this->load->view('source/archive', $data, TRUE);
    $this->load->view('layout', $data);
  }

  public function user_activity()
  {
    $data= [];
    $data['content'] = $this->load->view('source/user_activity', $data, TRUE);
    $this->load->view('layout', $data);
  }

  // START :: UPLOAD SOURCE
  public function import_source(){
    $this->_validate_import_source();
    $config['upload_path'] = './assets/';
    $config['allowed_types'] = 'xls|xlsx|csv';
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
              'campaign'        => $this->input->post('campaign'),
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
              'nominal'         => $row['M'],
              'datestamp'=> date("Ymd"),
							'status'=> "new"

          ];
        }
        $numrow++;
      }
      unlink('./assets/'.$file['file_name']);
      if($data){
        $this->db->insert_batch('tdatasource1', $data);
      }
     
    }
    echo json_encode(['status' => true, 'message' => count($data) .' Data Has Been Uploaded']);
  }

  private function _validate_import_source()
  {
    $data = array();
    $data['error_string'] = array();
    $data['inputerror'] = array();
    $data['status'] = TRUE;

    if($_FILES['file_import']['name'] == '')
    {
      $data['inputerror'][] = 'file_import';
      $data['error_string'][] = 'File Is Required';
      $data['status'] = FALSE;
    }
    if($_POST['campaign'] == '')
    {
      $data['inputerror'][] = 'campaign';
      $data['error_string'][] = 'Camapaign Is Required';
      $data['status'] = FALSE;
    }
    if($data['status'] === FALSE)
    {
      echo json_encode($data);
      exit();
    }
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
