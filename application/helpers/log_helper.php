<?php
defined('BASEPATH') OR exit('No direct script access allowed');

function helper_log($action = "", $table ="", $key_log="", $event_query=""){
    $CI =& get_instance();

    if($CI->session->userdata('username') == ""){
      $key_user = "Telesales";
    }else{
      $key_user = $CI->session->userdata('username');
    }
    // paramter
    $param['user']          = $key_user;
    $param['event_date']    = date('Y-m-d H:i:s');
    $param['action']        = $action;
    $param['table']         = $table;
    $param['key_log']       = $key_log;
    $param['event_query']   = $event_query;

    //load model log
    $CI->load->model('M_log');

    //save to database
    $CI->M_log->save_log($param);

}

function trx_log($id_user = "", $event_modul = "", $event_type = "", $record_id = "", $event_notes = "")
{
    $CI = &get_instance();
    // paramter
    $param['event_time']    = date('YmdHis');
    $param['id_user']       = $id_user;
    $param['event_modul']   = $event_modul;
    $param['event_type']    = $event_type;
    $param['record_id']     = $record_id;
    $param['event_notes']   = $event_notes;

    //load model log
    $CI->load->model('M_log');

    //save to database
    $CI->M_log->trx_log($param);
}

function user_log($id_user = "", $event_modul = "", $event_type = "", $record_id = "", $event_notes = "", $event_sql ="")
{
  $CI = &get_instance();

  // paramter
  $param['event_time']    = date('YmdHis');
  $param['id_user']       = $id_user;
  $param['ip_address']    = $_SERVER['REMOTE_ADDR'];
  $param['event_modul']   = $event_modul;
  $param['event_type']    = $event_type;
  $param['record_id']     = $record_id;
  $param['event_notes']   = $event_notes;
  $param['event_sql']     = $event_sql;

  //load model log
  $CI->load->model('M_log');

  //save to database
  $CI->M_log->user_log($param);
}
