<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class M_log extends CI_Model
{

  public function trx_log($param)
  {
    $this->db->insert('t4log_trx', $param);
    return $this->db->affected_rows();
  }

  public function user_log($param)
  {
    $this->db->insert('t4log_user', $param);
    return $this->db->affected_rows();
  }

}
