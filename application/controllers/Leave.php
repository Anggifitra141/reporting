<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Leave extends CI_Controller {

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  =======   Contact Develope  : anggifitra141@gmail.com    ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
	{
		parent::__construct();
    $this->load->model('M_leave');
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
    $data['content'] = $this->load->view('leave/leave', $data, TRUE);
		$this->load->view('layout', $data);
	}

	public function ajax_list()
  {
    $list = $this->M_leave->Get_All();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
				if($this->session->userdata('role') == "admin"){
					$row[] = '<a href="#" onclick="get_leave('.$item->leave_id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>&nbsp;&nbsp;<a href="#" onclick="delete_leave('.$item->leave_id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
				}else{
					$row[] = "No Action";
				}
				$row[] = $item->leave_type;
        $row[] = $item->description;
        $row[] = $item->number_of_days;
        $data[] = $row;
    }

    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $this->M_leave->count_all(),
                    "recordsFiltered" => $this->M_leave->count_filtered(),
                    "data" => $data,
            );
    echo json_encode($output);
  }

  public function get_leave($leave_id)
  {
      $data = $this->M_leave->get_leave($leave_id);
      echo json_encode($data);
  }

  public function add_leave()
  {
    $this->_validate();
    $data = array(
      'leave_type' => $this->input->post('leave_type'),
      'description' => $this->input->post('description'),
      'number_of_days' => $this->input->post('number_of_days')
    );
    $this->M_leave->add_leave($data);
    echo json_encode(array("status" => TRUE ));
  }

  public function update_leave()
  {
    $this->_validate();
		$data = array(
			'leave_type' => $this->input->post('leave_type'),
      'description' => $this->input->post('description'),
      'number_of_days' => $this->input->post('number_of_days'),
		);
     $this->M_leave->update_leave(array('leave_id' => $this->input->post('leave_id')), $data);
     echo json_encode(array("status" => TRUE ));
  }

  public function delete_leave($leave_id)
  {
    $this->M_leave->delete_leave($leave_id);
    echo json_encode(array("status" => TRUE));
  }
  private function _validate()
  {
    $data = array();
    $data['error_string'] = array();
    $data['inputerror'] = array();
    $data['status'] = TRUE;

    if($this->input->post('leave_type') == '')
    {
      $data['inputerror'][] = 'leave_type';
      $data['error_string'][] = 'Leave type is required';
      $data['status'] = FALSE;
    }

    if($this->input->post('number_of_days') == '')
    {
      $data['inputerror'][] = 'number_of_days';
      $data['error_string'][] = 'Number Of Days is required';
      $data['status'] = FALSE;
    }
    if($data['status'] === FALSE)
    {
      echo json_encode($data);
      exit();
    }
  }

}
