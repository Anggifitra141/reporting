<?php

class M_sys_availability extends CI_model {

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

	var $table_pic = 'tsysavailability_pic';
  var $column_order_pic = array('name','division','email','phone_number');
  var $column_search_pic = array('name','division','email','phone_number');
  var $order_pic = array('id' => 'desc');

  public function get_pic($where=null)
  {
    $this->db->select('*');
    $this->db->from($this->table_pic);
    
    if ($where) {
      $this->db->where($where);
    }
    return $this->db->get();
  }

	private function _get_datatables_query_pic()
  {
    $this->db->select('*');
    $this->db->from($this->table_pic);
    
    $i = 0;
    foreach ($this->column_search_pic as $item)
    {
      if($_POST['search']['value']){
      if($i===0){
        $this->db->group_start();
        $this->db->like($item, $_POST['search']['value']);
      }else{
      	$this->db->or_like($item, $_POST['search']['value']);
      }

      if(count($this->column_search_pic) - 1 == $i)
        $this->db->group_end();
      }
      
      $i++;
    }
       
    if(isset($_POST['order'])){
      $this->db->order_by($this->column_order_pic[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
    } else if(isset($this->order_pic)) {
      $order = $this->order_pic;
      $this->db->order_by(key($order), $order[key($order)]);
    }
  }
  public function get_availability_pic($id)
  {
    $this->db->from($this->table_pic);
    $this->db->where('id', $id);
    $query = $this->db->get();
    return $query->row();
  }

  function get_datatables_pic()
  {
    $this->_get_datatables_query_pic();
    if($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
  }
 
  function count_filtered_pic()
  {
    $this->_get_datatables_query_pic();
    $query = $this->db->get();
    return $query->num_rows();
  }
 
  public function count_all_pic()
  {
    $this->db->from($this->table_pic);
    return $this->db->count_all_results();
  }
  public function delete_by_id_pic($id)
  {
    $this->db->where('id', $id);
    $this->db->delete($this->table_pic);
  }
  public function add_availability_pic($data)
  {
    $this->db->insert($this->table_pic, $data);
    return $this->db->insert_id();
  }

  public function update_availability_pic($where, $data)
  {
    $this->db->update($this->table_pic, $data, $where);
    return $this->db->affected_rows();
  }

  public function delete_availability_pic($id)
  {
    $this->db->where('id', $id);
    $this->db->delete($this->table_pic);
  }



  // AVAILIBILITY SYSTEM
  var $table_system = 't1clean_sysavailability';
  var $column_order_system = array('id_service','id_pic','threshold','notes');
  var $column_search_system = array('id_service','id_pic','threshold','notes');
  var $order_system = array('id' => 'desc');


  public function get_system($where=null)
  {
    $this->db->select('tsysavailability_service.service, tsysavailability_service.infrastructure, t1clean_sysavailability.*, tsysavailability_pic.name');
    $this->db->from($this->table_system);
    $this->db->join('tsysavailability_service', 't1clean_sysavailability.id_service = tsysavailability_service.id');
    $this->db->join('tsysavailability_pic', 't1clean_sysavailability.id_pic = tsysavailability_pic.id');
    
    if ($where) {
      $this->db->where($where);
    }
    return $this->db->get();
  }

	private function _get_datatables_query_system()
  {
    $this->db->select('tsysavailability_service.service, tsysavailability_service.infrastructure, t1clean_sysavailability.*, tsysavailability_pic.name');
    $this->db->from($this->table_system);
    $this->db->join('tsysavailability_service', 't1clean_sysavailability.id_service = tsysavailability_service.id', 'right');
    $this->db->join('tsysavailability_pic', 't1clean_sysavailability.id_pic = tsysavailability_pic.id');
    
    $i = 0;
    foreach ($this->column_search_system as $item)
    {
      if($_POST['search']['value']){
      if($i===0){
        $this->db->group_start();
        $this->db->like($item, $_POST['search']['value']);
      }else{
      	$this->db->or_like($item, $_POST['search']['value']);
      }

      if(count($this->column_search_system) - 1 == $i)
        $this->db->group_end();
      }
      
      $i++;
    }
       
    if(isset($_POST['order'])){
      $this->db->order_by($this->column_order_system[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
    } else if(isset($this->order_system)) {
      $order = $this->order_system;
      $this->db->order_by(key($order), $order[key($order)]);
    }
  }
  public function get_availability_system($id)
  {
    $this->db->select('*');
    $this->db->from($this->table_system);
    $this->db->where('id', $id);
    $query = $this->db->get();
    return $query->row();
  }

  function get_datatables_system()
  {
    $this->_get_datatables_query_system();
    if($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
  }
 
  function count_filtered_system()
  {
    $this->_get_datatables_query_system();
    $query = $this->db->get();
    return $query->num_rows();
  }
 
  public function count_all_system()
  {
    $this->db->select('tsysavailability_service.service, tsysavailability_service.infrastructure, t1clean_sysavailability.*, tsysavailability_pic.name');
    $this->db->from($this->table_system);
    $this->db->join('tsysavailability_service', 't1clean_sysavailability.id_service = tsysavailability_service.id');
    $this->db->join('tsysavailability_pic', 't1clean_sysavailability.id_pic = tsysavailability_pic.id');
    return $this->db->count_all_results();
  }
  function add_availability_system($data){
    $this->db->insert($this->table_system, $data);
    return $this->db->insert_id();
  }
  public function delete_by_id_system($id)
  {
    $this->db->where('id', $id);
    $this->db->delete($this->table_system);
  }

  public function update_availability_system($where, $data)
  {
    $this->db->update($this->table_system, $data, $where);
    return $this->db->affected_rows();
  }
  public function delete_availability_system($id)
  {
    $this->db->where('id', $id);
    $this->db->delete($this->table_pic);
  }
}
