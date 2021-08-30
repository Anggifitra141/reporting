<?php

class M_sipesat_clean extends CI_model {

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

	var $table = 't1clean_sipesat';
  var $column_order = array('trx_date','customer_code','customer_cif','customer_name', 'birth_place', 'birth_date', 'address', 'phone_number', 'status');
  var $column_search = array('trx_date','customer_code','customer_cif','customer_name', 'birth_place', 'birth_date', 'address', 'phone_number', 'status');
  var $order = array('id' => 'desc');

  public function get($where=null)
  {
    $this->db->select('*');
    $this->db->from($this->table);
    
    if ($where) {
      $this->db->where($where);
    }
    return $this->db->get();
  }

	private function _get_datatables_query()
  {
    $this->db->select('*');
    $this->db->from($this->table);
    
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
    return $this->db->count_all_results();
  }


}
