<?php

class M_report extends CI_model {

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

  // LTDBB
  var $t1clean_ltdbb = 't1clean_ltdbb';
  var $column_order_tltdbb = array('trx_date', 'sender_name', 'recept_name', 'trx_amount', '','','','');
  var $column_search_tltdbb = array('trx_date', 'sender_country', 'sender_city', 'recept_country', 'recept_city', 'sender_name', 'recept_name', 'trx_amount');
  var $order_tltdbb = array('id' => 'desc');

  private function _get_datatables_query_ltdbb()
  {
    $start_date = date('Ymd', strtotime(substr($this->input->post('daterange'), 0, 10)));
    $end_date =  date('Ymd', strtotime(substr($this->input->post('daterange'), 13, 23)));
    $type_report = $this->input->post('type_report');

    $this->db->where('status', "cleaned");
    $this->db->where('datestamp >=', $start_date);
    $this->db->where('datestamp <=', $end_date);

    if ($type_report == 'G001') {
      $this->db->where_in('sender_country', array('INDONESIA', '86'));
      $this->db->where_not_in('recept_country', array('INDONESIA', '86'));
    } else if ($type_report == 'G002') {
      $this->db->where_not_in('sender_country', array('INDONESIA', '86'));
      $this->db->where_in('recept_country', array('INDONESIA', '86'));
    } else if ($type_report == 'G003') {
      $this->db->where_in('sender_country', array('INDONESIA', '86'));
      $this->db->where_in('recept_country', array('INDONESIA', '86'));
    }
    $this->db->select('*');
    $this->db->from($this->t1clean_ltdbb);

    $i = 0;
    foreach ($this->column_search_tltdbb as $item) {
      if ($_POST['search']['value']) {
        if ($i === 0) {
          $this->db->group_start();
          $this->db->like($item, $_POST['search']['value']);
        } else {
          $this->db->or_like($item, $_POST['search']['value']);
        }

        if (count($this->column_search_tltdbb) - 1 == $i)
          $this->db->group_end();
      }
      $i++;
    }

    if (isset($_POST['order'])) {
      $this->db->order_by($this->column_order_tltdbb[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
    } else if (isset($this->order_tltdbb)) {
      $order_tltdbb = $this->order_tltdbb;
      $this->db->order_by(key($order_tltdbb), $order_tltdbb[key($order_tltdbb)]);
    }
  }

  function get_datatables_ltdbb()
  {
    $this->_get_datatables_query_ltdbb();
    if ($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
  }

  function count_filtered_ltdbb()
  {
    $this->_get_datatables_query_ltdbb();
    $query = $this->db->get();
    return $query->num_rows();
  }

  public function count_all_ltdbb()
  {
    $this->db->from($this->t1clean_ltdbb);
    return $this->db->count_all_results();
  }

  //SIPESAT
  var $t1clean_sipesat = 't1clean_sipesat';
  var $column_order_t1clean_sipesat = array('trx_date', 'sender_name', 'recept_name', 'trx_amount', '', '', '', '');
  var $column_search_t1clean_sipesat = array('trx_date', 'sender_country', 'sender_city', 'recept_country', 'recept_city', 'sender_name', 'recept_name', 'trx_amount');
  var $order_t1clean_sipesat = array('id' => 'desc');

  private function _get_datatables_query_t1clean_sipesat()
  {
    $start_date = date('Y-m-d', strtotime(substr($this->input->post('daterange'), 0, 10)));
    $end_date =  date('Y-m-d', strtotime(substr($this->input->post('daterange'), 13, 23)));

    $this->db->where('DATE(datestamp) >=', $start_date);
    $this->db->where('DATE(datestamp) <=', $end_date);

    $this->db->select('*');
    $this->db->from($this->t1clean_sipesat);

    $i = 0;
    foreach ($this->column_search_t1clean_sipesat as $item) {
      if ($_POST['search']['value']) {
        if ($i === 0) {
          $this->db->group_start();
          $this->db->like($item, $_POST['search']['value']);
        } else {
          $this->db->or_like($item, $_POST['search']['value']);
        }

        if (count($this->column_search_t1clean_sipesat) - 1 == $i)
          $this->db->group_end();
      }
      $i++;
    }

    if (isset($_POST['order'])) {
      $this->db->order_by($this->column_order_t1clean_sipesat[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
    } else if (isset($this->order_t1clean_sipesat)) {
      $order_t1clean_sipesat = $this->order_t1clean_sipesat;
      $this->db->order_by(key($order_t1clean_sipesat), $order_t1clean_sipesat[key($order_t1clean_sipesat)]);
    }
  }

  function get_datatables_t1clean_sipesat()
  {
    $this->_get_datatables_query_t1clean_sipesat();
    if ($_POST['length'] != -1)
    $this->db->limit($_POST['length'], $_POST['start']);
    $query = $this->db->get();
    return $query->result();
  }

  function count_filtered_t1clean_sipesat()
  {
    $this->_get_datatables_query_t1clean_sipesat();
    $query = $this->db->get();
    return $query->num_rows();
  }

  public function count_all_t1clean_sipesat()
  {
    $this->db->from($this->t1clean_sipesat);
    return $this->db->count_all_results();
  }


  // REPORT SETTINGS
	var $table = 't3report_settings';
  var $column_order = array('code', 'name');
  var $column_search = array('code', 'name');
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

  public function get_ltdbb($where="")
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

  public function get_report($id)
  {
    $this->db->from($this->table);
    $this->db->where('id', $id);
    $query = $this->db->get();
    return $query->row();
  }

  public function add_report($data)
  {
    $this->db->insert($this->table, $data);
    return $this->db->insert_id();
  }

  public function update_report($where, $data)
  {
    $this->db->update($this->table, $data, $where);
    return $this->db->affected_rows();
  }

  public function delete_report($id)
  {
    $this->db->where('id', $id);
    $this->db->delete($this->table);
  }

  public function get_report_setting($type_report)
  {
    $this->db->from('t3report_settings');
    $this->db->where('code', $type_report);
    $query = $this->db->get();
    return $query->row();
  }
  

}
