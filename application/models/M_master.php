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
  var $column_search_ltdbb_bi_country = array('bi_code','country', 'bi_country');
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
    else if(isset($this->order_ltdbb_bi_country))
    {
      $order = $this->order_ltdbb_bi_country;
      $this->db->order_by(key($order), $order[key($order)]);
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
    $id = $this->db->insert_id();
    user_log($this->session->userdata('id'), 'LTDBB BI COUNTRY', "ADD", $id, "ADD DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'LTDBB BI COUNTRY', "ADD", $id, "ADD DATA" );
    return $id;
  }
  public function update_ltdbb_bi_country($where, $data)
  {
    $this->db->update($this->table_ltdbb_bi_country, $data, $where);
    user_log($this->session->userdata('id'), 'LTDBB BI COUNTRY', "MODIFY", $where['id'], "MODIFY DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'LTDBB BI COUNTRY', 'MODIFY', $where['id'], "MODIFY DATA");
    return $this->db->affected_rows();
  }
  public function delete_ltdbb_bi_country($id)
  {
    $this->db->where('id', $id);
    $this->db->delete($this->table_ltdbb_bi_country);
    user_log($this->session->userdata('id'), 'LTDBB BI COUNTRY', "DELETE", $id, "DELETE DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'LTDBB BI COUNTRY', "DELETE", $id, "DELETE DATA");
  }


  // START :: MASTER LTDBB_BI_CITY
  var $table_ltdbb_bi_city = 'tltdbb_bi_city';
  var $column_order_ltdbb_bi_city = array('id');
  var $column_search_ltdbb_bi_city = array('bi_code','city', 'bi_city');
  var $order_ltdbb_bi_city = array('id' => 'DESC');

  private function _get_datatables_query_ltdbb_bi_city()
  {
    $this->db->from($this->table_ltdbb_bi_city);
    $i = 0;
    foreach ($this->column_search_ltdbb_bi_city as $row)
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

        if(count($this->column_search_ltdbb_bi_city) - 1 == $i)
          $this->db->group_end();
      }
      $i++;
    }
    if(isset($_POST['order']))
    {
      $this->db->order_by($this->column_order_ltdbb_bi_city[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
    }
    else if(isset($this->order_ltdbb_bi_city))
    {
      $order = $this->order_ltdbb_bi_city;
      $this->db->order_by(key($order), $order[key($order)]);
    }
  }
  public function get_ltdbb_bi_city($id)
  {
    $this->db->from($this->table_ltdbb_bi_city);
    $this->db->where('id', $id);
    $query = $this->db->get();
    return $query->row();
  }
	public function Get_All_ltdbb_bi_city()
	{
		$this->_get_datatables_query_ltdbb_bi_city();
    if($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
	}
  public function count_filtered_ltdbb_bi_city()
  {
    $this->_get_datatables_query_ltdbb_bi_city();
    $query = $this->db->get();
    return $query->num_rows();
  }
  public function count_all_ltdbb_bi_city()
  {
    $this->db->from($this->table_ltdbb_bi_city);
    return $this->db->count_all_results();
  }
  public function add_ltdbb_bi_city($data)
  {
    $this->db->insert($this->table_ltdbb_bi_city, $data);
    $id = $this->db->insert_id();
    user_log($this->session->userdata('id'), 'LTDBB BI CITY', "ADD", $id, "ADD DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'LTDBB BI CITY', "ADD", $id, "ADD DATA" );
    return $id;
  }
  public function update_ltdbb_bi_city($where, $data)
  {
    $this->db->update($this->table_ltdbb_bi_city, $data, $where);
    user_log($this->session->userdata('id'), 'LTDBB BI CITY', "MODIFY", $where['id'], "MODIFY DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'LTDBB BI CITY', 'MODIFY', $where['id'], "MODIFY DATA");
    return $this->db->affected_rows();
  }
  public function delete_ltdbb_bi_city($id)
  {
    $this->db->where('id', $id);
    $this->db->delete($this->table_ltdbb_bi_city);
    user_log($this->session->userdata('id'), 'LTDBB BI CITY', "DELETE", $id, "DELETE DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), 'LTDBB BI CITY', "DELETE", $id, "DELETE DATA");
  }

  // END :: MASTER LTDBB_BI_CITY

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
      else if(isset($this->order_country))
      {
          $order_country = $this->order_country;
          $this->db->order_by(key($order_country), $order_country[key($order_country)]);
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
      else if(isset($this->order_master_all))
      {
          $order = $this->order_master_all;
          $this->db->order_by(key($order), $order[key($order)]);
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
  public function get_master_all($table, $id)
  {
    $this->db->from($table);
    $this->db->where('id', $id);
    $query = $this->db->get();
    return $query->row();
  }
  public function add_master_all($table, $data)
  {
    $this->db->insert($table, $data);
    $id = $this->db->insert_id();
    user_log($this->session->userdata('id'), strtoupper($table), "ADD", $id, "ADD DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), strtoupper($table), "ADD", $id, "ADD DATA" );

    return $id;
    
  }
  public function update_master_all($table, $where, $data)
  {
    $this->db->update($table, $data, $where);

    user_log($this->session->userdata('id'), strtoupper($table), "MODIFY", $where['id'], "MODIFY DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), strtoupper($table), 'MODIFY', $where['id'], "MODIFY DATA");
    return $this->db->affected_rows();
  }
  public function delete_master_all($table, $id)
  {
    $this->db->where('id', $id);
    $this->db->delete($table);
    user_log($this->session->userdata('id'), strtoupper($table), "DELETE", $id, "DELETE DATA", $this->db->last_query());
    trx_log($this->session->userdata('id'), strtoupper($table), "DELETE", $id, "DELETE DATA");
  }

}
