<style>
  .modal-title {
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>LKPBU FORM 306</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Laporan Alat Pembayaran Menggunakan Kartu</h2>

    <div class="row">
      <div class="col-12">

        <div class="card">
          <div class="card-body">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>Trx Date </label>
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
                <div class="">
                  <table class="table table-striped" id="table" style="width: 100%;">
                    <thead>
                      <tr role="row">
                        <th colspan="4" rowspan="1" style="text-align: right;"> Actual Losses</th>
                        <th colspan="3" rowspan="1" style="text-align: center;"> Potential Losses</th>
                      </tr>
                      <tr>
                        <th class="text-center" width="1px">
                          No
                        </th>
                        <th>Jenis kartu</th>
                        <th>Jenis Penyebab Fraud</th>
                        <th>Actual Fraud Volume</th>
                        <th>Actual Fraud Nominal</th>
                        <th>Potential Fraud Volume</th>
                        <th>Potential Fraud Nominal</th>
                      </tr>
                    </thead>

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

<!-- Modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="modal_form_306">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <h5 class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="form_306">
          <input type="hidden" name="id">
          <div class="form-body">
            <div class="form-group">
              <label>Trx Date</label>
              <input type="date" name="trx_date" class="form-control">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Fraud Type</label>
              <select name="fraud_code" class="form-control">
                <option value="">-- Pilih Jenis Mesin --</option>
                <?php foreach ($fraud_type as $key) : ?>
                  <option value="<?= $key->code ?>"><?= $key->fraud ?></option>
                <?php endforeach; ?>
              </select>
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Actual Loss Vol</label>
              <input type="number" class="form-control" name="actual_loss_vol">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Actual Loss Nominal</label>
              <input type="text" class="form-control" name="actual_loss_nominal">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Potential Loss Vol</label>
              <input type="number" class="form-control" name="potential_loss_vol">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Potential Loss Nominal</label>
              <input type="text" class="form-control" name="potential_loss_nominal">
              <span class="invalid-feedback"></span>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer bg-whitesmoke br">
        <button type="button" class="btn btn-secondary float-left" data-dismiss="modal">Close</button>
        <button type="button" onclick="save();" class="btn btn-outline-primary float-right">Save</button>
      </div>
    </div>
  </div>
</div>

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
  $('#nav-lkpbu-report-306').addClass('active');
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

        //
        table = $('#table').DataTable({
          "deferRender": true,
          "ordering": false,
          "scrollCollapse": true,
          "scrollX": true,
          "processing": true,
          "serverSide": true,
          "order": [],
          "ajax": {
            url: "<?php echo site_url('report/ajax_list_lkpbu_306') ?>", // json datasource
            type: "POST",
            data: function(data) {
              data.daterange = $('[name="daterange"]').val();
            }
          },
          "columnDefs": [{
            "orderable": false
          }],

        });
        $('#result-data').slideDown('slow');

        $('#btn-download-excel').attr('href', base_url + 'report/download_excel_lkpbu_306?daterange=' + daterange);

      } else {
        alert('Fields Is Required');
      }
      // loading();  
      // setTimeout(function(){
      //   $('#result-data').show();

      // }, 1000)

    });

  });
  $('input[name="actual_loss_nominal"]').keyup(function() {
    let actual_loss_nominal = convertToAngka($(this).val());
    if (!actual_loss_nominal) {
      actual_loss_nominal = 0;
    }
    $(this).val(convertToRupiah(actual_loss_nominal));
  });
  $('input[name="potential_loss_nominal"]').keyup(function() {
    let potential_loss_nominal = convertToAngka($(this).val());
    if (!potential_loss_nominal) {
      potential_loss_nominal = 0;
    }
    $(this).val(convertToRupiah(potential_loss_nominal));
  });

  /* -- Action -- */
  function add_form_306() {
    save_method = 'add';
    $('.form-control').removeClass('is-invalid'); // clear error class
    $('#form_306')[0].reset();
    $('#modal_form_306').modal('show'); // show bootstrap modal
    $('.modal-title').text('Add LKPBU (form 306)'); // Set Title to Bootstrap modal title
  }

  function get_form_306(id) {
    save_method = 'update';
    $('#form_306')[0].reset();
    $.ajax({
      url: "<?php echo site_url('lkpbu/get_form_306') ?>/" + id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        $('[name="id"]').val(data.id);
        $('[name="fraud_code"]').val(data.fraud_code);
        $('[name="actual_loss_vol"]').val(data.actual_loss_vol);
        $('[name="actual_loss_nominal"]').val(convertToRupiah(data.actual_loss_nominal));
        $('[name="potential_loss_vol"]').val(data.potential_loss_vol);
        $('[name="potential_loss_nominal"]').val(convertToRupiah(data.potential_loss_nominal));
        $('[name="trx_date"]').val(data.trx_date);

        $('#modal_form_306').modal('show');
        $('.modal-title').text('Update LKPBU (form 306)');
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert('Error get data from ajax');
      }
    });
  }

  $('[name="daterange"]').change(function() {
    reload_table();
  })

  function reload_table() {
    table.ajax.reload(null, false);
  }

  function save() {
    var url;
    if (save_method == 'add') {
      url = "<?php echo site_url('lkpbu/add_form_306') ?>";
    } else {
      url = "<?php echo site_url('lkpbu/update_form_306') ?>";
    }
    var actual_loss_nominal = '';
    var potential_loss_nominal = '';
    if ($('[name="potential_loss_nominal"]').val()) {
      potential_loss_nominal = parseInt(convertToAngka($('[name="potential_loss_nominal"]').val()));
    }
    if ($('[name="actual_loss_nominal"]').val()) {
      actual_loss_nominal = parseInt(convertToAngka($('[name="actual_loss_nominal"]').val()));
    }
    // ajax adding data to database
    $.ajax({
      url: url,
      type: "POST",
      data: {
        id: $('[name="id"]').val(),
        trx_date: $('[name="trx_date"]').val(),
        fraud_code: $('[name="fraud_code"]').val(),
        actual_loss_vol: $('[name="actual_loss_vol"]').val(),
        potential_loss_vol: $('[name="potential_loss_vol"]').val(),
        actual_loss_nominal: actual_loss_nominal,
        potential_loss_nominal: potential_loss_nominal
      },
      dataType: "JSON",
      success: function(data, response) {
        if (data.status) //if success close modal and reload ajax table
        {
          $('#btnSave').text('save'); //change button text
          $('#btnSave').attr('disabled', false); //set button enable 
          //if success close modal and reload ajax table
          $('#modal_form_306').modal('hide');
          iziToast.success({
            title: 'Success !',
            message: 'Data saved successfully ',
            position: 'topRight'
          });
          $('#table').DataTable().ajax.reload();
          // location.reload();// for reload a page
        } else {
          for (var i = 0; i < data.inputerror.length; i++) {
            $('[name="' + data.inputerror[i] + '"]').addClass('is-invalid'); //select parent twice to select div form-group class and add has-error class
            $('[name="' + data.inputerror[i] + '"]').next().text(data.error_string[i]); //select span help-block class set text error string
          }
        }
      },
      error: function(jqXHR, textStatus, errorThrown) {
        iziToast.danger({
          title: 'Error !',
          message: 'Please try again',
          position: 'topRight'
        });
      }
    });
  }

  function delete_form_306(id) {
    var event = "<?php echo $this->session->userdata('action'); ?>";
    console.log(event)
    if (event.match(/delete/g)) {
      swal({
          title: "Are you sure ?",
          text: "Once deleted, you will not be able to recover this data !",
          icon: "warning",
          buttons: true,
          dangerMode: true,
        })
        .then((willDelete) => {
          if (willDelete) {
            $.ajax({
              url: "<?php echo site_url('lkpbu/delete_form_306') ?>/" + id,
              type: "post",
              complete: function() {
                swal("Your data has been deleted!", {
                  icon: "success",
                }).then(function() {
                  $('#table').DataTable().ajax.reload();
                });
              }
            });

          } else {
            swal("Data failed deleted !");
          }
        });
    } else {
      iziToast.error({
        title: 'Error !',
        message: 'You have no right to this action.',
        position: 'bottomCenter'
      });
    }
  }
</script>