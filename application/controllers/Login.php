<?php
defined('BASEPATH') OR exit('Akses Tidak di izinkan boss...');

class Login extends CI_Controller {
  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
  {
    parent::__construct();
		$this->load->model('M_login');
  }

	public function index()
	{
		if($this->session->userdata('logged_in'))
		{
			redirect('app');
		}
		else
		{
			$data['title'] = 'Login';

			$this->load->view('login');
		}
	}

	public function check()
	{
		$this->form_validation->set_rules('username', 'Username', 'required|trim|xss_clean');
		$this->form_validation->set_rules('password', 'Password', 'required|trim|xss_clean');
		if($this->form_validation->run() == TRUE)
		{
			$data = $this->M_login->check();

			if($data == TRUE)
			{
					$output = array();
          $output["success"] = "Success, Redirecting....";
          $this->load->view("login", $output);
					echo '<script>
                            function refresh() {
                                window.location = "'.base_url().'app/";
							}
                            setTimeout("refresh()", 1200);
						</script>';
			}
			else
			{
					$output = array();
          $output["error"] = "Username Or Password Doesn't match !.";
          $this->load->view("login", $output);

			}
		}
		else
		{
			echo validation_errors('<div class="bs-example">
										<div class="alert alert-danger alert-error">
        									<button class="close" data-dismiss="alert">&times;</button>
        									<strong>Error! </strong>'
											,
										'</div>
									</div>');
		}
	}

	function signout()
	{
		$this->session->sess_destroy();
		redirect('login');
	}
}
?>
