<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Shift extends CI_Controller {

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  =======   Contact Develope  : anggifitra141@gmail.com    ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
	{
		parent::__construct();
    $this->load->model('M_shift');
		if(!$this->session->userdata('logged_in'))
    {
      $data=array();
			$data['msg'] = "Maaf Anda tidak punya akses ke halaman ini !";
			$content = $this->load->view('errors/html/error_sessi', $data, TRUE);
			exit($content);
    }
	}

	public function index()
	{
    $data= [];
    $data['content'] = $this->load->view('shift/shift', $data, TRUE);
		$this->load->view('layout', $data);
	}

	public function ajax_list()
  {
    $list = $this->M_shift->Get_All();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
				if($this->session->userdata('role') == "admin"){
					$row[] = '<a href="#" onclick="get_shift('.$item->shift_id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>&nbsp;&nbsp;<a href="#" onclick="delete_shift('.$item->shift_id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
				}else{
					$row[] = "No Action";
				}
				$row[] = $item->shift_name;
        $row[] = $item->hour_production;
        $row[] = $item->start;
        $row[] = $item->end;
        $data[] = $row;
    }

    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $this->M_shift->count_all(),
                    "recordsFiltered" => $this->M_shift->count_filtered(),
                    "data" => $data,
            );
    echo json_encode($output);
  }

  public function get_shift($shift_id)
  {
      $data = $this->M_shift->get_shift($shift_id);
      echo json_encode($data);
  }

  public function add_shift()
  {
    $this->_validate();
    $data = array(
      'shift_name'        => $this->input->post('shift_name'),
      'hour_production'   => $this->input->post('hour_production'),
      'start'             => $this->input->post('start'),
      'end'               => $this->input->post('end'),
    );
    $this->M_shift->add_shift($data);
    echo json_encode(array("status" => TRUE ));
  }

  public function update_shift()
  {
    $this->_validate();
		$data = array(
      'shift_name'        => $this->input->post('shift_name'),
      'hour_production'   => $this->input->post('hour_production'),
      'start'             => $this->input->post('start'),
      'end'               => $this->input->post('end'),
    );
     $this->M_shift->update_shift(array('shift_id' => $this->input->post('shift_id')), $data);
     echo json_encode(array("status" => TRUE ));
  }

  public function delete_shift($shift_id)
  {
    $this->M_shift->delete_shift($shift_id);
    echo json_encode(array("status" => TRUE));
  }

  private function _validate()
  {
      $data = array();
      $data['error_string'] = array();
      $data['inputerror'] = array();
      $data['status'] = TRUE;

      if($this->input->post('shift_name') == '')
      {
          $data['inputerror'][] = 'shift_name';
          $data['error_string'][] = 'Shift name is required';
          $data['status'] = FALSE;
      }

      if($this->input->post('start') == '')
      {
          $data['inputerror'][] = 'start';
          $data['error_string'][] = 'Start is required';
          $data['status'] = FALSE;
      }

      if($this->input->post('end') == '')
      {
          $data['inputerror'][] = 'end';
          $data['error_string'][] = 'End of Birth is required';
          $data['status'] = FALSE;
      }
      if($data['status'] === FALSE)
      {
          echo json_encode($data);
          exit();
      }
  }

}
