<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_group extends CI_Controller {

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
	{
		parent::__construct();
    $this->load->model('M_user_group');
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
    $data['content'] = $this->load->view('user/user_group', $data, TRUE);
		$this->load->view('layout', $data);
	}

	public function ajax_list()
  {
    $list = $this->M_user_group->Get_All();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
				$row[] = '<a href="#" onclick="get_user_group('.$item->id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>
                  <a href="#" onclick="delete_user_group('.$item->id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
				$row[] = $item->group_name;
        $row[] = $item->access;
        $row[] = $item->action;
        $data[] = $row;
    }

    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $this->M_user_group->count_all(),
                    "recordsFiltered" => $this->M_user_group->count_filtered(),
                    "data" => $data,
            );
    echo json_encode($output);
  }

  public function get_user_group($id)
  {
      $data = $this->M_user_group->get_user_group($id);
      echo json_encode($data);
  }

  public function add_user_group()
  {
    $ACT = 'add';
    $this->_validate($ACT);
    $data = array(
      'group_name'         => $this->input->post('group_name'),
      'action'            => implode('#', $this->input->post('action')),
      'access'            => implode('#', $this->input->post('access')),
    );
    $this->M_user_group->add_user_group($data);
    echo json_encode(array("status" => TRUE ));
  }

  public function update_user_group()
  {
    $ACT = 'update';
    $this->_validate($ACT);
		$data = array(
      'group_name'        => $this->input->post('group_name'),
      'action'            => implode('#', $this->input->post('action')),
      'access'            => implode('#', $this->input->post('access')),
    );
     $this->M_user_group->update_user_group(array('id' => $this->input->post('id')), $data);
     echo json_encode(array("status" => TRUE ));
  }

  public function delete_user_group($id)
  {
    $this->M_user_group->delete_user_group($id);
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

    if($this->input->post('group_name') == '')
    {
        $data['inputerror'][] = 'group_name';
        $data['error_string'][] = 'Group Name is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('access') == '')
    {
        $data['inputerror'][] = 'access';
        $data['error_string'][] = 'Access is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('action') == '')
    {
        $data['inputerror'][] = 'action';
        $data['error_string'][] = 'Action is required';
        $data['status'] = FALSE;
    }

    if($data['status'] === FALSE)
    {
        echo json_encode($data);
        exit();
    }
  }

}
