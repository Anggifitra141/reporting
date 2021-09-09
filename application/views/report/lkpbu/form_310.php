<style>
  .modal-title {
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>LKPBU FORM 310</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage Report LKPBU FORM 310</h2>

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
                <div class="form-group">
                  <label>Date Type </label>
                  <select class="form-control" name="date_type">
                    <option value="opentime">OPEN TIME</option>
                    <option value="closetime">CLOSE TIME</option>
                  </select>
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
                  <table class="table table-striped" id="table" style="width: 100%;">
                    <thead>
                      <tr>
                        <th style="width:1px;">
                          No
                        </th>
                        <th style="width:220px;">Periodisasi Pelaporan</th>
                        <th>Jumlah</th>
                      </tr>
                    </thead>
                    <tbody>

                      <tr>
                        <td>1</td>
                        <td>101-Pengaduan yang diterima pada periode pelaporan sebelumnya Telah diselesaikan tanpa perpanjangan waktu (maks 20 hk)</td>
                        <td>-</td>
                      </tr>
                      <tr>
                        <td>2</td>
                        <td>102-Pengaduan yang diterima pada periode pelaporan sebelumnya Telah diselesaikan dengan perpanjangan waktu (maks 40 hk)</td>
                        <td>-</td>
                      </tr>
                      <tr>
                        <td>3</td>
                        <td>103-Pengaduan yang diterima pada periode pelaporan sebelumnya Telah diselesaikan melebihi perpanjangan waktu (> 40 hk)</td>
                        <td>-</td>
                      </tr>
                      <tr>
                        <td>4</td>
                        <td>104-Pengaduan yang diterima pada periode pelaporan sebelumnya Sedang dalam proses penyelesaian</td>
                        <td>-</td>
                      </tr>
                      <tr>
                        <td>5</td>
                        <td>201-Pengaduan yang diterima dalam periode pelaporan Telah diselesaikan tanpa perpanjangan waktu (maks 20 hk)</td>
                        <td><span id="count"> </span></td>
                      </tr>
                      <tr>
                        <td>6</td>
                        <td>202-Pengaduan yang diterima dalam periode pelaporan Telah diselesaikan dengan perpanjangan waktu (maks 40 hk)</td>
                        <td>-</td>
                      </tr>
                      <tr>
                        <td>7</td>
                        <td>203-Pengaduan yang diterima dalam periode pelaporan Telah diselesaikan melebihi perpanjangan waktu (> 40 hk)</td>
                        <td>-</td>
                      </tr>
                      <tr>
                        <td>8</td>
                        <td>204-Pengaduan yang diterima dalam periode pelaporan Sedang dalam proses penyelesaian</td>
                        <td>-</td>
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
  $('#nav-lkpbu-report-310').addClass('active');
  $(document).ready(function() {

    $('#btn-download-excel').hide();

    $('#btn-view').click(function() {
      $('#notif-available').hide();
      $('#result-data').hide();
      $('#btn-download-excel').show();
      $('#btn-download-excel').show();
      $('#table-data').DataTable().destroy();

      var daterange = $('[name="daterange"]').val();
      var date_type = $('[name="date_type"]').val();
      if (daterange) {

        $.ajax({
          url: "<?php echo site_url('report/ajax_list_lkpbu_310'); ?>",
          dataType: "json",
          type: "POST",
          async: false,
          data: {
            daterange: daterange,
            date_type: date_type
          },
          success: function(data) {

            $('#table').DataTable({
              "destroy": true,
              "ordering": false
            });
            $('#result-data').slideDown('slow');

            $('#btn-download-excel').attr('href', base_url + 'report/download_excel_lkpbu_310?daterange=' + daterange + '&date_type=' + date_type);

            $('#count').html('<b>' + data.count + '</b>');
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