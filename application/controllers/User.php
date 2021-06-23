<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class user extends CI_Controller {

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  =======   Contact Develope  : anggifitra141@gmail.com    ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
	{
		parent::__construct();
    $this->load->model('M_user');
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
    $data['content'] = $this->load->view('user/user', $data, TRUE);
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
				if($this->session->userdata('role') == "admin"){
					$row[] = '<a href="#" onclick="get_user('.$item->user_id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>&nbsp;&nbsp;<a href="#" onclick="delete_user('.$item->user_id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
				}else{
					$row[] = "No Action";
				}
				$row[] = $item->user_name;
        $row[] = $item->hour_production;
        $row[] = $item->start;
        $row[] = $item->end;
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
    $this->_validate();
    $data = array(
      'username'          => $this->input->post('username'),
      'password'          => $this->input->post('password'),
      'fullname'          => $this->input->post('fullname'),
      'user_groups'       => $this->input->post('user_groups'),
      'avatar'            => $this->input->post('avatar'),
      'activation_date'   => date('Y-m-d'),
      'status'            => $this->input->post('status')
    );
    $this->M_user->add_user($data);
    echo json_encode(array("status" => TRUE ));
  }

  public function update_user()
  {
    $this->_validate();
		$data = array(
      'username'          => $this->input->post('username'),
      'password'          => $this->input->post('password'),
      'fullname'          => $this->input->post('fullname'),
      'user_groups'       => $this->input->post('user_groups'),
      'avatar'            => $this->input->post('avatar'),
      'activation_date'   => date('Y-m-d'),
      'status'            => $this->input->post('status')
    );
     $this->M_user->update_user(array('user_id' => $this->input->post('user_id')), $data);
     echo json_encode(array("status" => TRUE ));
  }

  public function delete_user($user_id)
  {
    $this->M_user->delete_user($user_id);
    echo json_encode(array("status" => TRUE));
  }

  private function _validate()
  {
      $data = array();
      $data['error_string'] = array();
      $data['inputerror'] = array();
      $data['status'] = TRUE;

      if($this->input->post('user_name') == '')
      {
          $data['inputerror'][] = 'user_name';
          $data['error_string'][] = 'user name is required';
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
