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
    <h1>LKPBU FORM 303</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage Report LKPBU FORM 303</h2>

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
                        <th  rowspan="2" class="text-center">Jenis Data</th>
                        <th rowspan="2" class="text-center">Jenis Kartu</th>
                        <th class="text-center" colspan="2">Transaksi</th>
                      </tr>
                      <tr>
                        <th>Volume</th>
                        <th>NIlai</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                      	<td>500-Uang Elektronik</td>
                        <td>52-Domestik (Interchange)</td>
                        <th id="volume"></th>
                        <th id="nilai"></th>
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
  $('#nav-lkpbu-report-303').addClass('active');
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
          url: "<?php echo site_url('report/ajax_list_lkpbu_303'); ?>",
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

            $('#btn-download-excel').attr('href', base_url + 'report/download_excel_lkpbu_303?daterange=' + daterange);

            $('#volume').html('<b>' + data.volume + '</b>');
            $('#nilai').html('<b>' + convertToRupiah(data.nilai) + '</b>');
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