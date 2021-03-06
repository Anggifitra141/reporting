<?php

class M_tltdbb_source extends CI_model {

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

	var $table = 't0source_ltdbb';
  var $column_order = array('trx_date','sender_name','recept_name','trx_amount');
  var $column_search = array('trx_date','sender_name','recept_name','trx_amount');
  var $order = array('id' => 'desc');

  public function get($where=null)
  {
    $this->db->select('*');
    $this->db->from($this->table);
    $this->db->where('status', 'new');
    
    if ($where) {
      $this->db->where($where);
    }
    return $this->db->get();
  }

	private function _get_datatables_query()
  {
    $this->db->select('*');
    $this->db->from($this->table);
    $this->db->where('status', 'new');
    $i = 0;
    foreach ($this->column_search as $item)
    {
      if($_POST['search']['value']){
      if($i===0){
        $this->db->group_start();
        $this->db->like($item, $_POST['search']['value']);
      }else{
      	$this->db->or_like($item, $_POST['search']['value']);
      }

      if(count($this->column_search) - 1 == $i)
        $this->db->group_end();
      }
      $i++;
    }
       
    if(isset($_POST['order'])){
      $this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
    } else if(isset($this->order)) {
      $order = $this->order;
      $this->db->order_by(key($order), $order[key($order)]);
    }
  }
  function get_datatables()
  {
    $this->_get_datatables_query();
    if($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
  }
 
  function count_filtered()
  {
    $this->_get_datatables_query();
    $query = $this->db->get();
    return $query->num_rows();
  }
 
  public function count_all()
  {
    $this->db->from($this->table);
    $this->db->where('status', 'new');
    return $this->db->count_all_results();
  }
  public function delete_by_id($id)
  {
    $this->db->where('id', $id);
    $this->db->delete($this->table);
  }


}
