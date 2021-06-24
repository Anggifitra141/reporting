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
		$query = $this->db->get('user');
		if($query->num_rows() > 0)
		{
			$result = $query->row_array();
			if(password_verify($this->input->post('password', TRUE), $result['password'])){
				$user_group = $this->db->get_where('user_group', ['group_name' => $result['user_group']])->row();
				$data = array(
						'user_id' => $result['user_id'],
						'username' => $result['username'],
						'fullname' => $result['fullname'],
						'status' => $result['status'],
						'action' => $user_group->action,
						'logged_in' => TRUE
						);
				$this->session->set_userdata($data);
				return TRUE;
			}
		}
		else
		{
			return FALSE;
		}
	}
}
