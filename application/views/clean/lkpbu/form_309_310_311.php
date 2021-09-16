<style>
  .modal-title {
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>LKPBU</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage LKPBU(form 309, 310 & 311)</h2>

    <div class="row">
      <div class="col-12">
        <div class="form-group">
          <a href="#" onclick="add_form_309_310_311()" class="btn btn-icon icon-left btn-outline-primary"><i class="far fa-plus-square"></i> Add</a>
          <a href="#" onclick="import_data()" class="btn btn-icon icon-left btn-outline-success"><i class="far fa-file-excel"></i> Import Data</a>
          <a href="<?= base_url('assets/template-excel/template-import-f309-f310-f311.xlsx') ?>" download class="btn float-right btn-icon icon-left btn-success"><i class="fas fa-download"></i> Download Sample</a>
        </div>
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
            </div>
            <div class="row mt-4">
              <div class="col-md-12">
                <div class="">
                  <table class="table table-striped" id="table" style="width: 100%;">
                    <thead>
                      <tr>
                        <th class="text-center" width="1px">
                          No
                        </th>
                        <th style="width: 80px;">Action</th>
                        <th>Ticket No</th>
                        <th>Ticket Status</th>
                        <th>Service</th>
                        <th>Segname</th>
                        <th>Open Time</th>
                        <th>Close Time</th>
                        <th>Code 309</th>
                        <th>Code 310</th>
                        <th>Code 311</th>
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
<div class="modal fade" tabindex="-1" role="dialog" id="modal_form_309_310_311">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <h5 class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="form_309_310_311">
          <input type="hidden" name="id">
          <div class="form-body">
            <div class="form-group">
              <label>Ticket No</label>
              <input type="text" class="form-control" name="ticket_no">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Ticket Status</label>
              <input type="text" class="form-control" name="ticket_status">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Service</label>
              <input type="text" class="form-control" name="service">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Segname</label>
              <input type="text" class="form-control" name="segname">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Open Time</label>
              <input type="text" class="form-control datetimepicker" name="opentime">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Close Time</label>
              <input type="text" class="form-control datetimepicker" name="closetime">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Code 309</label>
              <input type="number" class="form-control" name="code_309">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Code 310</label>
              <input type="number" class="form-control" name="code_310">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Code 311</label>
              <input type="number" class="form-control" name="code_311">
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

<div class="modal fade" tabindex="-1" role="dialog" id="modal_import_309_310_311">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <h5 class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="form_import_309_310_311" enctype="multipart/form-data">
          <div class="form-body">
            <div class="form-group">
              <label>File</label>
              <input type="file" class="form-control" name="file_import">
              <span class="invalid-feedback"></span>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer bg-whitesmoke br">
        <button type="button" class="btn btn-secondary float-left" data-dismiss="modal">Close</button>
        <button type="button" onclick="save_import();" id="btnSaveImport" class="btn btn-outline-primary float-right">Save</button>
      </div>
    </div>
  </div>
</div>

<script src="<?php echo base_url(); ?>assets/modules/jquery.min.js"></script>
<script>
  var table;
  $("input").change(function() {
    $(this).removeClass('is-invalid');
    $(this).next().empty();
  });
  $('#nav-data-clean').addClass('dropdown active');
  $('#nav-lkpbu-clean').addClass('active');
  $('#nav-lkpbu-clean-309-310-311').addClass('active');
  $(document).ready(function() {

    table = $('#table').DataTable({
      "deferRender": true,
      "ordering": false,
      "scrollCollapse": false,
      "scrollX": false,
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        url: "<?php echo site_url('clean/ajax_list_309_310_311') ?>", // json datasource
        type: "POST",
        data: function(data) {
          data.daterange = $('[name="daterange"]').val();
        }
      },
      "columnDefs": [{
        "orderable": false
      }],
    });

  });

  /* -- Action -- */
  function add_form_309_310_311() {
    save_method = 'add';
    cek_privileges('add', event);
    $('.form-control').removeClass('is-invalid'); // clear error class
    $('#form_309_310_311')[0].reset();
    $('#modal_form_309_310_311').modal('show'); // show bootstrap modal
    $('.modal-title').text('Import LKPBU (form 309_310_311)'); // Set Title to Bootstrap modal title
  }

  function import_data() {
    cek_privileges('add', event);
    $('.form-control').removeClass('is-invalid'); // clear error class
    $('#form_import_309_310_311')[0].reset();
    $('#modal_import_309_310_311').modal('show'); // show bootstrap modal
    $('.modal-title').text('Add LKPBU (form 309_310_311)'); // Set Title to Bootstrap modal title
  }

  function get_form_309_310_311(id) {
    cek_privileges('update', event);
    save_method = 'update';
    $('#form_309_310_311')[0].reset();
    $.ajax({
      url: "<?php echo site_url('clean/get_form_309_310_311') ?>/" + id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        $('[name="id"]').val(data.id);
        $('[name="ticket_no"]').val(data.ticket_no);
        $('[name="ticket_status"]').val(data.ticket_status);
        $('[name="service"]').val(data.service);
        $('[name="segname"]').val(data.segname);
        $('[name="opentime"]').val(data.opentime);
        $('[name="closetime"]').val(data.closetime);
        $('[name="code_309"]').val(data.code_309);
        $('[name="code_310"]').val(data.code_310);
        $('[name="code_311"]').val(data.code_311);

        $('#modal_form_309_310_311').modal('show');
        $('.modal-title').text('Update LKPBU (form 309, 310 Dan 311)');
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
      url = "<?php echo site_url('clean/add_form_309_310_311') ?>";
    } else {
      url = "<?php echo site_url('clean/update_form_309_310_311') ?>";
    }
    // ajax adding data to database
    $.ajax({
      url: url,
      type: "POST",
      data: $('#form_309_310_311').serialize(),
      dataType: "JSON",
      success: function(data, response) {
        if (data.status) //if success close modal and reload ajax table
        {
          $('#btnSave').text('save'); //change button text
          $('#btnSave').attr('disabled', false); //set button enable 
          //if success close modal and reload ajax table
          $('#modal_form_309_310_311').modal('hide');
          iziToast.success({
            title: 'Success !',
            message: 'Data saved successfully ',
            position: 'topRight'
          });
          reload_table();
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

  function delete_form_309_310_311(id) {
    cek_privileges('delete', event);
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
            url: "<?php echo site_url('clean/delete_form_309_310_311') ?>/" + id,
            type: "post",
            complete: function() {
              swal("Your data has been deleted!", {
                icon: "success",
              }).then(function() {
                reload_table();
              });
            }
          });

        } else {
          swal("Data failed deleted !");
        }
      });
  }

  function save_import() {
    $('#btnSaveImport').html('<i class="fa fa-spinner fa-spin"></i> saving...');
    $('#btnSaveImport').attr('disabled', true);
    var formData = new FormData($('#form_import_309_310_311')[0]);
    $.ajax({
      url: "<?= site_url('clean/import_309_310_311') ?>",
      type: "POST",
      data: formData,
      contentType: false,
      processData: false,
      dataType: "JSON",
      success: function(data) {
        if (data.status) {
          // notifikasi('success', data.message);
          iziToast.success({
            title: 'Success !',
            message: 'Import Data successfully ',
            position: 'topRight'
          });
          reload_table();
          $('[name="file_import"]').val();
          $('#modal_import_309_310_311').modal('hide');
        } else {
          for (var i = 0; i < data.inputerror.length; i++) {
            $('[name="' + data.inputerror[i] + '"]').parent().addClass('has-error');
            $('[name="' + data.inputerror[i] + '"]').next().text(data.error_string[i]);
          }
        }
        $('#btnSaveImport').html('<i class="fas fa-upload"></i> Upload');
        $('#btnSaveImport').attr('disabled', false);
      }
    });
  }
</script>