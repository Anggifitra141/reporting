<style>
  .modal-title{
    margin-top: -10px;
  }
</style>

<section class="section">
  <div class="section-header">
    <h1>Data QRIS Merchant</h1>
  </div>

  <div class="section-body">
    <h2 class="section-title">Manage Data QRIS Merchant</h2>
    
    <div class="row">
      <div class="col-12">
        <div class="form-group">
          <a href="#" onclick="add_qris_merchant()" class="btn btn-icon icon-left btn-outline-primary"><i class="far fa-plus-square"></i> Add</a>
          <a href="#" onclick="import_data()" class="btn btn-icon icon-left btn-outline-success"><i class="far fa-file-excel"></i> Import Data</a>
          <a href="<?= base_url('assets/template-excel/template-import-qris-merchant.xlsx') ?>" download class="btn float-right btn-icon icon-left btn-success"><i class="fas fa-download"></i> Download Sample</a>
        </div>
      </div>
      <div class="col-12">
        <div class="card">
          <div class="card-body">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>Trx Date Upload</label>
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
            <div class="row mt-4" >
              <div class="col-md-12">
                <div class="">
                  <table class="table table-striped" id="table" style="width: 100%;">
                    <thead>
                      <tr>
                        <th class="text-center" width="1px">
                          No
                        </th>
                        <th>Action</th>
                        <th>Merchant Name</th>
                        <th>City</th>
                        <th>Mcc</th>
                        <th>Merchant Criteria</th>
                        <th>Merchant Status</th>
                        <th>Activation Period</th>
                        <th>TRX Date</th>
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
<div class="modal fade" tabindex="-1" role="dialog" id="modal_qris_merchant">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <h5 class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="qris_merchant">
          <input type="hidden" name="id">
          <div class="form-body">
            <div class="form-group">
              <label>Merchant Name</label>
              <input type="text" class="form-control" name="merchant_name">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>City</label>
              <input type="text" class="form-control" name="city">
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Mcc</label>
              <select name="mcc" id="mcc" class="form-control select2">
                <!-- <option value="">-- Select MCC --</option>
                <?php foreach($mcc as $key) :  ?>
                  <option value="<?= $key->mcc ?>"><?= $key->mcc .' - '. $key->mcc_name ?></option>
                <?php endforeach; ?> -->
              </select>
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Merchant Criteria</label>
              <select name="merchant_criteria" id="merchant_criteria" class="form-control select2">
                <option value="">-- Select Merchant Criteria --</option>
                <?php foreach($merchant_criteria as $key) :  ?>
                  <option value="<?= $key->code ?>"><?= $key->code .' - '. $key->description ?></option>
                <?php endforeach; ?>
              </select>
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Merchant Status</label>
              <select name="merchant_status" id="merchant_status" class="form-control">
                <option value="Active">Active</option>
                <option value="Not Active">Not Active</option>
              </select>
              <span class="invalid-feedback"></span>
            </div>
            <div class="form-group">
              <label>Activation Period</label>
              <input type="date" class="form-control" name="activation_peroid">
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

<div class="modal fade" tabindex="-1" role="dialog" id="modal_import_qris_merchant">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header  bg-primary text-white">
        <h5 class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" id="form_import_qris_merchant" enctype="multipart/form-data">
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
var base_url = "<?= base_url() ?>";
$('#nav-data-clean').addClass('dropdown active');
$('#nav-clean-qris').addClass('active');
$('#nav-clean-qris-merchant').addClass('active');

  $("input").change(function(){
      $(this).removeClass('is-invalid');
      $(this).next().empty();
  });
  $(document).ready(function() {

     table = $('#table').DataTable({
      "deferRender": true,
      "scrollCollapse": true,
      "scrollX": true,
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        url: "<?php echo site_url('clean/ajax_list_qris_merchant_clean')?>", // json dataclean
        type: "POST",
        data: function(data) {
              data.daterange = $('[name="daterange"]').val();
          }
      },
      "columnDefs": [{
        "orderable": false
      }],
    });

    $.ajax({
      url  : base_url + 'clean/get_qrismcc',
      type : 'GET',
      dataType : 'JSON',
      success : function(response)
      {
        var str = `<option value="">-- Select MCC --</option>`;
        $.each(response, function(index, val){
          str += `
            <option value="${val.id}">${val.mcc} - ${val.mcc_name}</option>
          `;
        });
        $('#mcc').html(str);
      }
    })

  });
  const showLoading = function() {
  swal({
    title: 'Now loading',
    allowEscapeKey: false,
    allowOutsideClick: false,
    timer: 2000,
    onOpen: () => {
      swal.showLoading();
    }
  }).then(
    () => {},
    (dismiss) => {
      if (dismiss === 'timer') {
        console.log('closed by timer!!!!');
        swal({ 
          title: 'Finished!',
          type: 'success',
          timer: 2000,
          showConfirmButton: false
        })
      }
    }
  )
};

