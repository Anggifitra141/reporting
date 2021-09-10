<style>
  .modal-title {
    margin-top: -10px;
  }
  table.table>thead>tr>th,
        table.table>tbody>tr>td {
            font-size: 11px !important;
        }
</style>

<section class="section">
  <div class="section-header">
    <h1>LKPBU FORM 302</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage Report LKPBU FORM 302</h2>

    <div class="row">
      <div class="col-12">

        <div class="card">
          <div class="card-body">
            <div class="row">
              <div class="col-md-4">
                <div class="form-group">
                  <label>Date range </label>
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <div class="input-group-text">
                        <i class="fas fa-calendar"></i>
                      </div>
                    </div>
                    <input type="text" class="form-control daterange-picker" name="daterange">
                  </div>
                </div>
              </div>
              <div class="col-md-2">
                <button class="btn btn-icon btn-outline-warning btn-block" style="margin-top:27px;" id="btn-view"><i class="fas fa-eye"></i> View </button>
              </div>
              <div class="col-md-2">
                <a href="" download class="btn btn-icon btn-outline-success btn-block" style="margin-top:27px;" id="btn-download-excel"><i class="fas fa-file-excel"></i> Download Excel </a>
              </div>
            </div>
            <div class="row mt-4" id="result-data" style="display:none;">
              <div class="col-md-12">
                <div class="table-responsive">
                  <table class="table  table-bordered table-striped" id="table" style="width: 100%;">
                    <thead>
                      <tr>
                        <th colspan="2" rowspan="2" class="text-center">Jenis Data</th>
                        <th colspan="4" class="text-center">Jenis Kartu</th>
                      </tr>
                      <tr>
                        <th>Kartu ATM</th>
                        <th>Kartu ATM + Debit</th>
                        <th class="text-center" colspan="2">Kartu Elektronik (E-Money)</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td width="1%">1</td>
                        <td>Jumlah Kartu</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <th class="text-right" id="jml_kartu"></th>
                      </tr>
                      <tr>
                        <td width="1%">2</td>
                        <td>Kartu Baru</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <th class="text-right" id="kartu_baru"></th>
                      </tr>
                      <tr>
                        <td width="1%">3</td>
                        <td>Kartu Yang Tutup</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <th class="text-right" id="kartu_tutup"></th>
                      </tr>
                      <!-- <tr>
                        <td width="1%">110</td><td></td><td>-</td><td>-</td><td>-</td><th class="text-right"></th>
                      </tr>
                      <tr>
                        <td width="1%">120</td><td></td><td>-</td><td>-</td><td>-</td><th class="text-right"></th>
                      </tr>
                      <tr>
                        <td width="1%">140</td><td></td><td>-</td><td>-</td><td>-</td><th class="text-right"></th>
                      </tr>
                      <tr>
                        <td width="1%">150</td><td></td><td>-</td><td>-</td><td>-</td><th class="text-right"></th>
                      </tr>
                      <tr>
                        <td width="1%">15</td><td></td><td>-</td><td>-</td><td>-</td><th class="text-right"></th>
                      </tr>
                      <tr>
                        <td width="1%">16</td><td></td><td>-</td><td>-</td><td>-</td><th class="text-right"></th>
                      </tr>
                      <tr>
                        <td width="1%">17</td><td></td><td>-</td><td>-</td><td>-</td><th class="text-right"></th>
                      </tr>
                      <tr>
                        <td width="1%">18</td><td></td><td>-</td><td>-</td><td>-</td><th class="text-right"></th>
                      </tr>
                      <tr>
                        <td width="1%">48</td><td></td><td>-</td><td>-</td><td>-</td><th class="text-right"></th>
                      </tr>
                      <tr>
                        <td width="1%">49</td><td></td><td>-</td><td>-</td><td>-</td><th class="text-right"></th>
                      </tr>
                      <tr>
                        <td width="1%">51</td><td></td><td>-</td><td>-</td><td>-</td><th class="text-right"></th>
                      </tr> -->
                      <tr>
                        <td width="1%">52</td>
                        <td>Server Based</td>
                        <td>-</td><td>-</td><td>-</td>
                        <th class="text-right" id="server_based"></th>
                      </tr>
                      <tr>
                        <td width="1%">56</td>
                        <td>Registered</td>
                        <td>-</td><td>-</td><td>-</td>
                        <th class="text-right" id="registered"></th>
                      </tr>
                      <tr>
                        <td width="1%">57</td>
                        <td>Unregistered</td>
                        <td>-</td><td>-</td><td>-</td>
                        <th class="text-right" id="unregis"></th>
                      </tr>
                      <tr>
                        <td width="1%">70</td>
                        <td>Dana Float</td>
                        <td>-</td><td>-</td><td>-</td>
                        <th class="text-right" id="dana_float"></th>
                      </tr>
                      <!-- <tr>
                        <td width="1%">86</td><td></td><td>-</td><td>-</td><td>-</td><th class="text-right"></th>
                      </tr> -->
                      <tr>
                        <td width="1%">87</td>
                        <td>Volume Trx Blnj Domestik</td>
                        <td>-</td><td>-</td><td>-</td>
                        <th class="text-right" id="vol_trx_blnj_domestik"></th>
                      </tr>
                      <tr>
                        <td width="1%">93</td>
                        <td>Volume Transfer Antar UE</td>
                        <td>-</td><td>-</td><td>-</td>
                        <th class="text-right" id="vol_transfer_antar_ue"></th>
                      </tr>
                      <tr>
                        <td width="1%">96</td>
                        <td>Volume Inisial</td>
                        <td>-</td><td>-</td><td>-</td>
                        <th class="text-right" id="vol_inisial"></th>
                      </tr>
                      <tr>
                        <td width="1%">97</td>
                        <td>Volume Top Up/Cash In</td>
                        <td>-</td><td>-</td><td>-</td>
                        <th class="text-right" id="vol_top_up"></th>
                      </tr>
                      <!-- <tr>
                        <td width="1%">98</td><td></td><td>-</td><td>-</td><td>-</td><th class="text-right"></th>
                      </tr>
                      <tr>
                        <td width="1%">99</td><td></td><td>-</td><td>-</td><td>-</td><th class="text-right"></th>
                      </tr>
                      <tr>
                        <td width="1%">106</td><td></td><td>-</td><td>-</td><td>-</td><th class="text-right"></th>
                      </tr> -->
                      <tr>
                        <td width="1%">107</td>
                        <td>Nilai Trx Blnj Domestik</td>
                        <td>-</td><td>-</td><td>-</td>
                        <th class="text-right" id="nilai_trx_blnj_domestik"></th>
                      </tr>
                      <tr>
                        <td width="1%">113</td>
                        <td>Nilai Transfer Antar UE</td>
                        <td>-</td><td>-</td><td>-</td>
                        <th class="text-right" id="nilai_transfer_antar_ue"></th>
                      </tr>
                      <tr>
                        <td width="1%">116</td>
                        <td>Nilai Inisial</td>
                        <td>-</td><td>-</td><td>-</td>
                        <th class="text-right" id="nilai_inisial"></th>
                      </tr>
                      <tr>
                        <td width="1%">117</td>
                        <td>Nilai Top Up/Cash In</td>
                        <td>-</td><td>-</td><td>-</td>
                        <th class="text-right" id="nilai_top_up"></th>
                      </tr>
                      <!-- <tr>
                        <td width="1%">118</td><td></td><td>-</td><td>-</td><td>-</td><th class="text-right"></th>
                      </tr>
                      <tr>
                        <td width="1%">119</td><td></td><td>-</td><td>-</td><td>-</td><th class="text-right"></th>
                      </tr> -->
                      <tr>
                        <td width="1%">122</td><td>Jenis Mesin Reader UE</td><td>-</td><td>-</td><td>-</td><th class="text-right">1</th>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
