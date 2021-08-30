<?php
defined('BASEPATH') or exit('No direct script access allowed');

class User_activity extends CI_Controller
{

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  ===========           Copyright 2021          ===================
   */

  public function __construct()
  {
    parent::__construct();
    $this->load->model('M_user');
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
    $data['user'] = $this->M_user->get()->result();
    $data['content'] = $this->load->view('user/user_activity', $data, TRUE);
    $this->load->view('layout', $data);
  }

  public function ajax_list()
  {
    $list = $this->M_user->Get_All_user_activity();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
      $row = array();
      $row[] = $no++;
      $row[] = date('d-m-Y H:i:s', strtotime($item->event_time));
      $row[] = $item->username;
      $row[] = $item->ip_address;
      if ($item->event_type == 'ADD') {
        $label = "badge-info";
      }else if ($item->event_type == "UPDATE"){
        $label = "badge-warning";
      }else if($item->event_type == "DOWNLOAD"){
        $label = "badge-success";
      }else if ($item->event_type == "DELETE") {
        $label = "badge-danger";
      }else{
        $label = "badge-primary";
      }
      $row[] = $item->event_modul;
      $row[] = '<span class="badge '.$label.'">'.$item->event_type.'</span>';
      $row[] = $item->record_id;
      $row[] = $item->event_notes;
      $data[] = $row;
    }

    $output = array(
      "draw" => $_POST['draw'],
      "recordsTotal" => $this->M_user->count_all_user_activity(),
      "recordsFiltered" => $this->M_user->count_filtered_user_activity(),
      "data" => $data,
    );
    echo json_encode($output);
  }



}