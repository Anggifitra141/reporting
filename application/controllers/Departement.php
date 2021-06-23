<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Departement extends CI_Controller {

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  =======   Contact Develope  : anggifitra141@gmail.com    ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
	{
		parent::__construct();
    $this->load->model('M_departement');
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
    $data['content'] = $this->load->view('departement/departement', $data, TRUE);
		$this->load->view('layout', $data);
	}

	public function ajax_list()
  {
    $list = $this->M_departement->Get_All();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
				if($this->session->userdata('role') == "admin"){
					$row[] = '<a href="#" onclick="get_departement('.$item->departement_id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>&nbsp;&nbsp;<a href="#" onclick="delete_departement('.$item->departement_id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
				}else{
					$row[] = "No Action";
				}
				$row[] = $item->departement_name;
        $row[] = $item->head_of_departement;
        $data[] = $row;
    }

    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $this->M_departement->count_all(),
                    "recordsFiltered" => $this->M_departement->count_filtered(),
                    "data" => $data,
            );
    echo json_encode($output);
  }

  public function get_departement($departement_id)
  {
      $data = $this->M_departement->get_departement($departement_id);
      echo json_encode($data);
  }

  public function add_departement()
  {
    $this->_validate();
    
    $data = array(
      'departement_name' => $this->input->post('departement_name'),
      'head_of_departement' => $this->input->post('head_of_departement')
    );
    $this->M_departement->add_departement($data);
    echo json_encode(array("status" => TRUE ));
  }

  public function update_departement()
  {
    $this->_validate();
		$data = array(
			'departement_name' => $this->input->post('departement_name'),
      'head_of_departement' => $this->input->post('head_of_departement')
		);
     $this->M_departement->update_departement(array('departement_id' => $this->input->post('departement_id')), $data);
     echo json_encode(array("status" => TRUE ));
  }

  public function delete_departement($departement_id)
  {
    $this->M_departement->delete_departement($departement_id);
    echo json_encode(array("status" => TRUE));
  }
  private function _validate()
  {
    $data = array();
    $data['error_string'] = array();
    $data['inputerror'] = array();
    $data['status'] = TRUE;

    if($this->input->post('departement_name') == '')
    {
      $data['inputerror'][] = 'departement_name';
      $data['error_string'][] = 'Departemen Name type is required';
      $data['status'] = FALSE;
    }

    if($this->input->post('head_of_departement') == '')
    {
      $data['inputerror'][] = 'head_of_departement';
      $data['error_string'][] = 'Head Of Departemen is required';
      $data['status'] = FALSE;
    }
    if($data['status'] === FALSE)
    {
      echo json_encode($data);
      exit();
    }
  }

}
