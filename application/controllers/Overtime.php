<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Overtime extends CI_Controller {

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  =======   Contact Develope  : anggifitra141@gmail.com    ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
	{
		parent::__construct();
    $this->load->model('M_overtime');
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
    $data['content'] = $this->load->view('overtime/overtime', $data, TRUE);
		$this->load->view('layout', $data);
	}

	public function ajax_list()
  {
    $list = $this->M_overtime->Get_All();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
				if($this->session->userdata('role') == "admin"){
					$row[] = '<a href="#" onclick="get_overtime('.$item->overtime_id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>&nbsp;&nbsp;<a href="#" onclick="delete_overtime('.$item->overtime_id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
				}else{
					$row[] = "No Action";
				}
				$row[] = $item->overtime_type;
        $row[] = $item->overtime_hours;
        $row[] = $item->description;
        $data[] = $row;
    }

    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $this->M_overtime->count_all(),
                    "recordsFiltered" => $this->M_overtime->count_filtered(),
                    "data" => $data,
            );
    echo json_encode($output);
  }

  public function get_overtime($overtime_id)
  {
      $data = $this->M_overtime->get_overtime($overtime_id);
      echo json_encode($data);
  }

  public function add_overtime()
  {
    $this->_validate();
    $data = array(
      'overtime_type'    => $this->input->post('overtime_type'),
      'overtime_hours'   => $this->input->post('overtime_hours'),
      'description'      => $this->input->post('description')
    );
    $this->M_overtime->add_overtime($data);
    echo json_encode(array("status" => TRUE ));
  }

  public function update_overtime()
  {
    $this->_validate();
		$data = array(
      'overtime_type'    => $this->input->post('overtime_type'),
      'overtime_hours'   => $this->input->post('overtime_hours'),
      'description'      => $this->input->post('description')
    );
     $this->M_overtime->update_overtime(array('overtime_id' => $this->input->post('overtime_id')), $data);
     echo json_encode(array("status" => TRUE ));
  }

  public function delete_overtime($overtime_id)
  {
    $this->M_overtime->delete_overtime($overtime_id);
    echo json_encode(array("status" => TRUE));
  }

  private function _validate()
  {
      $data = array();
      $data['error_string'] = array();
      $data['inputerror'] = array();
      $data['status'] = TRUE;

      if($this->input->post('overtime_type') == '')
      {
          $data['inputerror'][] = 'overtime_type';
          $data['error_string'][] = 'Overtime type is required';
          $data['status'] = FALSE;
      }

      if($this->input->post('overtime_hours') == '')
      {
          $data['inputerror'][] = 'overtime_hours';
          $data['error_string'][] = 'Overtime hours is required';
          $data['status'] = FALSE;
      }
      if($data['status'] === FALSE)
      {
          echo json_encode($data);
          exit();
      }
  }
}
