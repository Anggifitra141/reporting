<?php

class M_lkpbu extends CI_model {

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
  var $table302_card = 't1clean_lkpbu_302_card';
  var $column_order302_card = array('cust_code','cust_type_id','city_id','status_card');
  var $column_search302_card = array('cust_code','cust_type_id','city_id','status_card');
  var $order302_card = array('id' => 'desc');

  public function get302_card($where=null)
  {
    $this->db->select('*');
    $this->db->from($this->table302_card);
    $this->db->where('status', 'cleaned');
    if ($where) {
      $this->db->where($where);
    }
    return $this->db->get();
  }

	private function _get_datatables_query302_card()
  {
    $this->db->select('*');
    $this->db->from($this->table302_card);
    $this->db->where('status', 'cleaned');
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
    $this->db->where('status', 'cleaned');
    return $this->db->count_all_results();
  }


  // DANA FLOAT
  var $table302_dana_float = 't1clean_lkpbu_302_danafloat';
  var $column_order302_dana_float = array('cust_code','cust_type_id','city_id','curr_balance');
  var $column_search302_dana_float = array('cust_code','cust_type_id','city_id','curr_balance');
  var $order302_dana_float = array('id' => 'desc');

  public function get302_dana_float($where=null)
  {
    $this->db->select('*');
    $this->db->from($this->table302_dana_float);
    $this->db->where('status', 'cleaned');
    if ($where) {
      $this->db->where($where);
    }
    return $this->db->get();
  }

	private function _get_datatables_query302_dana_float()
  {
    $this->db->select('*');
    $this->db->from($this->table302_dana_float);
    $this->db->where('status', 'cleaned');
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
    $this->db->where('status', 'cleaned');
    return $this->db->count_all_results();
  }

  // TRX
  var $table302_trx = 't1clean_lkpbu_302_trx';
  var $column_order302_trx = array('cust_code','cust_type_id','city_id','trx_value', 'trx_code', 'wstransfertype');
  var $column_search302_trx = array('cust_code','cust_type_id','city_id','trx_value', 'trx_code', 'wstransfertype');
  var $order302_trx = array('id' => 'desc');

  public function get302_trx($where=null)
  {
    $this->db->select('*');
    $this->db->from($this->table302_trx);
    $this->db->where('status', 'cleaned');
    if ($where) {
      $this->db->where($where);
    }
    return $this->db->get();
  }

	private function _get_datatables_query302_trx()
  {
    $this->db->select('*');
    $this->db->from($this->table302_trx);
    $this->db->where('status', 'cleaned');
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
    $this->db->where('status', 'cleaned');
    return $this->db->count_all_results();
  }

  // VOL
  var $table302_vol = 't1clean_lkpbu_302_vol';
  var $column_order302_vol = array('cust_code','cust_type_id','city_id','trx_value', 'init_amount');
  var $column_search302_vol = array('cust_code','cust_type_id','city_id','trx_value', 'init_amount');
  var $order302_vol = array('id' => 'desc');

  public function get302_vol($where=null)
  {
    $this->db->select('*');
    $this->db->from($this->table302_vol);
    $this->db->where('status', 'cleaned');
    if ($where) {
      $this->db->where($where);
    }
    return $this->db->get();
  }

	private function _get_datatables_query302_vol()
  {
    $this->db->select('*');
    $this->db->from($this->table302_vol);
    $this->db->where('status', 'cleaned');
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
    $this->db->where('status', 'cleaned');
    return $this->db->count_all_results();
  }




	var $table304 = 't1clean_lkpbu_304';
  var $column_order304 = array('trx_date', 'machine_code', 'total_machine', 'total_seller');
  var $column_search304 = array('trx_date', 'machine_code', 'total_machine', 'total_seller');
  var $order304 = array('t1clean_lkpbu_304.id' => 'desc');