$('[name="daterange"]').change(function(){
  reload_table();
})
function reload_table() {
  table.ajax.reload(null, false);
}

  
  /* -- Action -- */
  function add_qris_merchant() {
    save_method = 'add';
    cek_privileges('add', event);
    $('.form-control').removeClass('is-invalid'); // clear error class
    $('#qris_merchant')[0].reset();
    $('#modal_qris_merchant').modal('show'); // show bootstrap modal
    $('.modal-title').text('Tambah Qris Merchant'); // Set Title to Bootstrap modal title
  }

  function import_data() {
    cek_privileges('add', event);
    $('.form-control').removeClass('is-invalid'); // clear error class
    $('#form_import_qris_merchant')[0].reset();
    $('#modal_import_qris_merchant').modal('show'); // show bootstrap modal
    $('.modal-title').text('Import Qris Merchant'); // Set Title to Bootstrap modal title
  }

  function get_qris_merchant(id) {
    cek_privileges('update', event);
    save_method = 'update';
    $('#qris_merchant')[0].reset();
    $.ajax({
      url: "<?php echo site_url('clean/get_qris_merchant') ?>/" + id,
      type: "GET",
      dataType: "JSON",
      success: function(data) {
        $('[name="id"]').val(data.id);
        $('[name="merchant_name"]').val(data.merchant_name);
        $('[name="city"]').val(data.city);
        $('[name="mcc"]').append(`<option value="${data.mcc}" selected="selected">${data.mcc} - ${data.mcc_name}</option>`);
        $('[name="merchant_criteria"]').val(data.merchant_criteria);
        $('[name="merchant_status"]').val(data.merchant_status);
        $('[name="activation_peroid"]').val(data.activation_peroid);

        $('#modal_qris_merchant').modal('show');
        $('.modal-title').text('Update QRIS Merchant');
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert('Error get data from ajax');
      }
    });
  }

function loading()
{
  swal({
          title:"Please Wait.", 
          text:"Loading...",
          icon: base_url + 'assets/img/loading.gif',
          buttons: false,      
          // closeOnClickOutside: false,
          // timer: 3000,
          //icon: "success"
      })
}
function save() {
    var url;
    if (save_method == 'add') {
      url = "<?php echo site_url('clean/add_qris_merchant') ?>";
    } else {
      url = "<?php echo site_url('clean/update_qris_merchant') ?>";
    }
    // ajax adding data to database
    $.ajax({
      url: url,
      type: "POST",
      data: $('#qris_merchant').serialize(),
      dataType: "JSON",
      success: function(data, response) {
        if (data.status) //if success close modal and reload ajax table
        {
          $('#btnSave').text('save'); //change button text
          $('#btnSave').attr('disabled', false); //set button enable 
          //if success close modal and reload ajax table
          $('#modal_qris_merchant').modal('hide');
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

  function delete_qris_merchant(id) {
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
            url: "<?php echo site_url('clean/delete_qris_merchant') ?>/" + id,
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
    var formData = new FormData($('#form_import_qris_merchant')[0]);
    $.ajax({
      url: "<?= site_url('clean/import_qris_merchant') ?>",
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
          $('#modal_import_qris_merchant').modal('hide');
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