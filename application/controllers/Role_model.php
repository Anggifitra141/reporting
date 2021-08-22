<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Role_model extends CI_Controller {

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
	{
		parent::__construct();
    $this->load->model(['M_role_model']);
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
    $data['content'] = $this->load->view('master/role_model', $data, TRUE);
		$this->load->view('layout', $data);
	}

	public function ajax_list()
  {
    $list = $this->M_role_model->Get_All();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
				$row[] = '<a href="#" onclick="get_role_model('.$item->id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>
                  <a href="#" onclick="delete_role_model('.$item->id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
				$row[] = $item->report_code;
        $row[] = $item->table;
        $row[] = $item->field;
        $row[] = $item->from;
        $row[] = $item->to;
        $data[] = $row;
    }

    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $this->M_role_model->count_all(),
                    "recordsFiltered" => $this->M_role_model->count_filtered(),
                    "data" => $data,
            );
    echo json_encode($output);
  }

  public function get_role_model($id)
  {
      $data = $this->M_role_model->get_role_model($id);
      echo json_encode($data);
  }

  public function add_role_model()
  {
    $ACT = 'add';
    $this->_validate($ACT);
    $data = array(
      'report_code'      => $this->input->post('report_code'),
      'table'            => $this->input->post('table'),
      'field'            => $this->input->post('field'),
      'from'             => $this->input->post('from'),
      'to'               => $this->input->post('to')
    );
    $this->M_role_model->add_role_model($data);
    echo json_encode(array("status" => TRUE ));
  }

  public function update_role_model()
  {
    $ACT = 'update';
    $this->_validate($ACT);
    $data = array(
      'report_code'      => $this->input->post('report_code'),
      'table'            => $this->input->post('table'),
      'field'            => $this->input->post('field'),
      'from'             => $this->input->post('from'),
      'to'               => $this->input->post('to')
    );
     $this->M_role_model->update_role_model(array('id' => $this->input->post('id')), $data);
     echo json_encode(array("status" => TRUE ));
  }

  public function delete_role_model($id)
  {
    $this->M_role_model->delete_role_model($id);
    echo json_encode(array("status" => TRUE));
  }

  private function _validate($event)
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
    if($this->input->post('report_code') == '')
    {
        $data['inputerror'][] = 'report_code';
        $data['error_string'][] = 'report code is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('table') == '')
    {
        $data['inputerror'][] = 'table';
        $data['error_string'][] = 'table is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('field') == '')
    {
        $data['inputerror'][] = 'field';
        $data['error_string'][] = 'field is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('from') == '')
    {
        $data['inputerror'][] = 'from';
        $data['error_string'][] = 'from is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('to') == '')
    {
        $data['inputerror'][] = 'to';
        $data['error_string'][] = 'to is required';
        $data['status'] = FALSE;
    }
    if($data['status'] === FALSE)
    {
        echo json_encode($data);
        exit();
    }
  }

}
