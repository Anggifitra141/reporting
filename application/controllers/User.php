<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller {

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
	{
		parent::__construct();
    $this->load->model(['M_user', 'M_user_group']);
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
    $data['user_group'] = $this->M_user_group->get()->result();
    $data['content'] = $this->load->view('master/user', $data, TRUE);
		$this->load->view('layout', $data);
	}

	public function ajax_list()
  {
    $list = $this->M_user->Get_All();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
				$row[] = '<a href="#" onclick="get_user('.$item->user_id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>
                  <a href="#" onclick="delete_user('.$item->user_id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
				$row[] = $item->username;
        $row[] = $item->fullname;
        $row[] = $item->user_group;
        $row[] = $this->lib->date_indo($item->activation_date);
        if($item->status == 'active'){
          $status = '<span class="badge badge-primary">Active</span>';
        }else{
          $status = '<span class="badge badge-danger">No Active</span>';
        }
        $row[] = $status;
        $data[] = $row;
    }

    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $this->M_user->count_all(),
                    "recordsFiltered" => $this->M_user->count_filtered(),
                    "data" => $data,
            );
    echo json_encode($output);
  }

  public function get_user($user_id)
  {
      $data = $this->M_user->get_user($user_id);
      echo json_encode($data);
  }

  public function add_user()
  {
    $ACT = 'add';
    $this->_validate($ACT);
    $data = array(
      'username'              => $this->input->post('username'),
      'password'              => PASSWORD_HASH($this->input->post('password'), PASSWORD_DEFAULT),
      'fullname'              => $this->input->post('fullname'),
      'user_group'            => $this->input->post('user_group'),
      'activation_date'       => date('Y-m-d'),
      'status'                => $this->input->post('status')
    );
    $this->M_user->add_user($data);
    echo json_encode(array("status" => TRUE ));
  }

  public function update_user()
  {
    $ACT = 'update';
    $this->_validate($ACT);
		$data = array(
      'username'              => $this->input->post('username'),
      'fullname'              => $this->input->post('fullname'),
      'user_group'            => $this->input->post('user_group'),
      'activation_date'       => date('Y-m-d'),
      'status'                => $this->input->post('status')
    );
    if($this->input->post('password')){
      $data['password'] = PASSWORD_HASH($this->input->post('password'), PASSWORD_DEFAULT);
    }
     $this->M_user->update_user(array('user_id' => $this->input->post('user_id')), $data);
     echo json_encode(array("status" => TRUE ));
  }

  public function delete_user($user_id)
  {
    $this->M_user->delete_user($user_id);
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
    if($this->input->post('username') == '')
    {
        $data['inputerror'][] = 'username';
        $data['error_string'][] = 'username is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('fullname') == '')
    {
        $data['inputerror'][] = 'fullname';
        $data['error_string'][] = 'fullname is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('user_group') == '')
    {
        $data['inputerror'][] = 'user_group';
        $data['error_string'][] = 'user_group is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('status') == '')
    {
        $data['inputerror'][] = 'status';
        $data['error_string'][] = 'status is required';
        $data['status'] = FALSE;
    }
    if ($this->input->post('user_id')) {
      $user = $this->M_user->get_user($this->input->post('user_id'));
      if($this->input->post('username') != '')
      {
          if($user->username != $this->input->post('username')){
            $cek = $this->M_user->get(['username' => $this->input->post('username')]);
            if($cek->num_rows()){
              $data['inputerror'][] = 'username';
              $data['error_string'][] = 'Username Already Registered';
              $data['status'] = FALSE;
            }
          }
      }
    }else{

      if($this->input->post('username') != '')
      {
        $cek = $this->M_user->get(['username' => $this->input->post('username')]);
        if($cek->num_rows()){
          $data['inputerror'][] = 'username';
          $data['error_string'][] = 'Username Already Registered';
          $data['status'] = FALSE;
        }
      }

       if($this->input->post('password') == ''){
          $data['inputerror'][] = 'password';
          $data['error_string'][] = 'Password Is Required';
          $data['status'] = FALSE;
      }
    }
    if($data['status'] === FALSE)
    {
        echo json_encode($data);
        exit();
    }
  }

}
