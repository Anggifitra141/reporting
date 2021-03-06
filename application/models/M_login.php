<?php
class M_login extends CI_Model {
/**
 *  =======   Application By    : Anggi Fitrahandika  2019    =======
 *  =======   Version           : V.1.0                       =======
 *  =======   Contact           : anggifitra141@gmail.com     =======
 *  ===========           Copyright 2019          ===================
*/

	public function check()
	{
		$this->db->where('username', $this->input->post('username', TRUE));
		// $this->db->where('password', md5($this->input->post('password', TRUE)));
    $this->db->where('status', "ACTIVE", TRUE);
		$query = $this->db->get('t4user');
		if($query->num_rows() > 0)
		{
			$result = $query->row_array();
			if(password_verify($this->input->post('password', TRUE), $result['password'])){
				$user_group = $this->db->get_where('t4user_group', ['group_name' => $result['user_group']])->row();
				$data = array(
						'id' => $result['id'],
						'username' => $result['username'],
						'fullname' => $result['fullname'],
						'status' => $result['status'],
						'action' => $user_group->action,
						'access' => $user_group->access,
						'logged_in' => TRUE
						);
				$this->session->set_userdata($data);
				user_log($this->session->userdata('id'), 'LOGIN', "LOGIN", '', "Successfuly user login", '');
				return TRUE;
			}
		}
		else
		{
			return FALSE;
		}
	}
}
