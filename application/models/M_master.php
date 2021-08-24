<?php

class M_master extends CI_model {

  /**
   *  =======   Application By    : PT. Seiber Mitra Solusi    ========
   *  =======   Version           : V.1.0                      ========
   *  =======   Contact Develope  : anggifitra141@gmail.com    ========
   *  ===========           Copyright 2021          ===================
  */

	public function __construct()
	{
    $this->load->database();
		parent::__construct();
	}

	var $table_ltdbb_bi_country = 'tltdbb_bi_country';
  var $column_order_ltdbb_bi_country = array('id');
  var $column_search_ltdbb_bi_country = array('ltdb','name');
  var $order_ltdbb_bi_country = array('id' => 'DESC');

  

  private function _get_datatables_query_ltdbb_bi_country()
  {
	$this->db->from($this->table_ltdbb_bi_country);
      $i = 0;

      foreach ($this->column_search_ltdbb_bi_country as $row)
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

              if(count($this->column_search_ltdbb_bi_country) - 1 == $i)
                  $this->db->group_end();
          }
          $i++;
      }

      if(isset($_POST['order']))
      {
          $this->db->order_by($this->column_order_ltdbb_bi_country[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
      }
      else if(isset($this->order))
      {
          $order_ltdbb_bi_country = $this->order;
          $this->db->order_by(key($order_ltdbb_bi_country), $order_ltdbb_bi_country[key($order)]);
      }
  }

  public function get_ltdbb_bi_country($id)
  {
    $this->db->from($this->table_ltdbb_bi_country);
    $this->db->where('id', $id);
    $query = $this->db->get();
    return $query->row();
  }

	public function Get_All_ltdbb_bi_country()
	{
		$this->_get_datatables_query_ltdbb_bi_country();
    if($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
	}

  public function count_filtered_ltdbb_bi_country()
  {
    $this->_get_datatables_query_ltdbb_bi_country();
    $query = $this->db->get();
    return $query->num_rows();
  }

  public function count_all_ltdbb_bi_country()
  {
    $this->db->from($this->table_ltdbb_bi_country);
    return $this->db->count_all_results();
  }

  public function add_ltdbb_bi_country($data)
  {
    $this->db->insert($this->table_ltdbb_bi_country, $data);
    return $this->db->insert_id();
  }

  public function update_ltdbb_bi_country($where, $data)
  {
    $this->db->update($this->table_ltdbb_bi_country, $data, $where);
    return $this->db->affected_rows();
  }

  public function delete_ltdbb_bi_country($id)
  {
    $this->db->where('id', $id);
    $this->db->delete($this->table_ltdbb_bi_country);
  }

  /// MASTER COUNTRY /// 

  var $table_country = 'tcountrycode';
  var $column_order_country = array('id');
  var $column_search_country = array('ltdb','name');
  var $order_country = array('id' => 'ASC');  

  private function _get_datatables_query_country()
  {
	$this->db->from($this->table_country);
      $i = 0;

      foreach ($this->column_search_country as $row)
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

              if(count($this->column_search_country) - 1 == $i)
                  $this->db->group_end();
          }
          $i++;
      }

      if(isset($_POST['order']))
      {
          $this->db->order_by($this->column_order_country[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
      }
      else if(isset($this->order))
      {
          $order_country = $this->order;
          $this->db->order_by(key($order_country), $order_country[key($order)]);
      }
  }

  public function get_country($where="")
  {
    if($where)
    {
      $this->db->where($where);
    }
    return $this->db->get($this->table_country);
  }

	public function Get_All_country()
	{
		$this->_get_datatables_query_country();
    if($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
	}

  public function count_filtered_country()
  {
    $this->_get_datatables_query_country();
    $query = $this->db->get();
    return $query->num_rows();
  }

  public function count_all_country()
  {
    $this->db->from($this->table_country);
    return $this->db->count_all_results();
  }

  public function get_campaign($campaign_id)
  {
    $this->db->from($this->table);
    $this->db->where('campaign_id', $campaign_id);
    $query = $this->db->get();
    return $query->row();
  }

  public function add_campaign($data)
  {
    $this->db->insert($this->table, $data);
    return $this->db->insert_id();
  }

  public function update_campaign($where, $data)
  {
    $this->db->update($this->table, $data, $where);
    return $this->db->affected_rows();
  }

  public function delete_campaign($campaign_id)
  {
    $this->db->where('campaign_id', $campaign_id);
    $this->db->delete($this->table);
  }

  // MASTER ALL
  var $table_master_all = '';
  var $column_order_master_all = array('id');
  var $column_search_master_all = array('code','description', 'status');
  var $order_master_all = array('id' => 'ASC');  

  private function _get_datatables_query_master_all($table)
  {
	$this->db->from($table);
      $i = 0;

      foreach ($this->column_search_master_all as $row)
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

              if(count($this->column_search_master_all) - 1 == $i)
                  $this->db->group_end();
          }
          $i++;
      }

      if(isset($_POST['order']))
      {
          $this->db->order_by($this->column_order_master_all[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
      }
      else if(isset($this->order))
      {
          $order_master_all = $this->order;
          $this->db->order_by(key($order_master_all), $order_master_all[key($order)]);
      }
  }

	public function Get_All_master_all($table)
	{
		$this->_get_datatables_query_master_all($table);
    if($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
	}

  public function count_filtered_master_all($table)
  {
    $this->_get_datatables_query_master_all($table);
    $query = $this->db->get();
    return $query->num_rows();
  }

  public function count_all_master_all($table)
  {
    $this->db->from($table);
    return $this->db->count_all_results();
  }

}
