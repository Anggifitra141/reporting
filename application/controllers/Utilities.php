<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Utilities extends CI_Controller {

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
	{
		parent::__construct();
    $this->load->model(['M_campaign']);
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
    // $data= [];
    // $data['content'] = $this->load->view('campaign/index', $data, TRUE);
		// $this->load->view('layout', $data);
	}

  public function roles_clean()
  {
    $data['sendercountry'] = $this->db->query("SELECT DISTINCT tcleandatasource1.sendercountry FROM tcleandatasource1 WHERE status='unverified'")->result_array();
		$data['receiptcountry'] = $this->db->query("SELECT DISTINCT tcleandatasource1.receiptcountry FROM tcleandatasource1 WHERE status='unverified'")->result_array();
    $data['country'] = $this->db->query("SELECT name FROM tcountrycode")->result();
    $data['content'] = $this->load->view('roles/index', $data, TRUE);
		$this->load->view('layout', $data);
  }

  public function listscountry($value=''){
		$sender = str_replace("_", " ",$value);
		$data['header']			= $sender ;
		$data['page']  			= 'lists country';
    $data['city_result']       = $this->db->query("SELECT alto FROM tregioncode")->result();
		$data['sendercountry'] 	= $this->db->query("SELECT DISTINCT sendercity, sendercity,sendercountry From tcleandatasource1 WHERE sendercountry='$sender'")->result_array();
		$data['content'] = $this->load->view('utilities/list_country', $data, TRUE);
		$this->load->view('layout', $data);
	}
  function uscity()
	{
		$id = $this->input->post('id');
		$name = $this->input->post('sender');
		$contry = $this->input->post('contry');
		$data['sendercity'] = $name;
		$this->db->trans_start();
		$this->db->where('sendercity', $id);
		$this->db->update('tcleandatasource1', $data);
		$this->db->trans_complete();
		$this->session->set_flashdata("msg", "<div class='alert alert-success' role='alert' style='font-size: 10px; margin:15px 0px -15px 0px;'>
		Upadated Done!
		</div><br/><br/>");
		$url = 'utilities/listscountry';
		echo'
		<script>
		window.location.href = "'.base_url().$url.'/'.$contry.'";
		</script>
		';
		//redirect('utilities/manual');
	}
  function sendercountry($value=''){
		$sender = str_replace("_", " ",$value);
		$data['sendercountry'] 	= $this->db->query("SELECT sendercountry FROM tcleandatasource1 WHERE sendercountry = '$sender' LIMIT 1")->result_array();
		$data['country']		= $this->db->query("SELECT name FROM tcountrycode")->result();
		$data['content'] = $this->load->view('utilities/sender_country', $data, TRUE);
		$this->load->view('layout', $data);
	}
  function uscountry()
	{
		$id = $this->input->post('id');
		$name = $this->input->post('name');
		$data['sendercountry'] = $name;
		$this->db->trans_start();
		$this->db->where('sendercountry', $id);
		$this->db->update('tcleandatasource1', $data);
		$this->db->trans_complete();
		$this->session->set_flashdata("msg", "<div class='alert alert-success' role='alert' style='font-size: 10px; margin:15px 0px -15px 0px;'>
		Upadated Done!
		</div><br/><br/>");
		redirect('utilities/manual');
	}

  // START :: RECEIPT COUNTRY
  public function listreceipt($value="")
  {
    $receipt				= str_replace("_", " ",$value);
		$data['header']			= $receipt ;
		$data['page']  			= 'listrcountry';
		$data['receiptcountry']	= $this->db->query("SELECT DISTINCT receiptcity, receiptcountry From tcleandatasource1 WHERE receiptcountry='$receipt'")->result_array();
    $data['receipt'] = $this->db->query("SELECT alto FROM tregioncode")->result();
		$data['content'] = $this->load->view('utilities/listreceipt', $data, TRUE);
		$this->load->view('layout', $data);
  }
  public function urcity()
	{
		$id = $this->input->post('id');
		$name = $this->input->post('name');
		$contry = $this->input->post('contry');
		$data['receiptcity'] = $name;
		$this->db->trans_start();
		$this->db->where('receiptcity', $id);
		$this->db->update('tcleandatasource1', $data);
		$this->db->trans_complete();
		$this->session->set_flashdata("msg", "<div class='alert alert-success' role='alert' style='font-size: 10px; margin:15px 0px -15px 0px;'>
		Upadated Done!
		</div><br/><br/>");
		$url = 'utilities/listreceipt';
		echo'
		<script>
		window.location.href = "'.base_url().$url.'/'.$contry.'";
		</script>
		';
		//redirect('utilities/manual');
	}
  function urcountry()
	{
		$id = $this->input->post('id');
		$name = $this->input->post('name');
		$data['receiptcountry'] = $name;
		$this->db->trans_start();
		$this->db->where('receiptcountry', $id);
		$this->db->update('tcleandatasource1', $data);
		$this->db->trans_complete();
		$this->session->set_flashdata("msg", "<div class='alert alert-success' role='alert' style='font-size: 10px; margin:15px 0px -15px 0px;'>
		Upadated Done!
		</div><br/><br/>");
		redirect('utilities/manual');
	}
  // END :: RECEIPT COUNTRY

  public function auto_clean()
  {
    $data= [];
    $data['campaign'] = $this->M_campaign->get()->result();
    $data['content'] = $this->load->view('auto_clean/raw_data', $data, TRUE);
		$this->load->view('layout', $data);
  }
}