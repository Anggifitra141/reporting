<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Employee extends CI_Controller {

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  =======   Contact Develope  : anggifitra141@gmail.com    ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
	{
		parent::__construct();
    $this->load->model(['M_employee', 'M_departement']);
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
    $data['departemen'] = $this->M_departement->get()->result();
    $data['content'] = $this->load->view('employee/employee', $data, TRUE);
		$this->load->view('layout', $data);
	}

	public function ajax_list()
  {
    $list = $this->M_employee->Get_All();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
				if($this->session->userdata('role') == "admin"){
					$row[] = '<a href="#" onclick="get_employee('.$item->employee_id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>&nbsp;&nbsp;<a href="#" onclick="delete_employee('.$item->employee_id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
				}else{
					$row[] = "No Action";
				}
				$row[] = $item->nik;
        $row[] = $item->name;
        $row[] = $item->position;
        $row[] = $item->place_of_birth .', '. date('Y-m-d', strtotime($item->date_of_birth));
        $row[] = $item->departemen;
        $data[] = $row;
    }

    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $this->M_employee->count_all(),
                    "recordsFiltered" => $this->M_employee->count_filtered(),
                    "data" => $data,
            );
    echo json_encode($output);
  }

  public function get_employee($employee_id)
  {
      $data = $this->M_employee->get_employee($employee_id);
      echo json_encode($data);
  }

  public function add_employee()
  {
    $this->_validate();
    $data = array(
      'nik'                   => $this->input->post('nik'),
      'name'                  => $this->input->post('name'),
      'gender'                => $this->input->post('gender'),
      'departemen'            => $this->input->post('departemen'),
      'position'              => $this->input->post('position'),
      'date_of_birth'         => $this->input->post('date_of_birth'),
      'place_of_birth'        => $this->input->post('place_of_birth'),
      'join_date'             => $this->input->post('join_date'),
      'addres_line'           => $this->input->post('addres_line'),
      'city'                  => $this->input->post('city'),
      'province'              => $this->input->post('province'),
      'zip'                   => $this->input->post('zip'),
      'religion'              => $this->input->post('religion'),
      'wn'                    => $this->input->post('wn'),
      'marital_status'        => $this->input->post('marital_status'),
      'pph_status'            => $this->input->post('pph_status'),
      'blood_group'           => $this->input->post('blood_group'),
      'email'                 => $this->input->post('email'),
      'phone'                 => $this->input->post('phone'),
      'npwp'                  => $this->input->post('npwp'),
      'bpjs_healt_number'     => $this->input->post('bpjs_healt_number'),
      'bpjs_employment_number'=> $this->input->post('bpjs_employment_number'),
      'bpjs_pension_number'   => $this->input->post('bpjs_pension_number'),
      'bank_account_name'     => $this->input->post('bank_account_name'),
      'bank_account_number'   => $this->input->post('bank_account_number'),
      'remaining_days_off'    => $this->input->post('remaining_days_off')
    );
    $this->M_employee->add_employee($data);
    echo json_encode(array("status" => TRUE, 'data' => $data ));
  }

  public function update_employee()
  {
    $this->_validate();
		$data = array(
      'nik'                   => $this->input->post('nik'),
      'name'                  => $this->input->post('name'),
      'gender'                => $this->input->post('gender'),
      'departemen'            => $this->input->post('departemen'),
      'position'              => $this->input->post('position'),
      'date_of_birth'         => $this->input->post('date_of_birth'),
      'place_of_birth'        => $this->input->post('place_of_birth'),
      'join_date'             => $this->input->post('join_date'),
      'addres_line'           => $this->input->post('addres_line'),
      'city'                  => $this->input->post('city'),
      'province'              => $this->input->post('province'),
      'zip'                   => $this->input->post('zip'),
      'religion'              => $this->input->post('religion'),
      'wn'                    => $this->input->post('wn'),
      'marital_status'        => $this->input->post('marital_status'),
      'pph_status'            => $this->input->post('pph_status'),
      'blood_group'           => $this->input->post('blood_group'),
      'email'                 => $this->input->post('email'),
      'phone'                 => $this->input->post('phone'),
      'npwp'                  => $this->input->post('npwp'),
      'bpjs_healt_number'     => $this->input->post('bpjs_healt_number'),
      'bpjs_employment_number'=> $this->input->post('bpjs_employment_number'),
      'bpjs_pension_number'   => $this->input->post('bpjs_pension_number'),
      'bank_account_name'     => $this->input->post('bank_account_name'),
      'bank_account_number'   => $this->input->post('bank_account_number'),
      'remaining_days_off'    => $this->input->post('remaining_days_off')
    );
     $this->M_employee->update_employee(array('employee_id' => $this->input->post('employee_id')), $data);
     echo json_encode(array("status" => TRUE ));
  }

  public function delete_employee($employee_id)
  {
    $this->M_employee->delete_employee($employee_id);
    echo json_encode(array("status" => TRUE));
  }

  private function _validate()
  {
      $data = array();
      $data['error_string'] = array();
      $data['inputerror'] = array();
      $data['status'] = TRUE;

      if($this->input->post('nik') == '')
      {
          $data['inputerror'][] = 'nik';
          $data['error_string'][] = 'Nik type is required';
          $data['status'] = FALSE;
      }
      if($this->input->post('name') == '')
      {
          $data['inputerror'][] = 'name';
          $data['error_string'][] = 'Name is required';
          $data['status'] = FALSE;
      }
      if($this->input->post('gender') == '')
      {
          $data['inputerror'][] = 'gender';
          $data['error_string'][] = 'Gender is required';
          $data['status'] = FALSE;
      }
      if($this->input->post('phone') == '')
      {
          $data['inputerror'][] = 'phone';
          $data['error_string'][] = 'Phone is required';
          $data['status'] = FALSE;
      }
      if($this->input->post('date_of_birth') == '')
      {
          $data['inputerror'][] = 'date_of_birth';
          $data['error_string'][] = 'Date Of Birth is required';
          $data['status'] = FALSE;
      }
      if($this->input->post('place_of_birth') == '')
      {
          $data['inputerror'][] = 'place_of_birth';
          $data['error_string'][] = 'Place Of Birth is required';
          $data['status'] = FALSE;
      }
      if($data['status'] === FALSE)
      {
          echo json_encode($data);
          exit();
      }
  }
}