<script>
  var base_url = "<?= base_url() ?>";
  var table;
  $("input").change(function() {
    $(this).removeClass('is-invalid');
    $(this).next().empty();
  });
  $('#nav-report').addClass('active');
  $('#nav-lkpbu-report').addClass('active');
  $('#nav-lkpbu-report-302').addClass('active');
  $(document).ready(function() {

    $('#btn-download-excel').hide();

    $('#btn-view').click(function() {
      $('#notif-available').hide();
      $('#result-data').hide();
      $('#btn-download-excel').show();
      $('#btn-download-excel').show();
      $('#table-data').DataTable().destroy();

      var daterange = $('[name="daterange"]').val();
      if (daterange) {

        $.ajax({
          url: "<?php echo site_url('report/ajax_list_lkpbu_302'); ?>",
          dataType: "json",
          type: "POST",
          async: false,
          data: {
            daterange: daterange,
          },
          success: function(data) {
            // console.log(data)
            // $('#table').DataTable({
            //   "destroy": true,
            //   "ordering": false
            // });
            $('#result-data').slideDown('slow');

            $('#btn-download-excel').attr('href', base_url + 'report/download_excel_lkpbu_302?daterange=' + daterange);

            $('#jml_kartu').html('<b>' + data.jml_kartu + '</b>');
            $('#dana_float').html('<b>' + convertToRupiah(data.dana_float) + '</b>');
            $('#kartu_baru').html('<b>' + data.kartu_baru + '</b>');
            $('#kartu_tutup').html('<b>' + data.kartu_tutup + '</b>');
            $('#nilai_inisial').html('<b>' + convertToRupiah(data.nilai_inisial) + '</b>');
            $('#nilai_top_up').html('<b>' + convertToRupiah(data.nilai_top_up) + '</b>');
            $('#nilai_transfer_antar_ue').html('<b>' + convertToRupiah(data.nilai_transfer_antar_ue) + '</b>');
            $('#nilai_trx_blnj_domestik').html('<b>' + convertToRupiah(data.nilai_trx_blnj_domestik) + '</b>');
            $('#registered').html('<b>' + data.registered + '</b>');
            $('#server_based').html('<b>' + data.server_based + '</b>');
            $('#unregis').html('<b>' + data.unregis + '</b>');
            $('#vol_inisial').html('<b>' + data.vol_inisial + '</b>');
            $('#vol_top_up').html('<b>' + data.vol_top_up + '</b>');
            $('#vol_transfer_antar_ue').html('<b>' + data.vol_transfer_antar_ue + '</b>');
            $('#vol_trx_blnj_domestik').html('<b>' + data.vol_trx_blnj_domestik + '</b>');
          },
          error(jqXHR, textStatus, errorThrown) {
            alert('Something wrong happened because: ' + errorThrown)
          }
        });




      } else {
        alert('Fields Is Required');
      }


    });

  });
</script>