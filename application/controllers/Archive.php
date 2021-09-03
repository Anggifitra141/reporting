<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Archive extends CI_Controller
{

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  ===========           Copyright 2021          ===================
   */

  public function __construct()
  {
    parent::__construct();
    $this->load->model('M_log');
    if (!$this->session->userdata('logged_in')) {
      $data = array();
      $data['msg'] = "Maaf Anda tidak punya akses ke halaman ini !";
      $content = $this->load->view('errors/html/error_sessi', $data, TRUE);
      exit($content);
    }
  }

  public function index()
  {
    $data = [];
    $data['content'] = $this->load->view('archive/archive', $data, TRUE);
    $this->load->view('layout', $data);
  }

  public function ajax_list()
  {
    $list = $this->M_Log->Get_All();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
      $row = array();
      $row[] = $no++;
      $row[] = '<a href="#" onclick="get_user(' . $item->id . ')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>
                  <a href="#" onclick="delete_user(' . $item->id . ')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
      $row[] = $item->username;
      $row[] = $item->fullname;
      $row[] = $item->user_group;
      $row[] = $this->lib->date_indo($item->activation_date);
      if ($item->status == 'active') {
        $status = '<span class="badge badge-primary">Active</span>';
      } else {
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

  public function get_user($id)
  {
    $data = $this->M_user->get_user($id);
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
    echo json_encode(array("status" => TRUE));
  }


}
