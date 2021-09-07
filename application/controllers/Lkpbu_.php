<?php

  class Lkpbu extends CI_Controller{

    
  public function __construct()
	{
		parent::__construct();
    $this->load->model(['M_lkpbu']);
		if(!$this->session->userdata('logged_in'))
    {
      $data=array();
			$data['msg'] = "Maaf Anda tidak punya akses ke halaman ini !";
			$content = $this->load->view('errors/html/error_sessi', $data, TRUE);
			exit($content);
    }
	}


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
  
}