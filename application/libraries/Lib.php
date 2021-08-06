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
	function waktu_lalu($timestamp)
	{
		$selisih = time() - strtotime($timestamp) ;
		$detik = $selisih ;
		$menit = round($selisih / 60 );
		$jam = round($selisih / 3600 );
		$hari = round($selisih / 86400 );
		$minggu = round($selisih / 604800 );
		$bulan = round($selisih / 2419200 );
		$tahun = round($selisih / 29030400 );
		if ($detik <= 60) {
				$waktu = $detik.' seconds ago';
		} else if ($menit <= 60) {
				$waktu = $menit.' minutes ago';
		} else if ($jam <= 24) {
				$waktu = $jam.' hours ago';
		} else if ($hari <= 7) {
				$waktu = $hari.' days ago';
		} else if ($minggu <= 4) {
				$waktu = $minggu.' weeks ago';
		} else if ($bulan <= 12) {
				$waktu = $bulan.' months ago';
		} else {
				$waktu = $tahun.' years ago';
		}
		return $waktu;
	}
	function date_indo($tanggal){
		if ($tanggal == '0000-00-00') {
			return "-";
		}
		return date('d-m-Y', strtotime($tanggal));
 }
 
   


}

/* End of file Lib.php */
/* Location: ./application/libraries/Lib.php */
