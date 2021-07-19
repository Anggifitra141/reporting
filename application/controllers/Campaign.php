<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Campaign extends CI_Controller {

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
	{
		parent::__construct();
    $this->load->model('M_campaign');
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
    $data['content'] = $this->load->view('campaign/campaign', $data, TRUE);
		$this->load->view('layout', $data);
	}

	public function ajax_list()
  {
    $list = $this->M_campaign->Get_All();
    $data = array();
    $no = 1;
    foreach ($list as $item) {
        $row = array();
        $row[] = $no++;
				$row[] = '<a href="#" onclick="get_campaign('.$item->campaign_id.')" class="btn btn-icon btn-primary btn-sm"><i class="far fa-edit"></i></a>
                  <a href="#" onclick="delete_campaign('.$item->campaign_id.')" class="btn btn-icon btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
				$row[] = $item->campaign;
        $row[] = $item->is_active;
        $row[] = $item->created_date;
        $data[] = $row;
    }

    $output = array(
                    "draw" => $_POST['draw'],
                    "recordsTotal" => $this->M_campaign->count_all(),
                    "recordsFiltered" => $this->M_campaign->count_filtered(),
                    "data" => $data,
            );
    echo json_encode($output);
  }

  public function get_campaign($campaign_id)
  {
      $data = $this->M_campaign->get_campaign($campaign_id);
      echo json_encode($data);
  }

  public function add_campaign()
  {
    $ACT = 'add';
    $this->_validate($ACT);
    $data = array(
      'campaign'         => strtoupper($this->input->post('campaign')),
      'is_active'         => $this->input->post('is_active')
    );
    $this->M_campaign->add_campaign($data);
    echo json_encode(array("status" => TRUE ));
  }

  public function update_campaign()
  {
    $ACT = 'update';
    $this->_validate($ACT);
		$data = array(
      'campaign'         => strtoupper($this->input->post('campaign')),
      'is_active'         => $this->input->post('is_active')
    );
     $this->M_campaign->update_campaign(array('campaign_id' => $this->input->post('campaign_id')), $data);
     echo json_encode(array("status" => TRUE ));
  }

  public function delete_campaign($campaign_id)
  {
    $this->M_campaign->delete_campaign($campaign_id);
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

    if($this->input->post('campaign') == '')
    {
        $data['inputerror'][] = 'campaign';
        $data['error_string'][] = 'Campaign is required';
        $data['status'] = FALSE;
    }
    if($this->input->post('is_active') == '')
    {
        $data['inputerror'][] = 'is_active';
        $data['error_string'][] = 'Is Active is required';
        $data['status'] = FALSE;
    }

    if($data['status'] === FALSE)
    {
        echo json_encode($data);
        exit();
    }
  }

}
