<?php

class M_user_group extends CI_model {

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

	var $table = 't4user_group';
  var $column_order = array('group_name','access','action');
  var $column_search = array('group_name','access','action');
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

  public function get_user_group($id)
  {
    $this->db->from($this->table);
    $this->db->where('id', $id);
    $query = $this->db->get();
    return $query->row();
  }

  public function add_user_group($data)
  {
    $this->db->insert($this->table, $data);
    $id = $this->db->insert_id();
    user_log($this->session->userdata('id'), 'USER GROUP', "ADD", $id, "ADD DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'USER GROUP', "ADD", $id, "ADD DATA" );
    return $id;
  }

  public function update_user_group($where, $data)
  {
    $this->db->update($this->table, $data, $where);
    user_log($this->session->userdata('id'), 'USER GROUP', "MODIFY", $where['id'], "MODIFY DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'USER GROUP', 'MODIFY', $where['id'], "MODIFY DATA");
    return $this->db->affected_rows();
  }

  public function delete_user_group($id)
  {
    $this->db->where('id', $id);
    $this->db->delete($this->table);
    user_log($this->session->userdata('id'), 'USER GROUP', "DELETE", $id, "DELETE DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'USER GROUP', "DELETE", $id, "DELETE DATA");
  }

}
