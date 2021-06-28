<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Lib
{
	protected $ci;

	public function __construct()
	{
    $this->ci =& get_instance();
    date_default_timezone_set('Asia/Jakarta');
	}

	function rupiah($angka){
		if ($angka) {
			$hasil = "Rp. " . number_format($angka,0,',','.');
		}else{
		  $hasil = "Rp. 0";
		}
    return $hasil;
  }
 
   


}

/* End of file Lib.php */
/* Location: ./application/libraries/Lib.php */
