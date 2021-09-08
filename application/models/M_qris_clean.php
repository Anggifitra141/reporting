<?php

class M_qris_clean extends CI_model {

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

	var $table_trx = 't1clean_qris_trx';
  var $column_order_trx = array('city','pjsp','mcc','merchant_criteria', 'vol_trx', 'amount_trx');
  var $column_search_trx = array('city','pjsp','mcc','merchant_criteria', 'vol_trx', 'amount_trx');
  var $order_trx = array('id' => 'desc');

  public function get_trx($where=null)
  {
    $this->db->select('*');
    $this->db->from($this->table_trx);
    $this->db->where('status', 'cleaned');
    if ($where) {
      $this->db->where($where);
    }
    return $this->db->get();
  }

	private function _get_datatables_query_trx()
  {
    $this->db->select('*');
    $this->db->from($this->table_trx);
    $this->db->where('status', 'cleaned');
    $i = 0;
    foreach ($this->column_search_trx as $item)
    {
      if($_POST['search']['value']){
      if($i===0){
        $this->db->group_start();
        $this->db->like($item, $_POST['search']['value']);
      }else{
      	$this->db->or_like($item, $_POST['search']['value']);
      }

      if(count($this->column_search_trx) - 1 == $i)
        $this->db->group_end();
      }
      
      $i++;
    }
       
    if(isset($_POST['order'])){
      $this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
    } else if(isset($this->order_trx)) {
      $order = $this->order_trx;
      $this->db->order_by(key($order), $order[key($order)]);
    }
  }
  function get_datatables_trx()
  {
    $this->_get_datatables_query_trx();
    if($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
  }
 
  function count_filtered_trx()
  {
    $this->_get_datatables_query_trx();
    $query = $this->db->get();
    return $query->num_rows();
  }
 
  public function count_all_trx()
  {
    $this->db->from($this->table_trx);
    $this->db->where('status', 'cleaned');
    return $this->db->count_all_results();
  }


  // START :: MERCHANT
  var $table_merchant = 't1clean_qris_merchant';
  var $column_order_merchant = array('merchant_name','city','mcc','mechant_criteria', 'merchant_status', 'merchant_perios');
  var $column_search_merchant = array('merchant_name','city','mcc','mechant_criteria', 'merchant_status', 'merchant_perios');
  var $order_merchant = array('id' => 'desc');

  public function get_merchant($where=null)
  {
    $this->db->select('*');
    $this->db->from($this->table_merchant);
    $this->db->where('status', 'cleaned');
    if ($where) {
      $this->db->where($where);
    }
    return $this->db->get();
  }

	private function _get_datatables_query_merchant()
  {
    $this->db->select('*');
    $this->db->from($this->table_merchant);
    $this->db->where('status', 'cleaned');
    $i = 0;
    foreach ($this->column_search_merchant as $item)
    {
      if($_POST['search']['value']){
      if($i===0){
        $this->db->group_start();
        $this->db->like($item, $_POST['search']['value']);
      }else{
      	$this->db->or_like($item, $_POST['search']['value']);
      }

      if(count($this->column_search_merchant) - 1 == $i)
        $this->db->group_end();
      }
      
      $i++;
    }
       
    if(isset($_POST['order'])){
      $this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
    } else if(isset($this->order_merchant)) {
      $order = $this->order_merchant;
      $this->db->order_by(key($order), $order[key($order)]);
    }
  }
  function get_datatables_merchant()
  {
    $this->_get_datatables_query_merchant();
    if($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
  }
 
  function count_filtered_merchant()
  {
    $this->_get_datatables_query_merchant();
    $query = $this->db->get();
    return $query->num_rows();
  }
 
  public function count_all_merchant()
  {
    $this->db->from($this->table_merchant);
    $this->db->where('status', 'cleaned');
    return $this->db->count_all_results();
  }

}
