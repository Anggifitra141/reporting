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
    <h2 class="section-title">Manage LKPBU(form 304)</h2>

    <div class="row">
      <div class="col-12">
        <div class="form-group">
          <a href="#" onclick="add_form_304()" class="btn btn-icon icon-left btn-outline-primary"><i class="far fa-plus-square"></i> Add</a>
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
                        <th>Trx Date</th>
                        <th>Jenis Mesin</th>
                        <th>Jumlah Mesin</th>
                        <th>Jumlah Pedagang</th>
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
<div class="modal fade" tabindex="-1" role="dialog" id="modal_form_304">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <h5 class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="form_304">
          <input type="hidden" name="id">
          <div class="form-body">
            <div class="form-group">
              <label>Trx Date</label>
              <input type="date" name="trx_date" class="form-control">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Jenis Mesin</label>
              <select name="machine_code" class="form-control">
                <option value="">-- Pilih Jenis Mesin --</option>
                <?php foreach ($machine_type as $key) : ?>
                  <option value="<?= $key->code ?>"><?= $key->machine ?></option>
                <?php endforeach; ?>
              </select>
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Jumlah Mesin</label>
              <input type="number" class="form-control" name="total_machine">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Jumlah Pedagang</label>
              <input type="number" class="form-control" name="total_seller">
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
  var table;
  $("input").change(function() {
    $(this).removeClass('is-invalid');
    $(this).next().empty();
  });
  $('#nav-data-clean').addClass('dropdown active');
  $('#nav-lkpbu-clean').addClass('active');
  $('#nav-lkpbu-clean-304').addClass('active');
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
        url: "<?php echo site_url('clean/ajax_list_304') ?>", // json datasource
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
  function add_form_304() {
    cek_privileges('add', event);
    save_method = 'add';
    $('.form-control').removeClass('is-invalid'); // clear error class
    $('#form_304')[0].reset();
    $('#modal_form_304').modal('show'); // show bootstrap modal
    $('.modal-title').text('Add LKPBU (form 304)'); // Set Title to Bootstrap modal title
  }

  function get_form_304(id) {
    cek_privileges('update', event);
    save_method = 'update';
    $('#form_304')[0].reset();
    $.ajax({
      url: "<?php echo site_url('clean/get_form_304') ?>/" + id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        $('[name="id"]').val(data.id);
        $('[name="machine_code"]').val(data.machine_code);
        $('[name="total_machine"]').val(data.total_machine);
        $('[name="total_seller"]').val(data.total_seller);
        $('[name="trx_date"]').val(data.trx_date);

        $('#modal_form_304').modal('show');
        $('.modal-title').text('Update LKPBU (form 304)');
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
      url = "<?php echo site_url('clean/add_form_304') ?>";
    } else {
      url = "<?php echo site_url('clean/update_form_304') ?>";
    }
    // ajax adding data to database
    $.ajax({
      url: url,
      type: "POST",
      data: $('#form_304').serialize(),
      dataType: "JSON",
      success: function(data, response) {
        if (data.status) //if success close modal and reload ajax table
        {
          $('#btnSave').text('save'); //change button text
          $('#btnSave').attr('disabled', false); //set button enable 
          //if success close modal and reload ajax table
          $('#modal_form_304').modal('hide');
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

  function delete_form_304(id) {
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
            url: "<?php echo site_url('clean/delete_form_304') ?>/" + id,
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
  }
</script>