<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Master extends CI_Controller {

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
	{
		parent::__construct();
    $this->load->model('M_master');
		if(!$this->session->userdata('logged_in'))
    {
      $data=array();
			$data['msg'] = "Maaf Anda tidak punya akses ke halaman ini !";
			$content = $this->load->view('errors/html/error_sessi', $data, TRUE);
			exit($content);
    }
	}

	public function ltdbb_bi_country()
	{
    $data= [];
    $data['content'] = $this->load->view('master/ltdbb_bi_country', $data, TRUE);
		$this->load->view('layout', $data);
	}

	public function ajax_list_ltdbb_bi_country()
  {
    $list = $this->M_master->Get_All_ltdbb_bi_country();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
        $row[] = '<a href="#" onclick="get_ltdbb_bi_country('.$item->id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>
                  <a href="#" onclick="delete_ltdbb_bi_country('.$item->id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
				$row[] = $item->bi_code;
        $row[] = $item->country;
        $row[] = $item->bi_country;
        $data[] = $row;
    }

    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $this->M_master->count_all_ltdbb_bi_country(),
                    "recordsFiltered" => $this->M_master->count_filtered_ltdbb_bi_country(),
                    "data" => $data,
            );
    echo json_encode($output);
  }
  public function get_ltdbb_bi_country($id)
  {
      $data = $this->M_master->get_ltdbb_bi_country($id);
      echo json_encode($data);
  }

  public function add_ltdbb_bi_country()
  {
    $ACT = 'add';
    $this->_validate($ACT);
    $data = array(
      'bi_code'            => $this->input->post('bi_code'),
      'country'            => $this->input->post('country'),
      'bi_country'         => $this->input->post('bi_country')
    );
    $this->M_master->add_ltdbb_bi_country($data);
    echo json_encode(array("status" => TRUE ));
  }

  public function update_ltdbb_bi_country()
  {
    $ACT = 'update';
    $this->_validate($ACT);
    $data = array(
      'bi_code'            => $this->input->post('bi_code'),
      'country'            => $this->input->post('country'),
      'bi_country'         => $this->input->post('bi_country')
    );
     $this->M_master->update_ltdbb_bi_country(array('id' => $this->input->post('id')), $data);
     echo json_encode(array("status" => TRUE ));
  }

  public function delete_ltdbb_bi_country($id)
  {
    $this->M_master->delete_ltdbb_bi_country($id);
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
    if($this->input->post('bi_code') == '')
    {
        $data['inputerror'][] = 'bi_code';
        $data['error_string'][] = 'BI code is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('country') == '')
    {
        $data['inputerror'][] = 'country';
        $data['error_string'][] = 'country is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('bi_country') == '')
    {
        $data['inputerror'][] = 'bi_country';
        $data['error_string'][] = 'bi_country is required';
        $data['status'] = FALSE;
    }
   
    if($data['status'] === FALSE)
    {
        echo json_encode($data);
        exit();
    }
  }


  public function ltdbb_bi_city()
	{
    $data= [];
    $data['content'] = $this->load->view('master/ltdbb_bi_city', $data, TRUE);
		$this->load->view('layout', $data);
	}

	public function ajax_list_ltdbb_bi_city()
  {
    $list = $this->M_master->Get_All_ltdbb_bi_city();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
        $row[] = '<a href="#" onclick="get_ltdbb_bi_city('.$item->id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>
                  <a href="#" onclick="delete_ltdbb_bi_city('.$item->id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
				$row[] = $item->bi_code;
        $row[] = $item->city;
        $row[] = $item->bi_city;
        $data[] = $row;
    }

    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $this->M_master->count_all_ltdbb_bi_city(),
                    "recordsFiltered" => $this->M_master->count_filtered_ltdbb_bi_city(),
                    "data" => $data,
            );
    echo json_encode($output);
  }
  public function get_ltdbb_bi_city($id)
  {
      $data = $this->M_master->get_ltdbb_bi_city($id);
      echo json_encode($data);
  }

  public function add_ltdbb_bi_city()
  {
    $ACT = 'add';
    $this->_validate_ltdbb_bi_city($ACT);
    $data = array(
      'bi_code'            => $this->input->post('bi_code'),
      'city'            => $this->input->post('city'),
      'bi_city'         => $this->input->post('bi_city')
    );
    $this->M_master->add_ltdbb_bi_city($data);
    echo json_encode(array("status" => TRUE ));
  }

  public function update_ltdbb_bi_city()
  {
    $ACT = 'update';
    $this->_validate_ltdbb_bi_city($ACT);
    $data = array(
      'bi_code'            => $this->input->post('bi_code'),
      'city'            => $this->input->post('city'),
      'bi_city'         => $this->input->post('bi_city')
    );
     $this->M_master->update_ltdbb_bi_city(array('id' => $this->input->post('id')), $data);
     echo json_encode(array("status" => TRUE ));
  }

  public function delete_ltdbb_bi_city($id)
  {
    $this->M_master->delete_ltdbb_bi_city($id);
    echo json_encode(array("status" => TRUE));
  }

  private function _validate_ltdbb_bi_city($event)
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
    if($this->input->post('bi_code') == '')
    {
        $data['inputerror'][] = 'bi_code';
        $data['error_string'][] = 'BI code is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('city') == '')
    {
        $data['inputerror'][] = 'city';
        $data['error_string'][] = 'city is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('bi_city') == '')
    {
        $data['inputerror'][] = 'bi_city';
        $data['error_string'][] = 'bi_city is required';
        $data['status'] = FALSE;
    }
   
    if($data['status'] === FALSE)
    {
        echo json_encode($data);
        exit();
    }
  }






  // START :: ALL MASTER DATA
  public function page($table_name = "")
  {
    $existing_tabel = $this->db->query("SELECT count(TABLE_NAME) tot FROM information_schema.tables WHERE table_schema = 'regulatory' AND table_name = '".$table_name."' LIMIT 1")->row()->tot;
    if($table_name && $existing_tabel > 0 ){
      $data= [];
      $data['content'] = $this->load->view('master/master_all', $data, TRUE);
      $this->load->view('layout', $data);
    }else{
      echo show_404();
    }
    
      
  }

  public function ajax_master_all()
  {
    $table = $this->input->post('table');
    $list = $this->M_master->Get_All_master_all($table);
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
        $row[] = '<a href="#" onclick="get_master_all('.$item->id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>
                  <a href="#" onclick="delete_master_all('.$item->id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
				$row[] = $item->code;
        $row[] = $item->description;
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
                    "recordsTotal" => $this->M_master->count_all_master_all($table),
                    "recordsFiltered" => $this->M_master->count_filtered_master_all($table),
                    "data" => $data,
            );
    echo json_encode($output);
  }
  public function get_master_all($id, $table)
  {
    $data = $this->M_master->get_master_all($table, $id);
    echo json_encode($data);
  }
  public function add_master_all($table)
  {
    $ACT = 'add';
    $this->_validate_master_all($ACT);
    $data = array(
      'code'           => $this->input->post('code'),
      'description'    => $this->input->post('description'),
      'status'         => $this->input->post('status')
    );
    $this->M_master->add_master_all($table, $data);
    //trx_log($this->session->userdata('id'), $table, "ADD", "", "ADD");
    echo json_encode(array("status" => TRUE));
  }

  public function update_master_all($table)
  {
    $ACT = 'update';
    $this->_validate_master_all($ACT);
    $data = array(
      'code'           => $this->input->post('code'),
      'description'    => $this->input->post('description'),
      'status'         => $this->input->post('status')
    );
     $this->M_master->update_master_all($table, array('id' => $this->input->post('id')), $data);
     echo json_encode(array("status" => TRUE ));
  }

  public function delete_master_all($table, $id)
  {
    $this->M_master->delete_master_all($table, $id);
    echo json_encode(array("status" => TRUE));
  }

  private function _validate_master_all($event)
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
    if($this->input->post('code') == '')
    {
        $data['inputerror'][] = 'code';
        $data['error_string'][] = 'Code is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('description') == '')
    {
        $data['inputerror'][] = 'description';
        $data['error_string'][] = 'Description is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('status') == '')
    {
        $data['inputerror'][] = 'status';
        $data['error_string'][] = 'status is required';
        $data['status'] = FALSE;
    }
   
    if($data['status'] === FALSE)
    {
        echo json_encode($data);
        exit();
    }
  }
  // END :: ALL MASTER DATA



}
