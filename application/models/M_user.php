<?php

class M_user extends CI_model {

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
	{
    $this->load->database();
		parent::__construct();
	}

	var $table = 't4user';
  var $column_order = array('username', 'fullname', 'user_group', 'activation_date', 'status');
  var $column_search = array('username', 'fullname', 'user_group', 'activation_date', 'status');
  var $order = array('id' => 'desc');

  private function _get_datatables_query()
  {
	$this->db->from($this->table);
      $i = 0;

      foreach ($this->column_search as $row)
      {
          if($_POST['search']['value'])
          {

              if($i===0)
              {
                  $this->db->group_start();
                  $this->db->like($row, $_POST['search']['value']);
              }
              else
              {
                  $this->db->or_like($row, $_POST['search']['value']);
              }

              if(count($this->column_search) - 1 == $i)
                  $this->db->group_end();
          }
          $i++;
      }

      if(isset($_POST['order']))
      {
          $this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
      }
      else if(isset($this->order))
      {
          $order = $this->order;
          $this->db->order_by(key($order), $order[key($order)]);
      }
  }

  public function get($where="")
  {
    if($where)
    {
      $this->db->where($where);
    }
    return $this->db->get($this->table);
  }

	public function Get_All()
	{
		$this->_get_datatables_query();
    if($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
	}

  public function count_filtered()
  {
    $this->_get_datatables_query();
    $query = $this->db->get();
    return $query->num_rows();
  }

  public function count_all()
  {
    $this->db->from($this->table);
    return $this->db->count_all_results();
  }

  public function get_user($id)
  {
    $this->db->from($this->table);
    $this->db->where('id', $id);
    $query = $this->db->get();
    return $query->row();
  }

  public function add_user($data)
  {
    $this->db->insert($this->table, $data);
    return $this->db->insert_id();
  }

  public function update_user($where, $data)
  {
    $this->db->update($this->table, $data, $where);
    return $this->db->affected_rows();
  }

  public function delete_user($id)
  {
    $this->db->where('id', $id);
    $this->db->delete($this->table);
  }


  // User Acitivity

  var $tlog_user = 'tlog_user';
  var $column_order_tlog_user = array('event_time', 'id_user', 'ip_address', 'event_modul', 'event_type','record_id','event_notes');
  var $column_search_tlog_user = array('event_time', 'username', 'ip_address', 'event_modul', 'event_type', 'record_id', 'event_notes');
  var $order_tlog_user = array('tlog_user.id' => 'desc');

  private function _get_datatables_query_user_activity()
  {
    if($this->input->post('daterange')){
      $start_date = date('Ymd', strtotime(substr($this->input->post('daterange'), 0, 10)));
      $end_date =  date('Ymd', strtotime(substr($this->input->post('daterange'), 13, 23)));
      $this->db->where('event_time >=', $start_date.'000000');
      $this->db->where('event_time <=', $end_date.'235959');
    }
    if($this->input->post('event_type')){
      $this->db->where('event_type', $this->input->post('event_type'));
    }
    if($this->input->post('id_user')){
      $this->db->where('id_user', $this->input->post('id_user'));
    }
    $this->db->select('event_time, tuser.username, ip_address, event_modul, event_type, record_id, event_notes');
    $this->db->from($this->tlog_user);
    $this->db->join('tuser', 'tlog_user.id_user = tuser.id');

    $i = 0;

    foreach ($this->column_search_tlog_user as $row) {
      if ($_POST['search']['value']) {

        if ($i === 0) {
          $this->db->group_start();
          $this->db->like($row, $_POST['search']['value']);
        } else {
          $this->db->or_like($row, $_POST['search']['value']);
        }

        if (count($this->column_search_tlog_user) - 1 == $i)
          $this->db->group_end();
      }
      $i++;
    }

    if (isset($_POST['order'])) {
      $this->db->order_by($this->column_order_tlog_user[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
    } else if (isset($this->order_tlog_user)) {
      $order_tlog_user = $this->order_tlog_user;
      $this->db->order_by(key($order_tlog_user), $order_tlog_user[key($order_tlog_user)]);
    }
  }

  public function Get_All_user_activity()
  {
    $this->_get_datatables_query_user_activity();
    if ($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
  }

  public function count_filtered_user_activity()
  {
    $this->_get_datatables_query_user_activity();
    $query = $this->db->get();
    return $query->num_rows();
  }

  public function count_all_user_activity()
  {
    $this->db->from($this->tlog_user);
    return $this->db->count_all_results();
  }

}