  private function _get_datatables_query304()
  {
      $this->db->select('t1clean_lkpbu_304.*, tlkpbu_304_machine_type.machine');
	    $this->db->from($this->table304);
      $this->db->join('tlkpbu_304_machine_type', 't1clean_lkpbu_304.machine_code = tlkpbu_304_machine_type.code');
      $this->db->where(['status' => 'cleaned']);
      $i = 0;
      foreach ($this->column_search304 as $row)
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

              if(count($this->column_search304) - 1 == $i)
                  $this->db->group_end();
          }
          $i++;
      }

      if(isset($_POST['order']))
      {
          $this->db->order_by($this->column_order304[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
      }
      else if(isset($this->order304))
      {
          $order = $this->order304;
          $this->db->order_by(key($order), $order[key($order)]);
      }
  }

  public function get304($where="")
  {
    if($where)
    {
      $this->db->where($where);
    }
    $this->db->where(['status' => 'cleaned']);
    return $this->db->get($this->table304);
  }

	public function Get_All304()
	{
		$this->_get_datatables_query304();
    if($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
	}

  public function count_filtered304()
  {
    $this->_get_datatables_query304();
    $query = $this->db->get();
    return $query->num_rows();
  }

  public function count_all304()
  {
    $this->db->from($this->table304);
    $this->db->where(['status' => 'cleaned']);
    return $this->db->count_all_results();
  }

  public function get_lkpbu304($id)
  {
    $this->db->from($this->table304);
    $this->db->where('id', $id);
    $query = $this->db->get();
    return $query->row();
  }

  public function add_lkpbu304($data)
  {
    $this->db->insert($this->table304, $data);
    $id= $this->db->insert_id();
    user_log($this->session->userdata('id'), 'LKPBU 304', "ADD", $id, "ADD DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'LKPBU 304', "ADD", $id, "ADD DATA" );
    return $id;
  }

  public function update_lkpbu304($where, $data)
  {
    $this->db->update($this->table304, $data, $where);
    user_log($this->session->userdata('id'), 'LKPBU 304', "MODIFY", $where['id'], "MODIFY DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'LKPBU 304', 'MODIFY', $where['id'], "MODIFY DATA");
    return $this->db->affected_rows();
  }

  public function delete_lkpbu304($id)
  {
    $this->db->where('id', $id);
    $this->db->delete($this->table304);
    user_log($this->session->userdata('id'), 'LKPBU 304', "DELETE", $id, "DELETE DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'LKPBU 304', "DELETE", $id, "DELETE DATA");
  }


  // START :: FORM 306
  var $table306 = 't1clean_lkpbu_306';
  var $column_order306 = array('trx_date', 'fraud_code', 'actual_loss_vol', 'actual_loss_nominal', 'potential_loss_vol', 'potential_loss_nominal');
  var $column_search306 = array('trx_date', 'fraud_code', 'actual_loss_vol', 'actual_loss_nominal', 'potential_loss_vol', 'potential_loss_nominal');
  var $order306 = array('t1clean_lkpbu_306.id' => 'desc');

  private function _get_datatables_query306()
  {
      $this->db->select('t1clean_lkpbu_306.*, tlkpbu_306_fraud_type.fraud');
	    $this->db->from($this->table306);
      $this->db->join('tlkpbu_306_fraud_type', 't1clean_lkpbu_306.fraud_code = tlkpbu_306_fraud_type.code');
      $this->db->where(['status' => 'cleaned']);
      $i = 0;
      foreach ($this->column_search306 as $row)
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

              if(count($this->column_search306) - 1 == $i)
                  $this->db->group_end();
          }
          $i++;
      }

      if(isset($_POST['order']))
      {
          $this->db->order_by($this->column_order306[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
      }
      else if(isset($this->order306))
      {
          $order = $this->order306;
          $this->db->order_by(key($order), $order[key($order)]);
      }
  }

  public function get306($where="")
  {
    if($where)
    {
      $this->db->where($where);
    }
    $this->db->where(['status' => 'cleaned']);
    return $this->db->get($this->table306);
  }

	public function Get_All306()
	{
		$this->_get_datatables_query306();
    if($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
	}

  public function count_filtered306()
  {
    $this->_get_datatables_query306();
    $query = $this->db->get();
    return $query->num_rows();
  }

  public function count_all306()
  {
    $this->db->from($this->table306);
    $this->db->where(['status' => 'cleaned']);
    return $this->db->count_all_results();
  }

  public function get_lkpbu306($id)
  {
    $this->db->from($this->table306);
    $this->db->where('id', $id);
    $query = $this->db->get();
    return $query->row();
  }

  public function add_lkpbu306($data)
  {
    $this->db->insert($this->table306, $data);
    $id = $this->db->insert_id();
    user_log($this->session->userdata('id'), 'LKPBU 306', "ADD", $id, "ADD DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'LKPBU 306', "ADD", $id, "ADD DATA" );
    return $id;
  }

  public function update_lkpbu306($where, $data)
  {
    $this->db->update($this->table306, $data, $where);
    user_log($this->session->userdata('id'), 'LKPBU 306', "MODIFY", $where['id'], "MODIFY DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'LKPBU 306', 'MODIFY', $where['id'], "MODIFY DATA");
    return $this->db->affected_rows();
  }

  public function delete_lkpbu306($id)
  {
    $this->db->where('id', $id);
    $this->db->delete($this->table306);
    user_log($this->session->userdata('id'), 'LKPBU 306', "DELETE", $id, "DELETE DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'LKPBU 306', "DELETE", $id, "DELETE DATA");
  }
  // END :: FORM 306

  // START :: FORM 309_310_311
  var $table309_310_311 = 't1clean_lkpbu_309_310_311';
  var $column_order309_310_311 = array('ticket_no', 'ticket_status', 'service', 'segname');
  var $column_search309_310_311 = array('ticket_no', 'ticket_status', 'service', 'segname');
  var $order309_310_311 = array('t1clean_lkpbu_309_310_311.id' => 'desc');

  private function _get_datatables_query309_310_311()
  {
      $this->db->select('*');
	    $this->db->from($this->table309_310_311);
      $this->db->where(['status' => 'cleaned']);
      $i = 0;
      foreach ($this->column_search309_310_311 as $row)
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

              if(count($this->column_search309_310_311) - 1 == $i)
                  $this->db->group_end();
          }
          $i++;
      }

      if(isset($_POST['order']))
      {
          $this->db->order_by($this->column_order309_310_311[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
      }
      else if(isset($this->order309_310_311))
      {
          $order = $this->order309_310_311;
          $this->db->order_by(key($order), $order[key($order)]);
      }
  }

  public function get309_310_311($where="")
  {
    if($where)
    {
      $this->db->where($where);
    }
    $this->db->where(['status' => 'cleaned']);
    return $this->db->get($this->table309_310_311);
  }

	public function Get_All309_310_311()
	{
		$this->_get_datatables_query309_310_311();
    if($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
	}

  public function count_filtered309_310_311()
  {
    $this->_get_datatables_query309_310_311();
    $query = $this->db->get();
    return $query->num_rows();
  }

  public function count_all309_310_311()
  {
    $this->db->from($this->table309_310_311);
    $this->db->where(['status' => 'cleaned']);
    return $this->db->count_all_results();
  }

  public function get_lkpbu309_310_311($id)
  {
    $this->db->from($this->table309_310_311);
    $this->db->where('id', $id);
    $query = $this->db->get();
    return $query->row();
  }

  public function add_lkpbu309_310_311($data)
  {
    $this->db->insert($this->table309_310_311, $data);
    $id = $this->db->insert_id();
    user_log($this->session->userdata('id'), 'LKPBU 309, 310 & 311', "ADD", $id, "ADD DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'LKPBU 309, 310 & 311', "ADD", $id, "ADD DATA" );
    return $id;
  }

  public function update_lkpbu309_310_311($where, $data)
  {
    $this->db->update($this->table309_310_311, $data, $where);
    user_log($this->session->userdata('id'), 'LKPBU 309, 310 & 311', "MODIFY", $where['id'], "MODIFY DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'LKPBU 309, 310 & 311', 'MODIFY', $where['id'], "MODIFY DATA");
    return $this->db->affected_rows();
  }

  public function delete_lkpbu309_310_311($id)
  {
    $this->db->where('id', $id);
    $this->db->delete($this->table309_310_311);
    user_log($this->session->userdata('id'), 'LKPBU 309, 310 & 311', "DELETE", $id, "DELETE DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'LKPBU 309, 310 & 311', "DELETE", $id, "DELETE DATA");
  }
  // END :::

  // START :: FORM 312
  var $table312 = 't1clean_lkpbu_312';
  var $column_order312 = array('trx_date', 'publication', 'description');
  var $column_search312 = array('trx_date', 'publication', 'description');
  var $order312 = array('t1clean_lkpbu_312.id' => 'desc');

  private function _get_datatables_query312()
  {
      $this->db->select('t1clean_lkpbu_312.*, tlkpbu_312_publication_type.publication');
	    $this->db->from($this->table312);
      $this->db->join('tlkpbu_312_publication_type', 't1clean_lkpbu_312.publication_code = tlkpbu_312_publication_type.code');
      $this->db->where(['status' => 'cleaned']);
      $i = 0;
      foreach ($this->column_search312 as $row)
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

              if(count($this->column_search312) - 1 == $i)
                  $this->db->group_end();
          }
          $i++;
      }

      if(isset($_POST['order']))
      {
          $this->db->order_by($this->column_order312[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
      }
      else if(isset($this->order312))
      {
          $order = $this->order312;
          $this->db->order_by(key($order), $order[key($order)]);
      }
  }

  public function get312($where="")
  {
    if($where)
    {
      $this->db->where($where);
    }
    $this->db->where(['status' => 'cleaned']);
    return $this->db->get($this->table312);
  }

	public function Get_All312()
	{
		$this->_get_datatables_query312();
    if($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
	}

  public function count_filtered312()
  {
    $this->_get_datatables_query312();
    $query = $this->db->get();
    return $query->num_rows();
  }

  public function count_all312()
  {
    $this->db->from($this->table312);
    $this->db->where(['status' => 'cleaned']);
    return $this->db->count_all_results();
  }

  public function get_lkpbu312($id)
  {
    $this->db->from($this->table312);
    $this->db->where('id', $id);
    $query = $this->db->get();
    return $query->row();
  }

  public function add_lkpbu312($data)
  {
    $this->db->insert($this->table312, $data);
    $id= $this->db->insert_id();
    user_log($this->session->userdata('id'), 'LKPBU 312', "ADD", $id, "ADD DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'LKPBU 312', "ADD", $id, "ADD DATA" );
    return $id;
  }

  public function update_lkpbu312($where, $data)
  {
    $this->db->update($this->table312, $data, $where);
    user_log($this->session->userdata('id'), 'LKPBU 312', "MODIFY", $where['id'], "MODIFY DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'LKPBU 312', 'MODIFY', $where['id'], "MODIFY DATA");
    return $this->db->affected_rows();
  }

  public function delete_lkpbu312($id)
  {
    $this->db->where('id', $id);
    $this->db->delete($this->table312);
    user_log($this->session->userdata('id'), 'LKPBU 312', "DELETE", $id, "DELETE DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'LKPBU 312', "DELETE", $id, "DELETE DATA");
  }
  // END :: FORM 312
  
  // START :: FORM 313
  var $table313 = 't1clean_lkpbu_313';
  var $column_order313 = array('trx_date', 'publication', 'description');
  var $column_search313 = array('trx_date', 'publication', 'description');
  var $order313 = array('t1clean_lkpbu_313.id' => 'desc');

  private function _get_datatables_query313()
  {
      $this->db->select('t1clean_lkpbu_313.*, tlkpbu_313_publication_type.publication');
	    $this->db->from($this->table313);
      $this->db->join('tlkpbu_313_publication_type', 't1clean_lkpbu_313.publication_code = tlkpbu_313_publication_type.code');
      $this->db->where(['status' => 'cleaned']);
      $i = 0;
      foreach ($this->column_search313 as $row)
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

              if(count($this->column_search313) - 1 == $i)
                  $this->db->group_end();
          }
          $i++;
      }

      if(isset($_POST['order']))
      {
          $this->db->order_by($this->column_order313[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
      }
      else if(isset($this->order313))
      {
          $order = $this->order313;
          $this->db->order_by(key($order), $order[key($order)]);
      }
  }

  public function get313($where="")
  {
    if($where)
    {
      $this->db->where($where);
    }
    $this->db->where(['status' => 'cleaned']);
    return $this->db->get($this->table313);
  }

	public function Get_All313()
	{
		$this->_get_datatables_query313();
    if($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
	}

  public function count_filtered313()
  {
    $this->_get_datatables_query313();
    $query = $this->db->get();
    return $query->num_rows();
  }

  public function count_all313()
  {
    $this->db->from($this->table313);
    $this->db->where(['status' => 'cleaned']);
    return $this->db->count_all_results();
  }

  public function get_lkpbu313($id)
  {
    $this->db->from($this->table313);
    $this->db->where('id', $id);
    $query = $this->db->get();
    return $query->row();
  }

  public function add_lkpbu313($data)
  {
    $this->db->insert($this->table313, $data);
    $id = $this->db->insert_id();
    user_log($this->session->userdata('id'), 'LKPBU 313', "ADD", $id, "ADD DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'LKPBU 313', "ADD", $id, "ADD DATA" );
    return $id;
  }

  public function update_lkpbu313($where, $data)
  {
    $this->db->update($this->table313, $data, $where);
    user_log($this->session->userdata('id'), 'LKPBU 313', "MODIFY", $where['id'], "MODIFY DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'LKPBU 313', 'MODIFY', $where['id'], "MODIFY DATA");
    return $this->db->affected_rows();
  }

  public function delete_lkpbu313($id)
  {
    $this->db->where('id', $id);
    $this->db->delete($this->table313);
    user_log($this->session->userdata('id'), 'LKPBU 313', "DELETE", $id, "DELETE DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'LKPBU 313', "DELETE", $id, "DELETE DATA");
  }
  // END :: FORM 313

}
