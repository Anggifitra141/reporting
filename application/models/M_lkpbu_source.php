<?php

class M_lkpbu_source extends CI_model {

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

	var $table302_card = 't0source_lkpbu_302_card';
  var $column_order302_card = array('cust_code','cust_type_id','city_id','status_card');
  var $column_search302_card = array('cust_code','cust_type_id','city_id','status_card');
  var $order302_card = array('id' => 'desc');

  public function get302_card($where=null)
  {
    $this->db->select('*');
    $this->db->from($this->table302_card);
    $this->db->where('status', 'new');
    if ($where) {
      $this->db->where($where);
    }
    return $this->db->get();
  }

	private function _get_datatables_query302_card()
  {
    $this->db->select('*');
    $this->db->from($this->table302_card);
    $this->db->where('status', 'new');
    $i = 0;
    foreach ($this->column_search302_card as $item)
    {
      if($_POST['search']['value']){
      if($i===0){
        $this->db->group_start();
        $this->db->like($item, $_POST['search']['value']);
      }else{
      	$this->db->or_like($item, $_POST['search']['value']);
      }

      if(count($this->column_search302_card) - 1 == $i)
        $this->db->group_end();
      }
      
      $i++;
    }
       
    if(isset($_POST['order'])){
      $this->db->order_by($this->column_order302_card[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
    } else if(isset($this->order302_card)) {
      $order = $this->order302_card;
      $this->db->order_by(key($order), $order[key($order)]);
    }
  }
  function get_datatables302_card()
  {
    $this->_get_datatables_query302_card();
    if($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
  }
 
  function count_filtered302_card()
  {
    $this->_get_datatables_query302_card();
    $query = $this->db->get();
    return $query->num_rows();
  }
 
  public function count_all302_card()
  {
    $this->db->from($this->table302_card);
    $this->db->where('status', 'new');
    return $this->db->count_all_results();
  }


  // DANA FLOAT
  var $table302_dana_float = 't0source_lkpbu_302_danafloat';
  var $column_order302_dana_float = array('cust_code','cust_type_id','city_id','curr_balance');
  var $column_search302_dana_float = array('cust_code','cust_type_id','city_id','curr_balance');
  var $order302_dana_float = array('id' => 'desc');

  public function get302_dana_float($where=null)
  {
    $this->db->select('*');
    $this->db->from($this->table302_dana_float);
    $this->db->where('status', 'new');
    if ($where) {
      $this->db->where($where);
    }
    return $this->db->get();
  }

	private function _get_datatables_query302_dana_float()
  {
    $this->db->select('*');
    $this->db->from($this->table302_dana_float);
    $this->db->where('status', 'new');
    $i = 0;
    foreach ($this->column_search302_dana_float as $item)
    {
      if($_POST['search']['value']){
      if($i===0){
        $this->db->group_start();
        $this->db->like($item, $_POST['search']['value']);
      }else{
      	$this->db->or_like($item, $_POST['search']['value']);
      }

      if(count($this->column_search302_dana_float) - 1 == $i)
        $this->db->group_end();
      }
      
      $i++;
    }
       
    if(isset($_POST['order'])){
      $this->db->order_by($this->column_order302_dana_float[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
    } else if(isset($this->order302_dana_float)) {
      $order = $this->order302_dana_float;
      $this->db->order_by(key($order), $order[key($order)]);
    }
  }
  function get_datatables302_dana_float()
  {
    $this->_get_datatables_query302_dana_float();
    if($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
  }
 
  function count_filtered302_dana_float()
  {
    $this->_get_datatables_query302_dana_float();
    $query = $this->db->get();
    return $query->num_rows();
  }
 
  public function count_all302_dana_float()
  {
    $this->db->from($this->table302_dana_float);
    $this->db->where('status', 'new');
    return $this->db->count_all_results();
  }

  // TRX
  var $table302_trx = 't0source_lkpbu_302_trx';
  var $column_order302_trx = array('cust_code','cust_type_id','city_id','trx_value', 'trx_code', 'wstransfertype');
  var $column_search302_trx = array('cust_code','cust_type_id','city_id','trx_value', 'trx_code', 'wstransfertype');
  var $order302_trx = array('id' => 'desc');

  public function get302_trx($where=null)
  {
    $this->db->select('*');
    $this->db->from($this->table302_trx);
    $this->db->where('status', 'new');
    if ($where) {
      $this->db->where($where);
    }
    return $this->db->get();
  }

	private function _get_datatables_query302_trx()
  {
    $this->db->select('*');
    $this->db->from($this->table302_trx);
    $this->db->where('status', 'new');
    $i = 0;
    foreach ($this->column_search302_trx as $item)
    {
      if($_POST['search']['value']){
      if($i===0){
        $this->db->group_start();
        $this->db->like($item, $_POST['search']['value']);
      }else{
      	$this->db->or_like($item, $_POST['search']['value']);
      }

      if(count($this->column_search302_trx) - 1 == $i)
        $this->db->group_end();
      }
      
      $i++;
    }
       
    if(isset($_POST['order'])){
      $this->db->order_by($this->column_order302_trx[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
    } else if(isset($this->order302_trx)) {
      $order = $this->order302_trx;
      $this->db->order_by(key($order), $order[key($order)]);
    }
  }
  function get_datatables302_trx()
  {
    $this->_get_datatables_query302_trx();
    if($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
  }
 
  function count_filtered302_trx()
  {
    $this->_get_datatables_query302_trx();
    $query = $this->db->get();
    return $query->num_rows();
  }
 
  public function count_all302_trx()
  {
    $this->db->from($this->table302_trx);
    $this->db->where('status', 'new');
    return $this->db->count_all_results();
  }

  // VOL
  var $table302_vol = 't0source_lkpbu_302_vol';
  var $column_order302_vol = array('cust_code','cust_type_id','city_id','trx_value', 'init_amount');
  var $column_search302_vol = array('cust_code','cust_type_id','city_id','trx_value', 'init_amount');
  var $order302_vol = array('id' => 'desc');

  public function get302_vol($where=null)
  {
    $this->db->select('*');
    $this->db->from($this->table302_vol);
    $this->db->where('status', 'new');
    if ($where) {
      $this->db->where($where);
    }
    return $this->db->get();
  }

	private function _get_datatables_query302_vol()
  {
    $this->db->select('*');
    $this->db->from($this->table302_vol);
    $this->db->where('status', 'new');
    $i = 0;
    foreach ($this->column_search302_vol as $item)
    {
      if($_POST['search']['value']){
      if($i===0){
        $this->db->group_start();
        $this->db->like($item, $_POST['search']['value']);
      }else{
      	$this->db->or_like($item, $_POST['search']['value']);
      }

      if(count($this->column_search302_vol) - 1 == $i)
        $this->db->group_end();
      }
      
      $i++;
    }
       
    if(isset($_POST['order'])){
      $this->db->order_by($this->column_order302_vol[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
    } else if(isset($this->order302_vol)) {
      $order = $this->order302_vol;
      $this->db->order_by(key($order), $order[key($order)]);
    }
  }
  function get_datatables302_vol()
  {
    $this->_get_datatables_query302_vol();
    if($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
  }
 
  function count_filtered302_vol()
  {
    $this->_get_datatables_query302_vol();
    $query = $this->db->get();
    return $query->num_rows();
  }
 
  public function count_all302_vol()
  {
    $this->db->from($this->table302_vol);
    $this->db->where('status', 'new');
    return $this->db->count_all_results();
  }
}
